%A Forced Market Model for Delay Minimization in the LA Basin(J^4 + B)
%Title: LAdelay

%Function: Minimize delays over a given time span by manipulating 
%destination of each aircraft (bin), as well as # of holds (int) 
% and construction of additional capacity (bin).
%Then calculate expected cost of redirection for each airport and airline 
%(in terms of lost passengers/landing fees and change in fuel burn, 
%possibly including social cost of carbon) and determine an effective level
%of incentives for implementing the optimum. (or assume airports share
%profits for additional simplification i.e. LAWA annexes everything)

%Load individual flight data for given time span (peak demand hour)
ARR=importdata('ARR.csv');  %(flights x data types)
ARRn=ARR.data;
ARRt=ARR.textdata;
DEP=importdata('DEP.csv');
DEPn=DEP.data;
DEPt=ARR.textdata;

start=125;
sample=15;
N=length(ARRn(start:start+sample-1,1));
R=7;
Rcap=[3;  %LAX1     %----additional runway analysis required----
      3;  %LAX2
      2;  %LGB1
      2;  %LGB2
      2;  %SNA
      2;  %ONT
      2]; %BUR
size = ones (N,1); %create A/C size matrix
%for i=1:N %find the size of the aircraft based on tail number
%        if or(strcmp(ARRt(i,3),[TN, TN, TN]));  %must be cell array
%            Size(i) = 1; %heavy
 %       elseif or(strcmp(ARRt(i,3),[TN, TN, TN]));
   %         Size(i) = 2;  %B757
   %     elseif or(strcmp(ARRt(i,3),[TN, TN, TN]));
    %        Size(i) = 3;  %large
     %   else
      %      Size(i) = 4;  %small
       % end
%end

%create matrix of FAA separation regulations based on A/C size
FAAsep=(1/3600).*[90   120   120   120;     %rows = H->S leading in minutes
                90   90   90   120;     %cols = H->S following
                60   60   60   60;
                45   45   45   45];
T=zeros(N,N);%create minimum headway Matrix T
for i=1:N  %create matrix of lead/follow distance relationships between each A/C
    for j=1:N
        T(i,j)=FAAsep(size(i),size(j));
    end
end

%calculate expected air time assuming delays at point of origin and enroute
%time are known. Total airtime represents the expected time of arrival with
%acceptable delays. This program minimizes unacceptable delays in LA airpspace which is
%anything beyond what the airline scheduled for
te= ARRn(start:start+sample-1,18); %ARRn(start:start+sample-1,2)+ARRn(start:start+sample-1,5)./60+ARRn(start:start+sample-1,17)./60; %te=t_gateOutActual + t_TaxiOutActual + ATe

%ARRerr=te+(1/60)*floor(3*randn(length(te),1)); %Arr = data(:,1) + rand.....  random error

M=1e3; % Big M

ncons=(2*N+N*(N-1)+R); %number of constraints

c=zeros(3*N+N*R+N*(N-1)/2,1); %form cost vector
nvars=length(c); % number of variables
c(1:N)=ones(1,N);  % minimize sum of delayed arrival times

Tdest=  (1/60).*[5   5  10 10 15 5  0;
         10  10 10 10 10 0  10;
         10  10 5  5  0  10 15;
         0   0  0  0  0  10 0];  %time to each destination in minutes
     
ActDest=zeros(N,1); %initialize actual destination
Origin = zeros(N,1);

ARRt(start:start+sample-1,:)
ARRn(start:start+sample-1,:)
for i = 1:N     
    ActDest(i)= 1*strcmp(ARRt(i+1+start,6),'LAX')+3*strcmp(ARRt(i+1+start,6),'LGB')+ 5*strcmp(ARRt(i+1+start,6),'SNA')+ 6*strcmp(ARRt(i+1+start,6),'ONT')+7*strcmp(ARRt(i+1+start,6),'BUR'); %determine original destination
    if strcmp(ARRt(i+1+start,5),'orig'); %cell array of eastern origins   %determine original direction of origin
        Origin(i)=1;   %North
    elseif strcmp(ARRt(i+1+start,5),'orig'); %cell array 
        Origin(i)=2;   %East
    elseif strcmp(ARRt(i+1+start,5),'orig'); %cell array
        Origin(i)=3;   %South
    else
        Origin(i)=1;   %West   %change later from 1 to 4
    end
end

