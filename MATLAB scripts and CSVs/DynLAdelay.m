%%Dynamic LAdelay (DynLAdelay.m)
%Team J^4 + B
%Written by John Stuart

clear;

ARR=importdata('ARR.csv');  %(flights x data types)
ARRn=ARR.data;
ARRt=ARR.textdata;
%---------Include DEP in excel file-------
%-----------------------------------------
A=10; %length(ARRn); %number of aircraft
R=7; %number of runways
Dlim=15; 

% Planning horizon (time steps)
T = 24*60;
S=50;  %sample size (number of minutes assessed)
Tf=540;  %start at 9 AM
Tl=Tf+S; %end of sample
te= ARRn(:,18); %define expected time vector
start=Tf;

te_ir=zeros(A,R);

%OpType= ARRn(:,19);  %1 for arrival, 0 for departure
FAAsep=2; %average separation requirement of 1.3 minutes

% Preallocate Value Function
V = inf*ones(R*A,S,A);



%% Value Function Boundary Condition

Tdest=  [5   5  10 10 15 5  0;
         10  10 10 10 10 0  10;
         10  10 5  5  0  10 15;
         0   0  0  0  0  10 0];  %time to each destination in minutes
     
ActDest=zeros(A,1); %initialize actual destination
Origin = zeros(A,1);

% determine minimum possible arrival times for each runway without any
% traffic
Origin=randi(4,A,1);

for i = 1:A   
   % if OpType(i)=1
        ActDest(i)= 1*strcmp(ARRt(i+1+start,6),'LAX')+3*strcmp(ARRt(i+1+start,6),'LGB')+ 5*strcmp(ARRt(i+1+start,6),'SNA')+ 6*strcmp(ARRt(i+1+start,6),'ONT')+7*strcmp(ARRt(i+1+start,6),'BUR'); %determine original destination
       % if strcmp(ARRt(i+1+start,5),'orig'); %cell array of eastern origins   %determine original direction of origin
        %    Origin(i)=1;   %North
       % elseif strcmp(ARRt(i+1+start,5),'orig'); %cell array 
     %       Origin(i)=2;   %East
     %   elseif strcmp(ARRt(i+1+start,5),'orig'); %cell array
     %       Origin(i)=3;   %South
     %   else
      %      Origin(i)=1;   %West   %change later from 1 to 4
     %   end
        te_ir(i,:) =  (Tdest(Origin(i),:)-Tdest(ActDest(i)))'+te(i);  %note earliest possible arrival time for A/C i at RW r
   % else
        Origin(i)= 1*strcmp(ARRt(i+1+start,6),'LAX')+3*strcmp(ARRt(i+1+start,6),'LGB')+ 5*strcmp(ARRt(i+1+start,6),'SNA')+ 6*strcmp(ARRt(i+1+start,6),'ONT')+7*strcmp(ARRt(i+1+start,6),'BUR'); %determine original destination
      %  if or(strcmp(ARRt(i+1+start,6),'LAX'),strcmp(ARRt(i+1+start,6),'LGB'));
      %      te_ir(Origin(i):Origin(i)+1,i) =  (Tdest(Origin(i),:)-Tdest(ActDest(i))).+te(i);  %minTadmis instead of teir
      %  else
       %     te_ir(Origin(i),i) =  te(i);
        %end
  
end


    

%set initial boundary condition for delay    
    V(:,Tf,:) =  0;  %zero delay before planes show up

%assemble matrix of minimum separations
%%%% assume average minimum separation of 1 or 2 (actually 1.3 min) or
%%%% append average follow dist afterwards

 
%for each aircraft (i=1:A), for each timestep (k=1:Tf+S or T), encode each
%cell with the best option for that A/C at that time horizon on that
%runway, where -1=don't land, 0=land at earliest time te_ir, 1=land 1
%minute after te_ir, etc....
Tstar = cell(R*A,S,A);   %cell(R,S,A); ????


%% Solve Dynamic Program
for k = Tl:-1:Tf  %or T:-1:1
  for r=1:R
    PosInd=find(te_ir<k,te_ir);
    [tiLast,idL]=min(te(find(Tstar(r,k+1,:))+Tstar(find(Tstar(r,k+1,:))))); %determine last arrival time for runway
    for i=PosInd   % this should run out if all AC have landed.
        if te_ir(i,r) < (tiLast-FAAsep) %only optimize if min operation time is within time horizon
            %if OpType=1;     %arrival vs departure conditions

                step_diff = [te_ir:(tiLast-FAAsep)]-te(i);
                TotalDelay=sum(step_diff(step_diff>0)); %cost per time step
                
                %determine index among all R and A and indnxt from Tstar
                ind = sub2ind([R,A],r,i);
                ind_nxt = idN(1);
                
                %principle of optimality
                [V(ind,k,i), idx] = min([V(ind,k+1,i); c + V(idL)]); %???????   ind_nxt,k+1,i
              
           % else
                
          %  end    
               
        end
    end
  end
end
            
    