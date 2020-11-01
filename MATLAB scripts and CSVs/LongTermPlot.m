%% Long term Plot
LimitMins=3:10;
Delay3Var=zeros(7,length(LimitMins));
NumGroups = 5;
AveTimespan=0;
sample=7;

figure;
hold off;
xlim([0 7]);
ylim([3 10]);
title(sprintf('Delay for 25 A/C over %d samples w.r.t runway options and delay limits',NumGroups));
zlabel('Delay (minutes)')
ylabel('Last Delay Limit (minutes)')
xlabel('LAX1    LAX2    LGB1    LBG2    SNA    ONT    BUR')
hold on;
for NG = 1:NumGroups
    for OL = 0:6    
        for LM = LimitMins
            LAdelayV2
            Delay3Var(7-OL,LM-2)= TotalDelay*60 + Delay3Var(7-OL,LM-2);
            plot3(7-OL,LM,Delay3Var(7-OL,LM-2),'ro')
        end
    end
end
%% Surf Plot

figure;
ylim([0 7]);
xlim([3 10]);
surf(3:10,1:7,Delay3Var)
title(sprintf('Delay for %d A/C over %d samples w.r.t runway options and delay limits',sample,NumGroups));
zlabel('Delay (minutes)')
xlabel('Last Delay Limit (minutes)')
ylabel('Active Airports')

figure;
ylim([0 7]);
xlim([3 10]);
surf(3:10,1:7,Delay3Var./(NumGroups*sample))
title(sprintf('Delay per A/C for %d A/C over %d samples w.r.t runway options and delay limits',sample,NumGroups));
zlabel('Delay per A/C (minutes)')
xlabel('Last Delay Limit (minutes)')
ylabel('Active Airports')

%AveTimespan
%legend('Status Quo', 'Delay Optimized')