binCo=[-1 1]'; %most common block of coefficients in A matrix
DelayLim=15/60;% 10/60;   %delay limit for any aircraft in hours
H=1.5/60;    %holding pattern length in hours
clear ARR*
Aeq=zeros(2*N+R,length(c));  %initialize Aeq matrix
A=zeros(2*N+R*N*(N-1),length(c)); %initialize A matrix

beq=[zeros(length(te),1);ones(N,1);zeros(R,1)];  %initialize beq
b=[te+DelayLim;-te;zeros(R*N*(N-1),1)]; %initialize b

%% Assemble time constraints
Atcons=zeros(N,length(c));
Atcons(1:N,1:N)= -diag(ones(N,1)); %assemble t components of tcons
%Aeq(1:N,length(c)-2*N+1:length(c)-N)=-H*diag(ones(N,1)); %assemble H components of tcons
%Aeq(1:N,length(c)-N+1:length(c))=-diag(ones(N,1)); %assemble D components of tcons
A(1:N,1:N)=diag(ones(N,1)); %assemble delay limits


for i= 1:N    %find additional travel time for change of destination
    Atcons(i,N+R*(i-1)+1:N+R*i)= (Tdest(Origin(i),:)-Tdest(ActDest(i))); %assemble AT portions of tcons for NSEW
    Aeq(N+i,N+R*(i-1)+1:N+R*i)=ones(1,7);  %assemble single destination constraints for each A/C
end

%A(N+1:2*N,1:N)=-diag(ones(N,1));  %assemble minimum arrival times
A(N+1:2*N,:)=Atcons(1:N,:);  %assemble minimum arrival times

%% runway capability constraints
%for r=1:R
%
%end

%% Order Constraint Assembly

MRow=1; %start with first pair of Big M constraint rows (Mcons)
for i=1:N      %assemble t components of all time interval constraints (tcons)

    for k=1:N
        if i>k
            Tco=[T(i,k);T(k,i)];
            A((2*N+2*R*(MRow-1)+1:2*N+2*R*MRow),i)=repmat(binCo,[R,1]); %assemble t components of Mcons
            A((2*N+2*R*(MRow-1)+1:2*N+2*R*MRow),k)=-repmat(binCo,[R,1]); %assemble t components of Mcons
            A((2*N+2*R*(MRow-1)+1:2*N+2*R*MRow),N+R*(i-1)+1:N+R*i)=blkdiag(Tco,Tco,Tco,Tco,Tco,Tco,Tco);
            A((2*N+2*R*(MRow-1)+1:2*N+2*R*MRow),N+R*(k-1)+1:N+R*k)=blkdiag(Tco,Tco,Tco,Tco,Tco,Tco,Tco);
            b(2*N+2*R*(MRow-1)+1:2*N+2*R*MRow)=repmat([T(i,k);M+T(k,i)],[R,1]); %assemble order constraints in beq      
            A(2*N+(2*R*(MRow-1)+1:2*R*MRow),N+N*R+MRow)=M*repmat(binCo,[R,1]); 
            MRow=MRow+1; %iterate to next constraint set
        end
    end
end

%for i=1:R*N*(N-1)/2      %Assemble right hand side of Mcons
    
%end   

%% Additional Constraints beyond A and Aeq
holdlim=70000;  %set max number of holds
ERdelaylim=10000;  %set max amount of en route delay

lb = zeros(length(c),1); %lower bound on all variables
ub = [24*ones(N,1); ones(N*R+N*(N-1)/2,1);holdlim(ones(N,1));ERdelaylim(ones(N,1))]; %upper bound on all variables
intcon = [N+1:length(c)]'; %specify which variables are integer
    
Sched=intlinprog(c,intcon,A,b,Aeq,beq,lb,ub) %solve MILP
Diff=Sched(1:N)-te
TotalDelay=sum(Diff(Diff>0))

figure;

%% Plot Results
StatQuo=zeros(1,R);
NewDest=zeros(1,R);
for i=1:7
    StatQuo(i)=sum(ActDest==i);
    NewDest(i)=sum(Sched(N+i:R:N+N*(R-1)+i));
end
bar(1:7,[StatQuo',NewDest'])
ylabel('Number of Flights')
xlabel('LAX1    LAX2    LGB1    LBG2    SNA    ONT    BUR')
legend('Status Quo', 'Delay Optimized')
