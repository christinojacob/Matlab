clear all
close all
clc

E = 0.175; %Epsilon for Safety Margin
S=0:0.001:1;
S_s=S*(1-2*E)+E; %Scaled SOC

C1209_data=load('C1209.mat');
I_C1209=[C1209_data.I];
T_C1209=[C1209_data.Time];
OCV_C1209=[C1209_data.V]; 
C_batt_C1209=2.9765;

%SOC calculation using coulombs counting method
SOC_C1209(1)=1;
for i=2:1:length(OCV_C1209)
    SOC_C1209(i)=SOC_C1209(i-1)+abs((T_C1209(i-1)-T_C1209(i))).*I_C1209(i-1)./C_batt_C1209;
end
SOC_C1209_s=SOC_C1209*(1-2*E)+E; %Scaled SOC

C1210_data=load('C1210.mat');
I_C1210=[C1210_data.I];
T_C1210=[C1210_data.Time];
OCV_C1210=[C1210_data.V]; 
C_batt_C1210=2.9515;
 
%SOC calculation using coulombs counting method
SOC_C1210(1)=1;
for i=2:1:length(OCV_C1210)
    SOC_C1210(i)=SOC_C1210(i-1)+abs((T_C1210(i-1)-T_C1210(i))).*I_C1210(i-1)./C_batt_C1210;
end
SOC_C1210_s=SOC_C1210*(1-2*E)+E; %Scaled SOC

C1211_data=load('C1211.mat');
I_C1211=[C1211_data.I];
T_C1211=[C1211_data.Time];
OCV_C1211=[C1211_data.V]; 
C_batt_C1211=2.9405;
 
%SOC calculation using coulombs counting method
SOC_C1211(1)=1;
for i=2:1:length(OCV_C1211)
    SOC_C1211(i)=SOC_C1211(i-1)+abs((T_C1211(i-1)-T_C1211(i))).*I_C1211(i-1)./C_batt_C1211;
end
SOC_C1211_s=SOC_C1211*(1-2*E)+E; %Scaled SOC

C1212_data=load('C1212.mat');
I_C1212=[C1212_data.I];
T_C1212=[C1212_data.Time];
OCV_C1212=[C1212_data.V]; 
C_batt_C1212=2.9625;
 
%SOC calculation using coulombs counting method
SOC_C1212(1)=1;
for i=2:1:length(OCV_C1212)
    SOC_C1212(i)=SOC_C1212(i-1)+abs((T_C1212(i-1)-T_C1212(i))).*I_C1212(i-1)./C_batt_C1212;
end
SOC_C1212_s=SOC_C1212*(1-2*E)+E; %Scaled SOC


figure(1)
sgtitle('OCV-SOC plot for the four cells(Measured)') 
subplot(2,2,1)
plot(SOC_C1209,OCV_C1209); % Ploting OCV-SOC curve of the battery C1209
grid on;
title('C1209','OCV v/s SOC')
xlabel('SOC');
ylabel('OCV');

subplot(2,2,2)
plot(SOC_C1210,OCV_C1210); % Ploting OCV-SOC curve of the battery C1210
grid on;
title('C1210','OCV v/s SOC')
xlabel('SOC');
ylabel('OCV');

subplot(2,2,3)
plot(SOC_C1211,OCV_C1211); % Ploting OCV-SOC curve of the battery C1211
grid on;
title('C1211','OCV v/s SOC')
xlabel('SOC');
ylabel('OCV');
 
subplot(2,2,4)
plot(SOC_C1212,OCV_C1212); % Ploting OCV-SOC curve of the battery C1212
grid on;
title('C1212','OCV v/s SOC')
xlabel('SOC');
ylabel('OCV');

%Linear model

P_Linear_C1209 = [ones(length(SOC_C1209),1) SOC_C1209']; %Row vector of function of SOC for Linear model for battery C1209
K_Linear_C1209 = inv(P_Linear_C1209'*P_Linear_C1209)*P_Linear_C1209'*OCV_C1209; %OCV parameters vector for Linear model for battery C1209
OCV_model_Linear_C1209 = K_Linear_C1209(1)*ones(size(S')) + K_Linear_C1209(2)*S'; %Computed OCV Linear model for battery C1209
figure(2);
sgtitle('Estimated OCV-SOC of 4 cells - Linear Model') 
subplot(2,2,1)
plot(S, OCV_model_Linear_C1209),xlabel('SOC'),ylabel('Estimated OCV');
title('Battery-C1209');

P_Linear_C1210 = [ones(length(SOC_C1210),1) SOC_C1210']; %Row vector of function of SOC for Linear model for battery C1210
K_Linear_C1210 = inv(P_Linear_C1210'*P_Linear_C1210)*P_Linear_C1210'*OCV_C1210; %OCV parameters vector for Linear model for battery C1210
OCV_model_Linear_C1210 = K_Linear_C1210(1)*ones(size(S')) + K_Linear_C1210(2)*S'; %Computed OCV Linear model for battery C1210
subplot(2,2,2)
plot(S, OCV_model_Linear_C1210),xlabel('SOC'),ylabel('Estimated OCV');
title('Battery-C1210');

P_Linear_C1211 = [ones(length(SOC_C1211),1) SOC_C1211']; %Row vector of function of SOC for Linear model for battery C1211
K_Linear_C1211 = inv(P_Linear_C1211'*P_Linear_C1211)*P_Linear_C1211'*OCV_C1211; %OCV parameters vector for Linear model for battery C1211
OCV_model_Linear_C1211 = K_Linear_C1211(1)*ones(size(S')) + K_Linear_C1211(2)*S'; %Computed OCV Linear model for battery C1211
subplot(2,2,3)
plot(S, OCV_model_Linear_C1211),xlabel('SOC'),ylabel('Estimated OCV');
title('Battery-C1211');

P_Linear_C1212 = [ones(length(SOC_C1212),1) SOC_C1212']; %Row vector of function of SOC for Linear model for battery C1212
K_Linear_C1212 = inv(P_Linear_C1212'*P_Linear_C1212)*P_Linear_C1212'*OCV_C1212; %OCV parameters vector for Linear model for battery C1212
OCV_model_Linear_C1212 = K_Linear_C1212(1)*ones(size(S')) + K_Linear_C1212(2)*S'; %Computed OCV Linear model for battery C1212
subplot(2,2,4)
plot(S, OCV_model_Linear_C1212),xlabel('SOC'),ylabel('Estimated OCV');
title('Battery-C1212');



%Shepherd model

P_Shepherd_C1209 = [ones(length(SOC_C1209_s),1) 1./SOC_C1209_s']; %Row vector of function of SOC for Shepherd model for battery cell C1209
K_Shepherd_C1209 = inv(P_Shepherd_C1209'*P_Shepherd_C1209)*P_Shepherd_C1209'*OCV_C1209; %OCV parameters vector for Shepherd model for battery C1209
OCV_model_Shepherd_C1209 = K_Shepherd_C1209(1)*ones(size(S_s')) + K_Shepherd_C1209(2)*1./S_s'; %Computed OCV Shepherd model for battery cell C1209
figure(3)
sgtitle('Estimated OCV-SOC of 4 cells - Shepherd Model') 
subplot(2,2,1)
plot(S_s, OCV_model_Shepherd_C1209),xlabel('SOC'),ylabel('Estimated OCV');
title('Battery-C1209');

P_Shepherd_C1210 = [ones(length(SOC_C1210_s),1) 1./SOC_C1210_s']; %Row vector of function of SOC for Shepherd model for battery cell C1210
K_Shepherd_C1210 = inv(P_Shepherd_C1210'*P_Shepherd_C1210)*P_Shepherd_C1210'*OCV_C1210; %OCV parameters vector for Shepherd model for battery C1210
OCV_model_Shepherd_C1210 = K_Shepherd_C1210(1)*ones(size(S_s')) + K_Shepherd_C1210(2)*1./S_s'; %Computed OCV Shepherd model for battery cell C1210
subplot(2,2,2)
plot(S_s, OCV_model_Shepherd_C1210),xlabel('SOC'),ylabel('Estimated OCV');
title('Battery-C1210');

P_Shepherd_C1211 = [ones(length(SOC_C1211_s),1) 1./SOC_C1211_s']; %Row vector of function of SOC for Shepherd model for battery cell C1211
K_Shepherd_C1211 = inv(P_Shepherd_C1211'*P_Shepherd_C1211)*P_Shepherd_C1211'*OCV_C1211; %OCV parameters vector for Shepherd model for battery C1211
OCV_model_Shepherd_C1211 = K_Shepherd_C1211(1)*ones(size(S_s')) + K_Shepherd_C1211(2)*1./S_s'; %Computed OCV Shepherd model for battery cell C1211
subplot(2,2,3)
plot(S_s, OCV_model_Shepherd_C1211),xlabel('SOC'),ylabel('Estimated OCV');
title('Battery-C1211');

P_Shepherd_C1212 = [ones(length(SOC_C1212_s),1) 1./SOC_C1212_s']; %Row vector of function of SOC for Shepherd model for battery cell C1212
K_Shepherd_C1212 = inv(P_Shepherd_C1212'*P_Shepherd_C1212)*P_Shepherd_C1212'*OCV_C1212; %OCV parameters vector for Shepherd model for battery C1212
OCV_model_Shepherd_C1212 = K_Shepherd_C1212(1)*ones(size(S_s')) + K_Shepherd_C1212(2)*1./S_s'; %Computed OCV Shepherd model for battery cell C1212
subplot(2,2,4)
plot(S_s, OCV_model_Shepherd_C1212),xlabel('SOC'),ylabel('Estimated OCV');
title('Battery-C1212');



%Nernst model

P_Nernst_C1209 = [ones(length(SOC_C1209_s),1) log(SOC_C1209_s') log(1-SOC_C1209_s')]; %Row vector of function of SOC for Nernst model for battery C1209
K_Nernst_C1209 = inv(P_Nernst_C1209'*P_Nernst_C1209)*P_Nernst_C1209'*OCV_C1209; %OCV parameters vector for Nernst model for battery C1209
OCV_model_Nernst_C1209 = K_Nernst_C1209(1)*ones(length(S_s'),1) + K_Nernst_C1209(2)*(log(S_s')) + K_Nernst_C1209(3)*(log(1-S_s')); %Computed OCV Nernst model for battery C1209
figure(4)
sgtitle('Estimated OCV-SOC of 4 cells - Nernst Model') 
subplot(2,2,1)
plot(S_s, OCV_model_Nernst_C1209),xlabel('SOC'),ylabel('Estimated OCV');
title('Battery-C1209');

P_Nernst_C1210 = [ones(length(SOC_C1210_s),1) log(SOC_C1210_s') log(1-SOC_C1210_s')]; %Row vector of function of SOC for Nernst model for battery C1210
K_Nernst_C1210 = inv(P_Nernst_C1210'*P_Nernst_C1210)*P_Nernst_C1210'*OCV_C1210; %OCV parameters vector for Nernst model for battery C1210
OCV_model_Nernst_C1210 = K_Nernst_C1210(1)*ones(length(S_s'),1) + K_Nernst_C1210(2)*(log(S_s')) + K_Nernst_C1210(3)*(log(1-S_s')); %Computed OCV Nernst model for battery C1210
subplot(2,2,2)
plot(S_s, OCV_model_Nernst_C1210),xlabel('SOC'),ylabel('Estimated OCV');
title('Battery-C1210');

P_Nernst_C1211 = [ones(length(SOC_C1211_s),1) log(SOC_C1211_s') log(1-SOC_C1211_s')]; %Row vector of function of SOC for Nernst model for battery C1211
K_Nernst_C1211 = inv(P_Nernst_C1211'*P_Nernst_C1211)*P_Nernst_C1211'*OCV_C1211; %OCV parameters vector for Nernst model for battery C1211
OCV_model_Nernst_C1211 = K_Nernst_C1211(1)*ones(length(S_s'),1) + K_Nernst_C1211(2)*(log(S_s')) + K_Nernst_C1211(3)*(log(1-S_s')); %Computed OCV Nernst model for battery C1211
subplot(2,2,3)
plot(S_s, OCV_model_Nernst_C1211),xlabel('SOC'),ylabel('Estimated OCV');
title('Battery-C1211');
 
P_Nernst_C1212 = [ones(length(SOC_C1212_s),1) log(SOC_C1212_s') log(1-SOC_C1212_s')]; %Row vector of function of SOC for Nernst model for battery C1212
K_Nernst_C1212 = inv(P_Nernst_C1212'*P_Nernst_C1212)*P_Nernst_C1212'*OCV_C1212; %OCV parameters vector for Nernst model for battery C1212
OCV_model_Nernst_C1212 = K_Nernst_C1212(1)*ones(length(S_s'),1) + K_Nernst_C1212(2)*(log(S_s')) + K_Nernst_C1212(3)*(log(1-S_s')); %Computed OCV Nernst model for battery C1212
subplot(2,2,4)
plot(S_s, OCV_model_Nernst_C1212),xlabel('SOC'),ylabel('Estimated OCV');
title('C1212');
 

%Combined model

P_Combined_C1209 = [ones(length(SOC_C1209_s),1) 1./SOC_C1209_s' SOC_C1209_s' log(SOC_C1209_s') log(1-SOC_C1209_s')]; %Row vector of function of SOC for Combined model for battery C1209
K_Combined_C1209 = inv(P_Combined_C1209'*P_Combined_C1209)*P_Combined_C1209'*OCV_C1209; %OCV parameters vector for Combined model for battery C1209
OCV_model_Combined_C1209 = K_Combined_C1209(1)*ones(length(S_s'),1) + K_Combined_C1209(2)*1./S_s' + K_Combined_C1209(3)*S_s' + K_Combined_C1209(4)*(log(S_s')) + K_Combined_C1209(5)*(log(1-S_s')); %Computed OCV Combined model for battery C1209
figure(5)
sgtitle('Estimated OCV-SOC of 4 cells - Combined Model') 
subplot(2,2,1)
plot(S_s, OCV_model_Combined_C1209),xlabel('SOC'),ylabel('Estimated OCV');
title('Battery-C1209');

P_Combined_C1210 = [ones(length(SOC_C1210_s),1) 1./SOC_C1210_s' SOC_C1210_s' log(SOC_C1210_s') log(1-SOC_C1210_s')]; %Row vector of function of SOC for Combined model for battery C1210
K_Combined_C1210 = inv(P_Combined_C1210'*P_Combined_C1210)*P_Combined_C1210'*OCV_C1210; %OCV parameters vector for Combined model for battery C1210
OCV_model_Combined_C1210 = K_Combined_C1210(1)*ones(length(S_s'),1) + K_Combined_C1210(2)*1./S_s' + K_Combined_C1210(3)*S_s' + K_Combined_C1210(4)*(log(S_s')) + K_Combined_C1210(5)*(log(1-S_s')); %Computed OCV Combined model for battery C1210
subplot(2,2,2)
plot(S_s, OCV_model_Combined_C1210),xlabel('SOC'),ylabel('Estimated OCV');
title('Battery-C1210');

P_Combined_C1211 = [ones(length(SOC_C1211_s),1) 1./SOC_C1211_s' SOC_C1211_s' log(SOC_C1211_s') log(1-SOC_C1211_s')]; %Row vector of function of SOC for Combined model for battery C1211
K_Combined_C1211 = inv(P_Combined_C1211'*P_Combined_C1211)*P_Combined_C1211'*OCV_C1211; %OCV parameters vector for Combined model for battery C1211
OCV_model_Combined_C1211 = K_Combined_C1211(1)*ones(length(S_s'),1) + K_Combined_C1211(2)*1./S_s' + K_Combined_C1211(3)*S_s' + K_Combined_C1211(4)*(log(S_s')) + K_Combined_C1211(5)*(log(1-S_s')); %Computed OCV Combined model for battery C1211
subplot(2,2,3)
plot(S_s, OCV_model_Combined_C1211),xlabel('SOC'),ylabel('Estimated OCV');
title('Battery-C1211');

P_Combined_C1212 = [ones(length(SOC_C1212_s),1) 1./SOC_C1212_s' SOC_C1212_s' log(SOC_C1212_s') log(1-SOC_C1212_s')]; %Row vector of function of SOC for Combined model for battery C1212
K_Combined_C1212 = inv(P_Combined_C1212'*P_Combined_C1212)*P_Combined_C1212'*OCV_C1212; %OCV parameters vector for Combined model for battery C1212
OCV_model_Combined_C1212 = K_Combined_C1212(1)*ones(length(S_s'),1) + K_Combined_C1212(2)*1./S_s' + K_Combined_C1212(3)*S_s' + K_Combined_C1212(4)*(log(S_s')) + K_Combined_C1212(5)*(log(1-S_s')); %Computed OCV Combined model for battery C1212
subplot(2,2,4)
plot(S_s, OCV_model_Combined_C1212),xlabel('SOC'),ylabel('Estimated OCV');
title('Battery-C1212');


%Combined+3 model

P_Combinedplus3_C1209 = [ones(length(SOC_C1209_s'),1) SOC_C1209_s'.^-1 SOC_C1209_s'.^-2 SOC_C1209_s'.^-3 SOC_C1209_s'.^-4 SOC_C1209_s' log(SOC_C1209_s') log(1-SOC_C1209_s')]; %Row vector of function of SOC for Combined+3 model for battery C1209
K_Combinedplus3_C1209 = inv(P_Combinedplus3_C1209'*P_Combinedplus3_C1209)*P_Combinedplus3_C1209'*OCV_C1209; %OCV parameters vector for Combined+3 model for battery C1209
OCV_model_Combinedplus3_C1209 = K_Combinedplus3_C1209(1)*ones(length(S_s'),1) + K_Combinedplus3_C1209(2)*(1./S_s') + K_Combinedplus3_C1209(3)*(S_s'.^-2) + K_Combinedplus3_C1209(4)*(S_s'.^-3) + K_Combinedplus3_C1209(5)*(S_s'.^-4) + K_Combinedplus3_C1209(6)*S_s' + K_Combinedplus3_C1209(7)*(log(S_s')) + K_Combinedplus3_C1209(8)*(log(1-S_s')); %Computed OCV Combined+3 model for battery C1209
figure(6)
sgtitle('Estimated OCV-SOC of 4 cells - Combined+3 Model') 
subplot(2,2,1)
plot(S_s, OCV_model_Combinedplus3_C1209),xlabel('SOC'),ylabel('Estimated OCV');
title('Battery-C1209');

P_Combinedplus3_C1210 = [ones(length(SOC_C1210_s'),1) SOC_C1210_s'.^-1 SOC_C1210_s'.^-2 SOC_C1210_s'.^-3 SOC_C1210_s'.^-4 SOC_C1210_s' log(SOC_C1210_s') log(1-SOC_C1210_s')]; %Row vector of function of SOC for Combined+3 model for battery C1210
K_Combinedplus3_C1210 = inv(P_Combinedplus3_C1210'*P_Combinedplus3_C1210)*P_Combinedplus3_C1210'*OCV_C1210; %OCV parameters vector for Combined+3 model for battery C1210
OCV_model_Combinedplus3_C1210 = K_Combinedplus3_C1210(1)*ones(length(S_s'),1) + K_Combinedplus3_C1210(2)*(1./S_s') + K_Combinedplus3_C1210(3)*(S_s'.^-2) + K_Combinedplus3_C1210(4)*(S_s'.^-3) + K_Combinedplus3_C1210(5)*(S_s'.^-4) + K_Combinedplus3_C1210(6)*S_s' + K_Combinedplus3_C1210(7)*(log(S_s')) + K_Combinedplus3_C1210(8)*(log(1-S_s')); %Computed OCV Combined+3 model for battery C1210
subplot(2,2,2)
plot(S_s, OCV_model_Combinedplus3_C1210),xlabel('SOC'),ylabel('Estimated OCV');
title('Battery-C1210');

P_Combinedplus3_C1211 = [ones(length(SOC_C1211_s'),1) SOC_C1211_s'.^-1 SOC_C1211_s'.^-2 SOC_C1211_s'.^-3 SOC_C1211_s'.^-4 SOC_C1211_s' log(SOC_C1211_s') log(1-SOC_C1211_s')]; %Row vector of function of SOC for Combined+3 model for battery C1211
K_Combinedplus3_C1211 = inv(P_Combinedplus3_C1211'*P_Combinedplus3_C1211)*P_Combinedplus3_C1211'*OCV_C1211; %OCV parameters vector for Combined+3 model for battery C1211
OCV_model_Combinedplus3_C1211 = K_Combinedplus3_C1211(1)*ones(length(S_s'),1) + K_Combinedplus3_C1211(2)*(1./S_s') + K_Combinedplus3_C1211(3)*(S_s'.^-2) + K_Combinedplus3_C1211(4)*(S_s'.^-3) + K_Combinedplus3_C1211(5)*(S_s'.^-4) + K_Combinedplus3_C1211(6)*S_s' + K_Combinedplus3_C1211(7)*(log(S_s')) + K_Combinedplus3_C1211(8)*(log(1-S_s')); %Computed OCV Combined+3 model for battery C1211
subplot(2,2,3)
plot(S_s, OCV_model_Combinedplus3_C1211),xlabel('SOC'),ylabel('Estimated OCV');
title('Battery-C1211');

P_Combinedplus3_C1212 = [ones(length(SOC_C1212_s'),1) SOC_C1212_s'.^-1 SOC_C1212_s'.^-2 SOC_C1212_s'.^-3 SOC_C1212_s'.^-4 SOC_C1212_s' log(SOC_C1212_s') log(1-SOC_C1212_s')]; %Row vector of function of SOC for Combined+3 model for battery C1212
K_Combinedplus3_C1212 = inv(P_Combinedplus3_C1212'*P_Combinedplus3_C1212)*P_Combinedplus3_C1212'*OCV_C1212; %OCV parameters vector for Combined+3 model for battery C1212
OCV_model_Combinedplus3_C1212 = K_Combinedplus3_C1212(1)*ones(length(S_s'),1) + K_Combinedplus3_C1212(2)*(1./S_s') + K_Combinedplus3_C1212(3)*(S_s'.^-2) + K_Combinedplus3_C1212(4)*(S_s'.^-3) + K_Combinedplus3_C1212(5)*(S_s'.^-4) + K_Combinedplus3_C1212(6)*S_s' + K_Combinedplus3_C1212(7)*(log(S_s')) + K_Combinedplus3_C1212(8)*(log(1-S_s')); %Computed OCV Combined+3 model for battery C1212
subplot(2,2,4)
plot(S_s, OCV_model_Combinedplus3_C1212),xlabel('SOC'),ylabel('Estimated OCV');
title('Battery-C1212');
 

%Polynomial model with m=3, n=2

P_Poly_C1209 = [ones(length(SOC_C1209_s'),1) SOC_C1209_s' SOC_C1209_s'.^2 SOC_C1209_s'.^3 SOC_C1209_s'.^-1 SOC_C1209_s'.^-2]; %Row vector of function of SOC for Polynomial model for battery C1209
K_Poly_C1209 = inv(P_Poly_C1209'*P_Poly_C1209)*P_Poly_C1209'*OCV_C1209; %OCV parameters vector for Polynomial model for battery C1209
OCV_model_Poly_C1209 = K_Poly_C1209(1)*ones(length(S_s'),1) + K_Poly_C1209(2)*S_s' + K_Poly_C1209(3)*(S_s'.^2) + K_Poly_C1209(4)*(S_s'.^3) + K_Poly_C1209(5)*(S_s'.^-1) + K_Poly_C1209(6)*(S_s'.^-2); %Computed OCV Polynomial model for battery C1209
figure(7)
sgtitle('Estimated OCV-SOC of 4 cells - Polynomial Model') 
subplot(2,2,1)
plot(S_s, OCV_model_Poly_C1209),xlabel('SOC'),ylabel('Estimated OCV');
title('Battery-C1209');

P_Poly_C1210 = [ones(length(SOC_C1210_s'),1) SOC_C1210_s' SOC_C1210_s'.^2 SOC_C1210_s'.^3 SOC_C1210_s'.^-1 SOC_C1210_s'.^-2]; %Row vector of function of SOC for Polynomial model for battery C1210
K_Poly_C1210 = inv(P_Poly_C1210'*P_Poly_C1210)*P_Poly_C1210'*OCV_C1210; %OCV parameters vector for Polynomial model for battery C1210
OCV_model_Poly_C1210 = K_Poly_C1210(1)*ones(length(S_s'),1) + K_Poly_C1210(2)*S_s' + K_Poly_C1210(3)*(S_s'.^2) + K_Poly_C1210(4)*(S_s'.^3) + K_Poly_C1210(5)*(S_s'.^-1) + K_Poly_C1210(6)*(S_s'.^-2); %Computed OCV Polynomial model for battery C1210
subplot(2,2,2)
plot(S_s, OCV_model_Poly_C1210),xlabel('SOC'),ylabel('Estimated OCV');
title('Battery-C1210');

P_Poly_C1211 = [ones(length(SOC_C1211_s'),1) SOC_C1211_s' SOC_C1211_s'.^2 SOC_C1211_s'.^3 SOC_C1211_s'.^-1 SOC_C1211_s'.^-2]; %Row vector of function of SOC for Polynomial model for battery C1211
K_Poly_C1211 = inv(P_Poly_C1211'*P_Poly_C1211)*P_Poly_C1211'*OCV_C1211; %OCV parameters vector for Polynomial model for battery C1211
OCV_model_Poly_C1211 = K_Poly_C1211(1)*ones(length(S_s'),1) + K_Poly_C1211(2)*S_s' + K_Poly_C1211(3)*(S_s'.^2) + K_Poly_C1211(4)*(S_s'.^3) + K_Poly_C1211(5)*(S_s'.^-1) + K_Poly_C1211(6)*(S_s'.^-2); %Computed OCV Polynomial model for battery C1211
subplot(2,2,3)
plot(S_s, OCV_model_Poly_C1211),xlabel('SOC'),ylabel('Estimated OCV');
title('Battery-C1211');

P_Poly_C1212 = [ones(length(SOC_C1212_s'),1) SOC_C1212_s' SOC_C1212_s'.^2 SOC_C1212_s'.^3 SOC_C1212_s'.^-1 SOC_C1212_s'.^-2]; %Row vector of function of SOC for Polynomial model for battery C1212
K_Poly_C1212 = inv(P_Poly_C1212'*P_Poly_C1212)*P_Poly_C1212'*OCV_C1212; %OCV parameters vector for Polynomial model for battery C1212
OCV_model_Poly_C1212 = K_Poly_C1212(1)*ones(length(S_s'),1) + K_Poly_C1212(2)*S_s' + K_Poly_C1212(3)*(S_s'.^2) + K_Poly_C1212(4)*(S_s'.^3) + K_Poly_C1212(5)*(S_s'.^-1) + K_Poly_C1212(6)*(S_s'.^-2); %Computed OCV Polynomial model for battery C1212
subplot(2,2,4)
plot(S_s, OCV_model_Poly_C1212),xlabel('SOC'),ylabel('Estimated OCV');
title('Battery-C1212');
 

%Exponential model with m=2, n=1

P_Exp_C1209 = [ones(length(SOC_C1209_s'),1) exp(SOC_C1209_s') exp(SOC_C1209_s'.^2) exp(SOC_C1209_s'.^-1)]; %Row vector of function of SOC for Exponential model for battery C1209
K_Exp_C1209 = inv(P_Exp_C1209'*P_Exp_C1209)*P_Exp_C1209'*OCV_C1209; %OCV parameters vector for Exponential model for battery C1209
OCV_model_Exp_C1209 = K_Exp_C1209(1)*ones(length(S_s'),1) + K_Exp_C1209(2)*exp(S_s') + K_Exp_C1209(3)*exp(S_s'.^2) + K_Exp_C1209(4)*exp(S_s'.^-1); %Computed OCV Exponential model for battery C1209
figure(8)
sgtitle('Estimated OCV-SOC of 4 cells - Exponential Model') 
subplot(2,2,1)
plot(S_s, OCV_model_Exp_C1209),xlabel('SOC'),ylabel('Estimated OCV');
title('Battery-C1209');

P_Exp_C1210 = [ones(length(SOC_C1210_s'),1) exp(SOC_C1210_s') exp(SOC_C1210_s'.^2) exp(SOC_C1210_s'.^-1)]; %Row vector of function of SOC for Exponential model for battery C1210
K_Exp_C1210 = inv(P_Exp_C1210'*P_Exp_C1210)*P_Exp_C1210'*OCV_C1210; %OCV parameters vector for Exponential model for battery C1210
OCV_model_Exp_C1210 = K_Exp_C1210(1)*ones(length(S_s'),1) + K_Exp_C1210(2)*exp(S_s') + K_Exp_C1210(3)*exp(S_s'.^2) + K_Exp_C1210(4)*exp(S_s'.^-1); %Computed OCV Exponential model for battery C1210
subplot(2,2,2)
plot(S_s, OCV_model_Exp_C1210),xlabel('SOC'),ylabel('Estimated OCV');
title('Battery-C1210');

P_Exp_C1211 = [ones(length(SOC_C1211_s'),1) exp(SOC_C1211_s') exp(SOC_C1211_s'.^2) exp(SOC_C1211_s'.^-1)]; %Row vector of function of SOC for Exponential model for battery C1211
K_Exp_C1211 = inv(P_Exp_C1211'*P_Exp_C1211)*P_Exp_C1211'*OCV_C1211; %OCV parameters vector for Exponential model for battery C1211
OCV_model_Exp_C1211 = K_Exp_C1211(1)*ones(length(S_s'),1) + K_Exp_C1211(2)*exp(S_s') + K_Exp_C1211(3)*exp(S_s'.^2) + K_Exp_C1211(4)*exp(S_s'.^-1); %Computed OCV Exponential model for battery C1211
subplot(2,2,3)
plot(S_s, OCV_model_Exp_C1211),xlabel('SOC'),ylabel('Estimated OCV');
title('Battery-C1211');

P_Exp_C1212 = [ones(length(SOC_C1212_s'),1) exp(SOC_C1212_s') exp(SOC_C1212_s'.^2) exp(SOC_C1212_s'.^-1)]; %Row vector of function of SOC for Exponential model for battery C1212
K_Exp_C1212 = inv(P_Exp_C1212'*P_Exp_C1212)*P_Exp_C1212'*OCV_C1212; %OCV parameters vector for Exponential model for battery C1212
OCV_model_Exp_C1212 = K_Exp_C1212(1)*ones(length(S_s'),1) + K_Exp_C1212(2)*exp(S_s') + K_Exp_C1212(3)*exp(S_s'.^2) + K_Exp_C1212(4)*exp(S_s'.^-1); %Computed OCV Exponential model for battery C1212
subplot(2,2,4)
plot(S_s, OCV_model_Exp_C1212),xlabel('SOC'),ylabel('Estimated OCV');
title('Battery-C1212');


%Error for Linear Model 

OCV_model_Linear_C1209_CCSOC= P_Linear_C1209*K_Linear_C1209;
N_Linear_C1209=numel(P_Linear_C1209);
M_Linear_C1209=numel(K_Linear_C1209);
V_bar_Linear_C1209 = (1/N_Linear_C1209)*(sum(OCV_model_Linear_C1209_CCSOC));
BF_Linear_C1209 = (1-(norm(OCV_model_Linear_C1209_CCSOC - OCV_C1209)/norm(OCV_C1209 - V_bar_Linear_C1209)))*100;
RF_Linear_C1209 = (1-(norm(OCV_model_Linear_C1209_CCSOC - OCV_C1209).^2/norm(OCV_C1209 - V_bar_Linear_C1209).^2))*100;
ME_Linear_C1209 = max(abs(OCV_C1209 - OCV_model_Linear_C1209_CCSOC));
RMS_Linear_C1209 = norm(OCV_C1209 - OCV_model_Linear_C1209_CCSOC) / sqrt(N_Linear_C1209-M_Linear_C1209);
AIC_Linear_C1209 = N_Linear_C1209*log(sum((OCV_C1209 - OCV_model_Linear_C1209_CCSOC).^2)/N_Linear_C1209) + 2*(M_Linear_C1209+1);

OCV_model_Linear_C1210_CCSOC= P_Linear_C1210*K_Linear_C1210;
N_Linear_C1210=numel(P_Linear_C1210);
M_Linear_C1210=numel(K_Linear_C1210);
V_bar_Linear_C1210 = (1/N_Linear_C1210)*(sum(OCV_model_Linear_C1210_CCSOC));
BF_Linear_C1210 = (1-(norm(OCV_model_Linear_C1210_CCSOC - OCV_C1210)/norm(OCV_C1210 - V_bar_Linear_C1210)))*100;
RF_Linear_C1210 = (1-(norm(OCV_model_Linear_C1210_CCSOC - OCV_C1210).^2/norm(OCV_C1210 - V_bar_Linear_C1210).^2))*100;
ME_Linear_C1210 = max(abs(OCV_C1210 - OCV_model_Linear_C1210_CCSOC));
RMS_Linear_C1210 = norm(OCV_C1210 - OCV_model_Linear_C1210_CCSOC) / sqrt(N_Linear_C1210-M_Linear_C1210);
AIC_Linear_C1210 = N_Linear_C1210*log(sum((OCV_C1210 - OCV_model_Linear_C1210_CCSOC).^2)/N_Linear_C1210) + 2*(M_Linear_C1210+1);

OCV_model_Linear_C1211_CCSOC= P_Linear_C1211*K_Linear_C1211;
N_Linear_C1211=numel(P_Linear_C1211);
M_Linear_C1211=numel(K_Linear_C1211);
V_bar_Linear_C1211 = (1/N_Linear_C1211)*(sum(OCV_model_Linear_C1211_CCSOC));
BF_Linear_C1211 = (1-(norm(OCV_model_Linear_C1211_CCSOC - OCV_C1211)/norm(OCV_C1211 - V_bar_Linear_C1211)))*100;
RF_Linear_C1211 = (1-(norm(OCV_model_Linear_C1211_CCSOC - OCV_C1211).^2/norm(OCV_C1211 - V_bar_Linear_C1211).^2))*100;
ME_Linear_C1211 = max(abs(OCV_C1211 - OCV_model_Linear_C1211_CCSOC));
RMS_Linear_C1211 = norm(OCV_C1211 - OCV_model_Linear_C1211_CCSOC) / sqrt(N_Linear_C1211-M_Linear_C1211);
AIC_Linear_C1211 = N_Linear_C1211*log(sum((OCV_C1211 - OCV_model_Linear_C1211_CCSOC).^2)/N_Linear_C1211) + 2*(M_Linear_C1211+1);

 OCV_model_Linear_C1212_CCSOC= P_Linear_C1212*K_Linear_C1212;
N_Linear_C1212=numel(P_Linear_C1212);
M_Linear_C1212=numel(K_Linear_C1212);
V_bar_Linear_C1212 = (1/N_Linear_C1212)*(sum(OCV_model_Linear_C1212_CCSOC));
BF_Linear_C1212 = (1-(norm(OCV_model_Linear_C1212_CCSOC - OCV_C1212)/norm(OCV_C1212 - V_bar_Linear_C1212)))*100;
RF_Linear_C1212 = (1-(norm(OCV_model_Linear_C1212_CCSOC - OCV_C1212).^2/norm(OCV_C1212 - V_bar_Linear_C1212).^2))*100;
ME_Linear_C1212 = max(abs(OCV_C1212 - OCV_model_Linear_C1212_CCSOC));
RMS_Linear_C1212 = norm(OCV_C1212 - OCV_model_Linear_C1212_CCSOC) / sqrt(N_Linear_C1212-M_Linear_C1212);
AIC_Linear_C1212 = N_Linear_C1212*log(sum((OCV_C1212 - OCV_model_Linear_C1212_CCSOC).^2)/N_Linear_C1212) + 2*(M_Linear_C1212+1);


%Error for Shepherd Model

OCV_model_Shepherd_C1209_CCSOC = P_Shepherd_C1209 * K_Shepherd_C1209; %Computed OCV Shepherd model for given SOC of battery cell C1209
N_Shepherd_C1209 = numel(OCV_model_Shepherd_C1209_CCSOC);
M_Shepherd_C1209 = numel(K_Shepherd_C1209);
V_bar_Shepherd_C1209 = (1/N_Shepherd_C1209)*(sum(OCV_model_Shepherd_C1209_CCSOC));
BF_Shepherd_C1209 = (1-(norm(OCV_model_Shepherd_C1209_CCSOC - OCV_C1209)/norm(OCV_C1209 - V_bar_Shepherd_C1209)))*100;
RF_Shepherd_C1209 = (1-(norm(OCV_model_Shepherd_C1209_CCSOC - OCV_C1209).^2/norm(OCV_C1209 - V_bar_Shepherd_C1209).^2))*100;
ME_Shepherd_C1209 = max(abs(OCV_C1209 - OCV_model_Shepherd_C1209_CCSOC));
RMS_Shepherd_C1209 = norm(OCV_C1209 - OCV_model_Shepherd_C1209_CCSOC) / sqrt(N_Shepherd_C1209-M_Shepherd_C1209);
AIC_Shepherd_C1209 = N_Shepherd_C1209*log(sum((OCV_C1209 - OCV_model_Shepherd_C1209_CCSOC).^2)/N_Shepherd_C1209) + 2*(M_Shepherd_C1209+1);

OCV_model_Shepherd_C1210_CCSOC = P_Shepherd_C1210 * K_Shepherd_C1210; %Computed OCV Shepherd model for given SOC of battery cell C1210
N_Shepherd_C1210 = numel(OCV_model_Shepherd_C1210_CCSOC);
M_Shepherd_C1210 = numel(K_Shepherd_C1210);
V_bar_Shepherd_C1210 = (1/N_Shepherd_C1210)*(sum(OCV_model_Shepherd_C1210_CCSOC));
BF_Shepherd_C1210 = (1-(norm(OCV_model_Shepherd_C1210_CCSOC - OCV_C1210)/norm(OCV_C1210 - V_bar_Shepherd_C1210)))*100;
RF_Shepherd_C1210 = (1-(norm(OCV_model_Shepherd_C1210_CCSOC - OCV_C1210).^2/norm(OCV_C1210 - V_bar_Shepherd_C1210).^2))*100;
ME_Shepherd_C1210 = max(abs(OCV_C1210 - OCV_model_Shepherd_C1210_CCSOC));
RMS_Shepherd_C1210 = norm(OCV_C1210 - OCV_model_Shepherd_C1210_CCSOC) / sqrt(N_Shepherd_C1210-M_Shepherd_C1210);
AIC_Shepherd_C1210 = N_Shepherd_C1210*log(sum((OCV_C1210 - OCV_model_Shepherd_C1210_CCSOC).^2)/N_Shepherd_C1210) + 2*(M_Shepherd_C1210+1);

OCV_model_Shepherd_C1211_CCSOC = P_Shepherd_C1211 * K_Shepherd_C1211; %Computed OCV Shepherd model for given SOC of battery cell C1211
N_Shepherd_C1211 = numel(OCV_model_Shepherd_C1211_CCSOC);
M_Shepherd_C1211 = numel(K_Shepherd_C1211);
V_bar_Shepherd_C1211 = (1/N_Shepherd_C1211)*(sum(OCV_model_Shepherd_C1211_CCSOC));
BF_Shepherd_C1211 = (1-(norm(OCV_model_Shepherd_C1211_CCSOC - OCV_C1211)/norm(OCV_C1211 - V_bar_Shepherd_C1211)))*100;
RF_Shepherd_C1211 = (1-(norm(OCV_model_Shepherd_C1211_CCSOC - OCV_C1211).^2/norm(OCV_C1211 - V_bar_Shepherd_C1211).^2))*100;
ME_Shepherd_C1211 = max(abs(OCV_C1211 - OCV_model_Shepherd_C1211_CCSOC));
RMS_Shepherd_C1211 = norm(OCV_C1211 - OCV_model_Shepherd_C1211_CCSOC) / sqrt(N_Shepherd_C1211-M_Shepherd_C1211);
AIC_Shepherd_C1211 = N_Shepherd_C1211*log(sum((OCV_C1211 - OCV_model_Shepherd_C1211_CCSOC).^2)/N_Shepherd_C1211) + 2*(M_Shepherd_C1211+1);
 
OCV_model_Shepherd_C1212_CCSOC = P_Shepherd_C1212 * K_Shepherd_C1212; %Computed OCV Shepherd model for given SOC of battery cell C1212
N_Shepherd_C1212 = numel(OCV_model_Shepherd_C1212_CCSOC);
M_Shepherd_C1212 = numel(K_Shepherd_C1212);
V_bar_Shepherd_C1212 = (1/N_Shepherd_C1212)*(sum(OCV_model_Shepherd_C1212_CCSOC));
BF_Shepherd_C1212 = (1-(norm(OCV_model_Shepherd_C1212_CCSOC - OCV_C1212)/norm(OCV_C1212 - V_bar_Shepherd_C1212)))*100;
RF_Shepherd_C1212 = (1-(norm(OCV_model_Shepherd_C1212_CCSOC - OCV_C1212).^2/norm(OCV_C1212 - V_bar_Shepherd_C1212).^2))*100;
ME_Shepherd_C1212 = max(abs(OCV_C1212 - OCV_model_Shepherd_C1212_CCSOC));
RMS_Shepherd_C1212 = norm(OCV_C1212 - OCV_model_Shepherd_C1212_CCSOC) / sqrt(N_Shepherd_C1212-M_Shepherd_C1212);
AIC_Shepherd_C1212 = N_Shepherd_C1212*log(sum((OCV_C1212 - OCV_model_Shepherd_C1212_CCSOC).^2)/N_Shepherd_C1212) + 2*(M_Shepherd_C1212+1);


%Error for Nernst Model

OCV_model_Nernst_C1209_CCSOC = P_Nernst_C1209 * K_Nernst_C1209; %Computed OCV Nernst model for given SOC of battery cell C1209
N_Nernst_C1209 = numel(OCV_model_Nernst_C1209_CCSOC);
M_Nernst_C1209 = numel(K_Nernst_C1209);
V_bar_Nernst_C1209 = (1/N_Nernst_C1209)*(sum(OCV_model_Nernst_C1209_CCSOC));
BF_Nernst_C1209 = (1-(norm(OCV_model_Nernst_C1209_CCSOC - OCV_C1209)/norm(OCV_C1209 - V_bar_Nernst_C1209)))*100;
RF_Nernst_C1209 = (1-(norm(OCV_model_Nernst_C1209_CCSOC - OCV_C1209).^2/norm(OCV_C1209 - V_bar_Nernst_C1209).^2))*100;
ME_Nernst_C1209 = max(abs(OCV_C1209 - OCV_model_Nernst_C1209_CCSOC));
RMS_Nernst_C1209 = norm(OCV_C1209 - OCV_model_Nernst_C1209_CCSOC) / sqrt(N_Nernst_C1209-M_Nernst_C1209);
AIC_Nernst_C1209 = N_Nernst_C1209*log(sum((OCV_C1209 - OCV_model_Nernst_C1209_CCSOC).^2)/N_Nernst_C1209) + 2*(M_Nernst_C1209+1);

OCV_model_Nernst_C1210_CCSOC = P_Nernst_C1210 * K_Nernst_C1210; %Computed OCV Nernst model for given SOC of battery cell C1210
N_Nernst_C1210 = numel(OCV_model_Nernst_C1210_CCSOC);
M_Nernst_C1210 = numel(K_Nernst_C1210);
V_bar_Nernst_C1210 = (1/N_Nernst_C1210)*(sum(OCV_model_Nernst_C1210_CCSOC));
BF_Nernst_C1210 = (1-(norm(OCV_model_Nernst_C1210_CCSOC - OCV_C1210)/norm(OCV_C1210 - V_bar_Nernst_C1210)))*100;
RF_Nernst_C1210 = (1-(norm(OCV_model_Nernst_C1210_CCSOC - OCV_C1210).^2/norm(OCV_C1210 - V_bar_Nernst_C1210).^2))*100;
ME_Nernst_C1210 = max(abs(OCV_C1210 - OCV_model_Nernst_C1210_CCSOC));
RMS_Nernst_C1210 = norm(OCV_C1210 - OCV_model_Nernst_C1210_CCSOC) / sqrt(N_Nernst_C1210-M_Nernst_C1210);
AIC_Nernst_C1210 = N_Nernst_C1210*log(sum((OCV_C1210 - OCV_model_Nernst_C1210_CCSOC).^2)/N_Nernst_C1210) + 2*(M_Nernst_C1210+1);

OCV_model_Nernst_C1211_CCSOC = P_Nernst_C1211 * K_Nernst_C1211; %Computed OCV Nernst model for given SOC of battery cell C1211
N_Nernst_C1211 = numel(OCV_model_Nernst_C1211_CCSOC);
M_Nernst_C1211 = numel(K_Nernst_C1211);
V_bar_Nernst_C1211 = (1/N_Nernst_C1211)*(sum(OCV_model_Nernst_C1211_CCSOC));
BF_Nernst_C1211 = (1-(norm(OCV_model_Nernst_C1211_CCSOC - OCV_C1211)/norm(OCV_C1211 - V_bar_Nernst_C1211)))*100;
RF_Nernst_C1211 = (1-(norm(OCV_model_Nernst_C1211_CCSOC - OCV_C1211).^2/norm(OCV_C1211 - V_bar_Nernst_C1211).^2))*100;
ME_Nernst_C1211 = max(abs(OCV_C1211 - OCV_model_Nernst_C1211_CCSOC));
RMS_Nernst_C1211 = norm(OCV_C1211 - OCV_model_Nernst_C1211_CCSOC) / sqrt(N_Nernst_C1211-M_Nernst_C1211);
AIC_Nernst_C1211 = N_Nernst_C1211*log(sum((OCV_C1211 - OCV_model_Nernst_C1211_CCSOC).^2)/N_Nernst_C1211) + 2*(M_Nernst_C1211+1);
 
OCV_model_Nernst_C1212_CCSOC = P_Nernst_C1212 * K_Nernst_C1212; %Computed OCV Nernst model for given SOC of battery cell C1212
N_Nernst_C1212 = numel(OCV_model_Nernst_C1212_CCSOC);
M_Nernst_C1212 = numel(K_Nernst_C1212);
V_bar_Nernst_C1212 = (1/N_Nernst_C1212)*(sum(OCV_model_Nernst_C1212_CCSOC));
BF_Nernst_C1212 = (1-(norm(OCV_model_Nernst_C1212_CCSOC - OCV_C1212)/norm(OCV_C1212 - V_bar_Nernst_C1212)))*100;
RF_Nernst_C1212 = (1-(norm(OCV_model_Nernst_C1212_CCSOC - OCV_C1212).^2/norm(OCV_C1212 - V_bar_Nernst_C1212).^2))*100;
ME_Nernst_C1212 = max(abs(OCV_C1212 - OCV_model_Nernst_C1212_CCSOC));
RMS_Nernst_C1212 = norm(OCV_C1212 - OCV_model_Nernst_C1212_CCSOC) / sqrt(N_Nernst_C1212-M_Nernst_C1212);
AIC_Nernst_C1212 = N_Nernst_C1212*log(sum((OCV_C1212 - OCV_model_Nernst_C1212_CCSOC).^2)/N_Nernst_C1212) + 2*(M_Nernst_C1212+1);


%Error for Combined Model

OCV_model_Combined_C1209_CCSOC = P_Combined_C1209 * K_Combined_C1209; %Computed OCV Combined model for given SOC of battery cell C1209
N_Combined_C1209 = numel(OCV_model_Combined_C1209_CCSOC);
M_Combined_C1209 = numel(K_Combined_C1209);
V_bar_Combined_C1209 = (1/N_Combined_C1209)*(sum(OCV_model_Combined_C1209_CCSOC));
BF_Combined_C1209 = (1-(norm(OCV_model_Combined_C1209_CCSOC - OCV_C1209)/norm(OCV_C1209 - V_bar_Combined_C1209)))*100;
RF_Combined_C1209 = (1-(norm(OCV_model_Combined_C1209_CCSOC - OCV_C1209).^2/norm(OCV_C1209 - V_bar_Combined_C1209).^2))*100;
ME_Combined_C1209 = max(abs(OCV_C1209 - OCV_model_Combined_C1209_CCSOC));
RMS_Combined_C1209 = norm(OCV_C1209 - OCV_model_Combined_C1209_CCSOC) / sqrt(N_Combined_C1209-M_Combined_C1209);
AIC_Combined_C1209 = N_Combined_C1209*log(sum((OCV_C1209 - OCV_model_Combined_C1209_CCSOC).^2)/N_Combined_C1209) + 2*(M_Combined_C1209+1);

OCV_model_Combined_C1210_CCSOC = P_Combined_C1210 * K_Combined_C1210; %Computed OCV Combined model for given SOC of battery cell C1210
N_Combined_C1210 = numel(OCV_model_Combined_C1210_CCSOC);
M_Combined_C1210 = numel(K_Combined_C1210);
V_bar_Combined_C1210 = (1/N_Combined_C1210)*(sum(OCV_model_Combined_C1210_CCSOC));
BF_Combined_C1210 = (1-(norm(OCV_model_Combined_C1210_CCSOC - OCV_C1210)/norm(OCV_C1210 - V_bar_Combined_C1210)))*100;
RF_Combined_C1210 = (1-(norm(OCV_model_Combined_C1210_CCSOC - OCV_C1210).^2/norm(OCV_C1210 - V_bar_Combined_C1210).^2))*100;
ME_Combined_C1210 = max(abs(OCV_C1210 - OCV_model_Combined_C1210_CCSOC));
RMS_Combined_C1210 = norm(OCV_C1210 - OCV_model_Combined_C1210_CCSOC) / sqrt(N_Combined_C1210-M_Combined_C1210);
AIC_Combined_C1210 = N_Combined_C1210*log(sum((OCV_C1210 - OCV_model_Combined_C1210_CCSOC).^2)/N_Combined_C1210) + 2*(M_Combined_C1210+1);

OCV_model_Combined_C1211_CCSOC = P_Combined_C1211 * K_Combined_C1211; %Computed OCV Combined model for given SOC of battery cell C1211
N_Combined_C1211 = numel(OCV_model_Combined_C1211_CCSOC);
M_Combined_C1211 = numel(K_Combined_C1211);
V_bar_Combined_C1211 = (1/N_Combined_C1211)*(sum(OCV_model_Combined_C1211_CCSOC));
BF_Combined_C1211 = (1-(norm(OCV_model_Combined_C1211_CCSOC - OCV_C1211)/norm(OCV_C1211 - V_bar_Combined_C1211)))*100;
RF_Combined_C1211 = (1-(norm(OCV_model_Combined_C1211_CCSOC - OCV_C1211).^2/norm(OCV_C1211 - V_bar_Combined_C1211).^2))*100;
ME_Combined_C1211 = max(abs(OCV_C1211 - OCV_model_Combined_C1211_CCSOC));
RMS_Combined_C1211 = norm(OCV_C1211 - OCV_model_Combined_C1211_CCSOC) / sqrt(N_Combined_C1211-M_Combined_C1211);
AIC_Combined_C1211 = N_Combined_C1211*log(sum((OCV_C1211 - OCV_model_Combined_C1211_CCSOC).^2)/N_Combined_C1211) + 2*(M_Combined_C1211+1);

OCV_model_Combined_C1212_CCSOC = P_Combined_C1212 * K_Combined_C1212; %Computed OCV Combined model for given SOC of battery cell C1212
N_Combined_C1212 = numel(OCV_model_Combined_C1212_CCSOC);
M_Combined_C1212 = numel(K_Combined_C1212);
V_bar_Combined_C1212 = (1/N_Combined_C1212)*(sum(OCV_model_Combined_C1212_CCSOC));
BF_Combined_C1212 = (1-(norm(OCV_model_Combined_C1212_CCSOC - OCV_C1212)/norm(OCV_C1212 - V_bar_Combined_C1212)))*100;
RF_Combined_C1212 = (1-(norm(OCV_model_Combined_C1212_CCSOC - OCV_C1212).^2/norm(OCV_C1212 - V_bar_Combined_C1212).^2))*100;
ME_Combined_C1212 = max(abs(OCV_C1212 - OCV_model_Combined_C1212_CCSOC));
RMS_Combined_C1212 = norm(OCV_C1212 - OCV_model_Combined_C1212_CCSOC) / sqrt(N_Combined_C1212-M_Combined_C1212);
AIC_Combined_C1212 = N_Combined_C1212*log(sum((OCV_C1212 - OCV_model_Combined_C1212_CCSOC).^2)/N_Combined_C1212) + 2*(M_Combined_C1212+1);


%Error for Combined+3 Model

OCV_model_Combinedplus3_C1209_CCSOC = P_Combinedplus3_C1209 * K_Combinedplus3_C1209; %Computed OCV Combinedplus3 model for given SOC of battery cell C1209
N_Combinedplus3_C1209 = numel(OCV_model_Combinedplus3_C1209_CCSOC);
M_Combinedplus3_C1209 = numel(K_Combinedplus3_C1209);
V_bar_Combinedplus3_C1209 = (1/N_Combinedplus3_C1209)*(sum(OCV_model_Combinedplus3_C1209_CCSOC));
BF_Combinedplus3_C1209 = (1-(norm(OCV_model_Combinedplus3_C1209_CCSOC - OCV_C1209)/norm(OCV_C1209 - V_bar_Combinedplus3_C1209)))*100;
RF_Combinedplus3_C1209 = (1-(norm(OCV_model_Combinedplus3_C1209_CCSOC - OCV_C1209).^2/norm(OCV_C1209 - V_bar_Combinedplus3_C1209).^2))*100;
ME_Combinedplus3_C1209 = max(abs(OCV_C1209 - OCV_model_Combinedplus3_C1209_CCSOC));
RMS_Combinedplus3_C1209 = norm(OCV_C1209 - OCV_model_Combinedplus3_C1209_CCSOC) / sqrt(N_Combinedplus3_C1209-M_Combinedplus3_C1209);
AIC_Combinedplus3_C1209 = N_Combinedplus3_C1209*log(sum((OCV_C1209 - OCV_model_Combinedplus3_C1209_CCSOC).^2)/N_Combinedplus3_C1209) + 2*(M_Combinedplus3_C1209+1);

OCV_model_Combinedplus3_C1210_CCSOC = P_Combinedplus3_C1210 * K_Combinedplus3_C1210; %Computed OCV Combinedplus3 model for given SOC of battery cell C1210
N_Combinedplus3_C1210 = numel(OCV_model_Combinedplus3_C1210_CCSOC);
M_Combinedplus3_C1210 = numel(K_Combinedplus3_C1210);
V_bar_Combinedplus3_C1210 = (1/N_Combinedplus3_C1210)*(sum(OCV_model_Combinedplus3_C1210_CCSOC));
BF_Combinedplus3_C1210 = (1-(norm(OCV_model_Combinedplus3_C1210_CCSOC - OCV_C1210)/norm(OCV_C1210 - V_bar_Combinedplus3_C1210)))*100;
RF_Combinedplus3_C1210 = (1-(norm(OCV_model_Combinedplus3_C1210_CCSOC - OCV_C1210).^2/norm(OCV_C1210 - V_bar_Combinedplus3_C1210).^2))*100;
ME_Combinedplus3_C1210 = max(abs(OCV_C1210 - OCV_model_Combinedplus3_C1210_CCSOC));
RMS_Combinedplus3_C1210 = norm(OCV_C1210 - OCV_model_Combinedplus3_C1210_CCSOC) / sqrt(N_Combinedplus3_C1210-M_Combinedplus3_C1210);
AIC_Combinedplus3_C1210 = N_Combinedplus3_C1210*log(sum((OCV_C1210 - OCV_model_Combinedplus3_C1210_CCSOC).^2)/N_Combinedplus3_C1210) + 2*(M_Combinedplus3_C1210+1);
 
OCV_model_Combinedplus3_C1211_CCSOC = P_Combinedplus3_C1211 * K_Combinedplus3_C1211; %Computed OCV Combinedplus3 model for given SOC of battery cell C1211
N_Combinedplus3_C1211 = numel(OCV_model_Combinedplus3_C1211_CCSOC);
M_Combinedplus3_C1211 = numel(K_Combinedplus3_C1211);
V_bar_Combinedplus3_C1211 = (1/N_Combinedplus3_C1211)*(sum(OCV_model_Combinedplus3_C1211_CCSOC));
BF_Combinedplus3_C1211 = (1-(norm(OCV_model_Combinedplus3_C1211_CCSOC - OCV_C1211)/norm(OCV_C1211 - V_bar_Combinedplus3_C1211)))*100;
RF_Combinedplus3_C1211 = (1-(norm(OCV_model_Combinedplus3_C1211_CCSOC - OCV_C1211).^2/norm(OCV_C1211 - V_bar_Combinedplus3_C1211).^2))*100;
ME_Combinedplus3_C1211 = max(abs(OCV_C1211 - OCV_model_Combinedplus3_C1211_CCSOC));
RMS_Combinedplus3_C1211 = norm(OCV_C1211 - OCV_model_Combinedplus3_C1211_CCSOC) / sqrt(N_Combinedplus3_C1211-M_Combinedplus3_C1211);
AIC_Combinedplus3_C1211 = N_Combinedplus3_C1211*log(sum((OCV_C1211 - OCV_model_Combinedplus3_C1211_CCSOC).^2)/N_Combinedplus3_C1211) + 2*(M_Combinedplus3_C1211+1);

OCV_model_Combinedplus3_C1212_CCSOC = P_Combinedplus3_C1212 * K_Combinedplus3_C1212; %Computed OCV Combinedplus3 model for given SOC of battery cell C1212
N_Combinedplus3_C1212 = numel(OCV_model_Combinedplus3_C1212_CCSOC);
M_Combinedplus3_C1212 = numel(K_Combinedplus3_C1212);
V_bar_Combinedplus3_C1212 = (1/N_Combinedplus3_C1212)*(sum(OCV_model_Combinedplus3_C1212_CCSOC));
BF_Combinedplus3_C1212 = (1-(norm(OCV_model_Combinedplus3_C1212_CCSOC - OCV_C1212)/norm(OCV_C1212 - V_bar_Combinedplus3_C1212)))*100;
RF_Combinedplus3_C1212 = (1-(norm(OCV_model_Combinedplus3_C1212_CCSOC - OCV_C1212).^2/norm(OCV_C1212 - V_bar_Combinedplus3_C1212).^2))*100;
ME_Combinedplus3_C1212 = max(abs(OCV_C1212 - OCV_model_Combinedplus3_C1212_CCSOC));
RMS_Combinedplus3_C1212 = norm(OCV_C1212 - OCV_model_Combinedplus3_C1212_CCSOC) / sqrt(N_Combinedplus3_C1212-M_Combinedplus3_C1212);
AIC_Combinedplus3_C1212 = N_Combinedplus3_C1212*log(sum((OCV_C1212 - OCV_model_Combinedplus3_C1212_CCSOC).^2)/N_Combinedplus3_C1212) + 2*(M_Combinedplus3_C1212+1);


%Error for Polynomial Model

OCV_model_Poly_C1209_CCSOC = P_Poly_C1209 * K_Poly_C1209; %Computed OCV Poly model for given SOC of battery cell C1209
N_Poly_C1209 = numel(OCV_model_Poly_C1209_CCSOC);
M_Poly_C1209 = numel(K_Poly_C1209);
V_bar_Poly_C1209 = (1/N_Poly_C1209)*(sum(OCV_model_Poly_C1209_CCSOC));
BF_Poly_C1209 = (1-(norm(OCV_model_Poly_C1209_CCSOC - OCV_C1209)/norm(OCV_C1209 - V_bar_Poly_C1209)))*100;
RF_Poly_C1209 = (1-(norm(OCV_model_Poly_C1209_CCSOC - OCV_C1209).^2/norm(OCV_C1209 - V_bar_Poly_C1209).^2))*100;
ME_Poly_C1209 = max(abs(OCV_C1209 - OCV_model_Poly_C1209_CCSOC));
RMS_Poly_C1209 = norm(OCV_C1209 - OCV_model_Poly_C1209_CCSOC) / sqrt(N_Poly_C1209-M_Poly_C1209);
AIC_Poly_C1209 = N_Poly_C1209*log(sum((OCV_C1209 - OCV_model_Poly_C1209_CCSOC).^2)/N_Poly_C1209) + 2*(M_Poly_C1209+1);

OCV_model_Poly_C1210_CCSOC = P_Poly_C1210 * K_Poly_C1210; %Computed OCV Poly model for given SOC of battery cell C1210
N_Poly_C1210 = numel(OCV_model_Poly_C1210_CCSOC);
M_Poly_C1210 = numel(K_Poly_C1210);
V_bar_Poly_C1210 = (1/N_Poly_C1210)*(sum(OCV_model_Poly_C1210_CCSOC));
BF_Poly_C1210 = (1-(norm(OCV_model_Poly_C1210_CCSOC - OCV_C1210)/norm(OCV_C1210 - V_bar_Poly_C1210)))*100;
RF_Poly_C1210 = (1-(norm(OCV_model_Poly_C1210_CCSOC - OCV_C1210).^2/norm(OCV_C1210 - V_bar_Poly_C1210).^2))*100;
ME_Poly_C1210 = max(abs(OCV_C1210 - OCV_model_Poly_C1210_CCSOC));
RMS_Poly_C1210 = norm(OCV_C1210 - OCV_model_Poly_C1210_CCSOC) / sqrt(N_Poly_C1210-M_Poly_C1210);
AIC_Poly_C1210 = N_Poly_C1210*log(sum((OCV_C1210 - OCV_model_Poly_C1210_CCSOC).^2)/N_Poly_C1210) + 2*(M_Poly_C1210+1);

OCV_model_Poly_C1211_CCSOC = P_Poly_C1211 * K_Poly_C1211; %Computed OCV Poly model for given SOC of battery cell C1211
N_Poly_C1211 = numel(OCV_model_Poly_C1211_CCSOC);
M_Poly_C1211 = numel(K_Poly_C1211);
V_bar_Poly_C1211 = (1/N_Poly_C1211)*(sum(OCV_model_Poly_C1211_CCSOC));
BF_Poly_C1211 = (1-(norm(OCV_model_Poly_C1211_CCSOC - OCV_C1211)/norm(OCV_C1211 - V_bar_Poly_C1211)))*100;
RF_Poly_C1211 = (1-(norm(OCV_model_Poly_C1211_CCSOC - OCV_C1211).^2/norm(OCV_C1211 - V_bar_Poly_C1211).^2))*100;
ME_Poly_C1211 = max(abs(OCV_C1211 - OCV_model_Poly_C1211_CCSOC));
RMS_Poly_C1211 = norm(OCV_C1211 - OCV_model_Poly_C1211_CCSOC) / sqrt(N_Poly_C1211-M_Poly_C1211);
AIC_Poly_C1211 = N_Poly_C1211*log(sum((OCV_C1211 - OCV_model_Poly_C1211_CCSOC).^2)/N_Poly_C1211) + 2*(M_Poly_C1211+1);

OCV_model_Poly_C1212_CCSOC = P_Poly_C1212 * K_Poly_C1212; %Computed OCV Poly model for given SOC of battery cell C1212
N_Poly_C1212 = numel(OCV_model_Poly_C1212_CCSOC);
M_Poly_C1212 = numel(K_Poly_C1212);
V_bar_Poly_C1212 = (1/N_Poly_C1212)*(sum(OCV_model_Poly_C1212_CCSOC));
BF_Poly_C1212 = (1-(norm(OCV_model_Poly_C1212_CCSOC - OCV_C1212)/norm(OCV_C1212 - V_bar_Poly_C1212)))*100;
RF_Poly_C1212 = (1-(norm(OCV_model_Poly_C1212_CCSOC - OCV_C1212).^2/norm(OCV_C1212 - V_bar_Poly_C1212).^2))*100;
ME_Poly_C1212 = max(abs(OCV_C1212 - OCV_model_Poly_C1212_CCSOC));
RMS_Poly_C1212 = norm(OCV_C1212 - OCV_model_Poly_C1212_CCSOC) / sqrt(N_Poly_C1212-M_Poly_C1212);
AIC_Poly_C1212 = N_Poly_C1212*log(sum((OCV_C1212 - OCV_model_Poly_C1212_CCSOC).^2)/N_Poly_C1212) + 2*(M_Poly_C1212+1);


%Error for Exponential Model

OCV_model_Exp_C1209_CCSOC = P_Exp_C1209 * K_Exp_C1209; %Computed OCV Exp model for given SOC of battery cell C1209
N_Exp_C1209 = numel(OCV_model_Exp_C1209_CCSOC); %Saving number of element of OCV data points stored in array of OCV model created by Expnential model for battery cell C1209
M_Exp_C1209 = numel(K_Exp_C1209); %Saving number of estimated parameter for Expnential model 
V_bar_Exp_C1209 = (1/N_Exp_C1209)*(sum(OCV_model_Exp_C1209_CCSOC));
BF_Exp_C1209 = (1-(norm(OCV_model_Exp_C1209_CCSOC - OCV_C1209)/norm(OCV_C1209 - V_bar_Exp_C1209)))*100;
RF_Exp_C1209 = (1-(norm(OCV_model_Exp_C1209_CCSOC - OCV_C1209).^2/norm(OCV_C1209 - V_bar_Exp_C1209).^2))*100;
ME_Exp_C1209 = max(abs(OCV_C1209 - OCV_model_Exp_C1209_CCSOC));
RMS_Exp_C1209 = norm(OCV_C1209 - OCV_model_Exp_C1209_CCSOC) / sqrt(N_Exp_C1209-M_Exp_C1209);
AIC_Exp_C1209 = N_Exp_C1209*log(sum((OCV_C1209 - OCV_model_Exp_C1209_CCSOC).^2)/N_Exp_C1209) + 2*(M_Exp_C1209+1);

OCV_model_Exp_C1210_CCSOC = P_Exp_C1210 * K_Exp_C1210; %Computed OCV Exp model for given SOC of battery cell C1210
N_Exp_C1210 = numel(OCV_model_Exp_C1210_CCSOC); %Saving number of element of OCV data points stored in array of OCV model created by Expnential model for battery cell C1210
M_Exp_C1210 = numel(K_Exp_C1210); %Saving number of estimated parameter for Expnential model 
V_bar_Exp_C1210 = (1/N_Exp_C1210)*(sum(OCV_model_Exp_C1210_CCSOC));
BF_Exp_C1210 = (1-(norm(OCV_model_Exp_C1210_CCSOC - OCV_C1210)/norm(OCV_C1210 - V_bar_Exp_C1210)))*100;
RF_Exp_C1210 = (1-(norm(OCV_model_Exp_C1210_CCSOC - OCV_C1210).^2/norm(OCV_C1210 - V_bar_Exp_C1210).^2))*100;
ME_Exp_C1210 = max(abs(OCV_C1210 - OCV_model_Exp_C1210_CCSOC));
RMS_Exp_C1210 = norm(OCV_C1210 - OCV_model_Exp_C1210_CCSOC) / sqrt(N_Exp_C1210-M_Exp_C1210);
AIC_Exp_C1210 = N_Exp_C1210*log(sum((OCV_C1210 - OCV_model_Exp_C1210_CCSOC).^2)/N_Exp_C1210) + 2*(M_Exp_C1210+1);

OCV_model_Exp_C1211_CCSOC = P_Exp_C1211 * K_Exp_C1211; %Computed OCV Exp model for given SOC of battery cell C1211
N_Exp_C1211 = numel(OCV_model_Exp_C1211_CCSOC); %Saving number of element of OCV data points stored in array of OCV model created by Expnential model for battery cell C1211
M_Exp_C1211 = numel(K_Exp_C1211); %Saving number of estimated parameter for Expnential model 
V_bar_Exp_C1211 = (1/N_Exp_C1211)*(sum(OCV_model_Exp_C1211_CCSOC));
BF_Exp_C1211 = (1-(norm(OCV_model_Exp_C1211_CCSOC - OCV_C1211)/norm(OCV_C1211 - V_bar_Exp_C1211)))*100;
RF_Exp_C1211 = (1-(norm(OCV_model_Exp_C1211_CCSOC - OCV_C1211).^2/norm(OCV_C1211 - V_bar_Exp_C1211).^2))*100;
ME_Exp_C1211 = max(abs(OCV_C1211 - OCV_model_Exp_C1211_CCSOC));
RMS_Exp_C1211 = norm(OCV_C1211 - OCV_model_Exp_C1211_CCSOC) / sqrt(N_Exp_C1211-M_Exp_C1211);
AIC_Exp_C1211 = N_Exp_C1211*log(sum((OCV_C1211 - OCV_model_Exp_C1211_CCSOC).^2)/N_Exp_C1211) + 2*(M_Exp_C1211+1);

OCV_model_Exp_C1212_CCSOC = P_Exp_C1212 * K_Exp_C1212; %Computed OCV Exp model for given SOC of battery cell C1212
N_Exp_C1212 = numel(OCV_model_Exp_C1212_CCSOC); %Saving number of element of OCV data points stored in array of OCV model created by Expnential model for battery cell C1212
M_Exp_C1212 = numel(K_Exp_C1212); %Saving number of estimated parameter for Expnential model 
V_bar_Exp_C1212 = (1/N_Exp_C1212)*(sum(OCV_model_Exp_C1212_CCSOC));
BF_Exp_C1212 = (1-(norm(OCV_model_Exp_C1212_CCSOC - OCV_C1212)/norm(OCV_C1212 - V_bar_Exp_C1212)))*100;
RF_Exp_C1212 = (1-(norm(OCV_model_Exp_C1212_CCSOC - OCV_C1212).^2/norm(OCV_C1212 - V_bar_Exp_C1212).^2))*100;
ME_Exp_C1212 = max(abs(OCV_C1212 - OCV_model_Exp_C1212_CCSOC));
RMS_Exp_C1212 = norm(OCV_C1212 - OCV_model_Exp_C1212_CCSOC) / sqrt(N_Exp_C1212-M_Exp_C1212);
AIC_Exp_C1212 = N_Exp_C1212*log(sum((OCV_C1212 - OCV_model_Exp_C1212_CCSOC).^2)/N_Exp_C1212) + 2*(M_Exp_C1212+1);
 
figure(9)
sgtitle('OCV-SOC Error for different OCV models for 4 Cells') 
subplot(2,2,1)
Data_error_Linear_C1209 = OCV_C1209 - OCV_model_Linear_C1209_CCSOC;
plot(SOC_C1209,Data_error_Linear_C1209,'DisplayName','Linear OCV model','LineStyle','--');
title('C1209','Error v/s SOC')
xlabel('SOC');
ylabel('Modeling Error');
grid on
hold on

Data_error_Shepherd_C1209 = OCV_C1209 - OCV_model_Shepherd_C1209_CCSOC;
plot(SOC_C1209,Data_error_Shepherd_C1209,'DisplayName','Shepherd OCV model','LineStyle','--');
title('C1209','Error v/s SOC')
xlabel('SOC');
ylabel('Modeling Error');

Data_error_Nernst_C1209 = OCV_C1209 - OCV_model_Nernst_C1209_CCSOC;
plot(SOC_C1209,Data_error_Nernst_C1209,'DisplayName','Nernst OCV model','LineStyle','--');
title('C1209','Error v/s SOC')
xlabel('SOC');
ylabel('Modeling Error');

Data_error_Combined_C1209 = OCV_C1209 - OCV_model_Combined_C1209_CCSOC;
plot(SOC_C1209,Data_error_Combined_C1209,'DisplayName','Combined OCV model','LineStyle','--');
title('C1209','Error v/s SOC')
xlabel('SOC');
ylabel('Modeling Error');

Data_error_Combinedplus3_C1209 = OCV_C1209 - OCV_model_Combinedplus3_C1209_CCSOC;
plot(SOC_C1209,Data_error_Combinedplus3_C1209,'DisplayName','Combined+3 OCV model','LineStyle','--');
title('C1209','Error v/s SOC')
xlabel('SOC');
ylabel('Modeling Error');

Data_error = OCV_C1209 - OCV_model_Poly_C1209_CCSOC;
plot(SOC_C1209,Data_error,'DisplayName','Polynomial OCV model','LineStyle','--');
title('C1209','Error v/s SOC')
xlabel('SOC');
ylabel('Modeling Error');

Data_error_Expo_C1209 = OCV_C1209 - OCV_model_Exp_C1209_CCSOC;
plot(SOC_C1209,Data_error_Expo_C1209,'DisplayName','Exponential OCV Model','LineStyle','--');
title('C1209','Error v/s SOC')
xlabel('SOC');
ylabel('Modeling Error');
lgd = legend;
legend('Location','southeast');
lgd.FontSize = 8;

subplot(2,2,2)
Data_error_Linear_C1210 = OCV_C1210 - OCV_model_Linear_C1210_CCSOC;
plot(SOC_C1210,Data_error_Linear_C1210,'DisplayName','Linear OCV model','LineStyle','--');
title('C1210','Error v/s SOC')
xlabel('SOC');
ylabel('Modeling Error');
grid on
hold on

Data_error_Shepherd_C1210 = OCV_C1210 - OCV_model_Shepherd_C1210_CCSOC;
plot(SOC_C1210,Data_error_Shepherd_C1210,'DisplayName','Shepherd OCV model','LineStyle','--');
title('C1210','Error v/s SOC')
xlabel('SOC');
ylabel('Modeling Error');

Data_error_Nernst_C1210 = OCV_C1210 - OCV_model_Nernst_C1210_CCSOC;
plot(SOC_C1210,Data_error_Nernst_C1210,'DisplayName','Nernst OCV model','LineStyle','--');
title('C1210','Error v/s SOC')
xlabel('SOC');
ylabel('Modeling Error');

Data_error_Combined_C1210 = OCV_C1210 - OCV_model_Combined_C1210_CCSOC;
plot(SOC_C1210,Data_error_Combined_C1210,'DisplayName','Combined OCV model','LineStyle','--');
title('C1210','Error v/s SOC')
xlabel('SOC');
ylabel('Modeling Error');

Data_error_Combinedplus3_C1210 = OCV_C1210 - OCV_model_Combinedplus3_C1210_CCSOC;
plot(SOC_C1210,Data_error_Combinedplus3_C1210,'DisplayName','Combined+3 OCV model','LineStyle','--');
title('C1210','Error v/s SOC')
xlabel('SOC');
ylabel('Modeling Error');

Data_error = OCV_C1210 - OCV_model_Poly_C1210_CCSOC;
plot(SOC_C1210,Data_error,'DisplayName','Polynomial OCV model','LineStyle','--');
title('C1210','Error v/s SOC')
xlabel('SOC');
ylabel('Modeling Error');

Data_error_Expo_C1210 = OCV_C1210 - OCV_model_Exp_C1210_CCSOC;
plot(SOC_C1210,Data_error_Expo_C1210,'DisplayName','Exponential OCV Model','LineStyle','--');
title('C1210','Error v/s SOC')
xlabel('SOC');
ylabel('Modeling Error');
lgd = legend;
legend('Location','southeast');
lgd.FontSize = 8;

subplot(2,2,3)
Data_error_Linear_C1211 = OCV_C1211 - OCV_model_Linear_C1211_CCSOC;
plot(SOC_C1211,Data_error_Linear_C1211,'DisplayName','Linear OCV model','LineStyle','--');
title('C1211','Error v/s SOC')
xlabel('SOC');
ylabel('Modeling Error');
grid on
hold on

Data_error_Shepherd_C1211 = OCV_C1211 - OCV_model_Shepherd_C1211_CCSOC;
plot(SOC_C1211,Data_error_Shepherd_C1211,'DisplayName','Shepherd OCV model','LineStyle','--');
title('C1211','Error v/s SOC')
xlabel('SOC');
ylabel('Modeling Error');

Data_error_Nernst_C1211 = OCV_C1211 - OCV_model_Nernst_C1211_CCSOC;
plot(SOC_C1211,Data_error_Nernst_C1211,'DisplayName','Nernst OCV model','LineStyle','--');
title('C1211','Error v/s SOC')
xlabel('SOC');
ylabel('Modeling Error');

Data_error_Combined_C1211 = OCV_C1211 - OCV_model_Combined_C1211_CCSOC;
plot(SOC_C1211,Data_error_Combined_C1211,'DisplayName','Combined OCV model','LineStyle','--');
title('C1211','Error v/s SOC')
xlabel('SOC');
ylabel('Modeling Error');

Data_error_Combinedplus3_C1211 = OCV_C1211 - OCV_model_Combinedplus3_C1211_CCSOC;
plot(SOC_C1211,Data_error_Combinedplus3_C1211,'DisplayName','Combined+3 OCV model','LineStyle','--');
title('C1211','Error v/s SOC')
xlabel('SOC');
ylabel('Modeling Error');

Data_error = OCV_C1211 - OCV_model_Poly_C1211_CCSOC;
plot(SOC_C1211,Data_error,'DisplayName','Polynomial OCV model','LineStyle','--');
title('C1211','Error v/s SOC')
xlabel('SOC');
ylabel('Modeling Error');

Data_error_Expo_C1211 = OCV_C1211 - OCV_model_Exp_C1211_CCSOC;
plot(SOC_C1211,Data_error_Expo_C1211,'DisplayName','Exponential OCV Model','LineStyle','--');
title('C1211','Error v/s SOC')
xlabel('SOC');
ylabel('Modeling Error');
lgd = legend;
legend('Location','southeast');
lgd.FontSize = 8;

subplot(2,2,4)
Data_error_Linear_C1212 = OCV_C1212 - OCV_model_Linear_C1212_CCSOC;
plot(SOC_C1212,Data_error_Linear_C1212,'DisplayName','Linear OCV model','LineStyle','--');
title('C1212','Error v/s SOC')
xlabel('SOC');
ylabel('Modeling Error');
grid on
hold on

Data_error_Shepherd_C1212 = OCV_C1212 - OCV_model_Shepherd_C1212_CCSOC;
plot(SOC_C1212,Data_error_Shepherd_C1212,'DisplayName','Shepherd OCV model','LineStyle','--');
title('C1212','Error v/s SOC')
xlabel('SOC');
ylabel('Modeling Error');

Data_error_Nernst_C1212 = OCV_C1212 - OCV_model_Nernst_C1212_CCSOC;
plot(SOC_C1212,Data_error_Nernst_C1212,'DisplayName','Nernst OCV model','LineStyle','--');
title('C1212','Error v/s SOC')
xlabel('SOC');
ylabel('Modeling Error');

Data_error_Combined_C1212 = OCV_C1212 - OCV_model_Combined_C1212_CCSOC;
plot(SOC_C1212,Data_error_Combined_C1212,'DisplayName','Combined OCV model','LineStyle','--');
title('C1212','Error v/s SOC')
xlabel('SOC');
ylabel('Modeling Error');

Data_error_Combinedplus3_C1212 = OCV_C1212 - OCV_model_Combinedplus3_C1212_CCSOC;
plot(SOC_C1212,Data_error_Combinedplus3_C1212,'DisplayName','Combined+3 OCV model','LineStyle','--');
title('C1212','Error v/s SOC')
xlabel('SOC');
ylabel('Modeling Error');

Data_error = OCV_C1212 - OCV_model_Poly_C1212_CCSOC;
plot(SOC_C1212,Data_error,'DisplayName','Polynomial OCV model','LineStyle','--');
title('C1212','Error v/s SOC')
xlabel('SOC');
ylabel('Modeling Error');

Data_error_Expo_C1212 = OCV_C1212 - OCV_model_Exp_C1212_CCSOC;
plot(SOC_C1212,Data_error_Expo_C1212,'DisplayName','Exponential OCV Model','LineStyle','--');
title('C1212','Error v/s SOC')
xlabel('SOC');
ylabel('Modeling Error');
lgd = legend;
legend('Location','southeast');
lgd.FontSize = 8;

%Error Matrix for C1209
Err_Metrix_C1209 = [{'Linear Model'}, AIC_Linear_C1209, RMS_Linear_C1209, RF_Linear_C1209, BF_Linear_C1209, ME_Linear_C1209; 
   {'Shepherd Model'}, AIC_Shepherd_C1209, RMS_Shepherd_C1209, RF_Shepherd_C1209, BF_Shepherd_C1209, ME_Shepherd_C1209; 
   {'Nernst Model'}, AIC_Nernst_C1209, RMS_Nernst_C1209, RF_Nernst_C1209, BF_Nernst_C1209, ME_Nernst_C1209;
   {'Combined Model'}, AIC_Combined_C1209, RMS_Combined_C1209, RF_Combined_C1209, BF_Combined_C1209, ME_Combined_C1209;
   {'Combined+3 Model'}, AIC_Combinedplus3_C1209, RMS_Combinedplus3_C1209, RF_Combinedplus3_C1209, BF_Combinedplus3_C1209, ME_Combinedplus3_C1209;
   {'Polynomial Model'}, AIC_Poly_C1209, RMS_Poly_C1209, RF_Poly_C1209, BF_Poly_C1209, ME_Poly_C1209;
   {'Exponential Model'}, AIC_Exp_C1209, RMS_Exp_C1209, RF_Exp_C1209, BF_Exp_C1209, ME_Exp_C1209];
Err_Metrix_C1209_Table = cell2table(Err_Metrix_C1209, "VariableNames",["OCV Model Metrix Table for C1209" "AIC" "RMSE" "R_SQ" "BF" "Max Error"])

%Error Matrix for C1210
Err_Metrix_C1210 = [{'Linear Model'}, AIC_Linear_C1210, RMS_Linear_C1210, RF_Linear_C1210, BF_Linear_C1210, ME_Linear_C1210; 
   {'Shepherd Model'}, AIC_Shepherd_C1210, RMS_Shepherd_C1210, RF_Shepherd_C1210, BF_Shepherd_C1210, ME_Shepherd_C1210; 
   {'Nernst Model'}, AIC_Nernst_C1210, RMS_Nernst_C1210, RF_Nernst_C1210, BF_Nernst_C1210, ME_Nernst_C1210;
   {'Combined Model'}, AIC_Combined_C1210, RMS_Combined_C1210, RF_Combined_C1210, BF_Combined_C1210, ME_Combined_C1210;
   {'Combined+3 Model'}, AIC_Combinedplus3_C1210, RMS_Combinedplus3_C1210, RF_Combinedplus3_C1210, BF_Combinedplus3_C1210, ME_Combinedplus3_C1210;
   {'Polynomial Model'}, AIC_Poly_C1210, RMS_Poly_C1210, RF_Poly_C1210, BF_Poly_C1210, ME_Poly_C1210;
   {'Exponential Model'}, AIC_Exp_C1210, RMS_Exp_C1210, RF_Exp_C1210, BF_Exp_C1210, ME_Exp_C1210];
Err_Metrix_C1210_Table = cell2table(Err_Metrix_C1210, "VariableNames",["OCV Model Metrix Table for C1210" "AIC" "RMSE" "R_SQ" "BF" "Max Error"])

%Error Matrix for C1211
Err_Metrix_C1211 = [{'Linear Model'}, AIC_Linear_C1211, RMS_Linear_C1211, RF_Linear_C1211, BF_Linear_C1211, ME_Linear_C1211; 
   {'Shepherd Model'}, AIC_Shepherd_C1211, RMS_Shepherd_C1211, RF_Shepherd_C1211, BF_Shepherd_C1211, ME_Shepherd_C1211; 
   {'Nernst Model'}, AIC_Nernst_C1211, RMS_Nernst_C1211, RF_Nernst_C1211, BF_Nernst_C1211, ME_Nernst_C1211;
   {'Combined Model'}, AIC_Combined_C1211, RMS_Combined_C1211, RF_Combined_C1211, BF_Combined_C1211, ME_Combined_C1211;
   {'Combined+3 Model'}, AIC_Combinedplus3_C1211, RMS_Combinedplus3_C1211, RF_Combinedplus3_C1211, BF_Combinedplus3_C1211, ME_Combinedplus3_C1211;
   {'Polynomial Model'}, AIC_Poly_C1211, RMS_Poly_C1211, RF_Poly_C1211, BF_Poly_C1211, ME_Poly_C1211;
   {'Exponential Model'}, AIC_Exp_C1211, RMS_Exp_C1211, RF_Exp_C1211, BF_Exp_C1211, ME_Exp_C1211];
Err_Metrix_C1211_Table = cell2table(Err_Metrix_C1211, "VariableNames",["OCV Model Metrix Table for C1211" "AIC" "RMSE" "R_SQ" "BF" "Max Error"])

%Error Matrix for C1212
Err_Metrix_C1212 = [{'Linear Model'}, AIC_Linear_C1212, RMS_Linear_C1212, RF_Linear_C1212, BF_Linear_C1212, ME_Linear_C1212; 
   {'Shepherd Model'}, AIC_Shepherd_C1212, RMS_Shepherd_C1212, RF_Shepherd_C1212, BF_Shepherd_C1212, ME_Shepherd_C1212; 
   {'Nernst Model'}, AIC_Nernst_C1212, RMS_Nernst_C1212, RF_Nernst_C1212, BF_Nernst_C1212, ME_Nernst_C1212;
   {'Combined Model'}, AIC_Combined_C1212, RMS_Combined_C1212, RF_Combined_C1212, BF_Combined_C1212, ME_Combined_C1212;
   {'Combined+3 Model'}, AIC_Combinedplus3_C1212, RMS_Combinedplus3_C1212, RF_Combinedplus3_C1212, BF_Combinedplus3_C1212, ME_Combinedplus3_C1212;
   {'Polynomial Model'}, AIC_Poly_C1212, RMS_Poly_C1212, RF_Poly_C1212, BF_Poly_C1212, ME_Poly_C1212;
   {'Exponential Model'}, AIC_Exp_C1212, RMS_Exp_C1212, RF_Exp_C1212, BF_Exp_C1212, ME_Exp_C1212];
Err_Metrix_C1212_Table = cell2table(Err_Metrix_C1212, "VariableNames",["OCV Model Metrix Table for C1212" "AIC" "RMSE" "R_SQ" "BF" "Max Error"])

%Ranking for Battery C1209

Err_Metrix_C1209_AIC = sortrows(Err_Metrix_C1209, 2);
Err_Metrix_C1209_AIC_rank = [Err_Metrix_C1209_AIC(1,1),1; Err_Metrix_C1209_AIC(2,1),2; Err_Metrix_C1209_AIC(3,1),3; Err_Metrix_C1209_AIC(4,1),4; Err_Metrix_C1209_AIC(5,1),5; Err_Metrix_C1209_AIC(6,1),6; Err_Metrix_C1209_AIC(7,1),7;];
Ranking_C1209_AIC_rank = sortrows(Err_Metrix_C1209_AIC_rank,1);

Err_Metrix_C1209_RMSE = sortrows(Err_Metrix_C1209, 3);
Err_Metrix_C1209_RMSE_rank = [Err_Metrix_C1209_RMSE(1,1),1; Err_Metrix_C1209_RMSE(2,1),2; Err_Metrix_C1209_RMSE(3,1),3; Err_Metrix_C1209_RMSE(4,1),4; Err_Metrix_C1209_RMSE(5,1),5; Err_Metrix_C1209_RMSE(6,1),6; Err_Metrix_C1209_RMSE(7,1),7;];
Ranking_C1209_RMSE_rank = sortrows(Err_Metrix_C1209_RMSE_rank,1);

Err_Metrix_C1209_RE = sortrows(Err_Metrix_C1209, 4, "descend");
Err_Metrix_C1209_RE_rank = [Err_Metrix_C1209_RE(1,1),1; Err_Metrix_C1209_RE(2,1),2; Err_Metrix_C1209_RE(3,1),3; Err_Metrix_C1209_RE(4,1),4; Err_Metrix_C1209_RE(5,1),5; Err_Metrix_C1209_RE(6,1),6; Err_Metrix_C1209_RE(7,1),7;];
Ranking_C1209_RE_rank =  sortrows(Err_Metrix_C1209_RE_rank,1);

Err_Metrix_C1209_BF = sortrows(Err_Metrix_C1209, 5, "descend");
Err_Metrix_C1209_BF_rank = [Err_Metrix_C1209_BF(1,1),1; Err_Metrix_C1209_BF(2,1),2; Err_Metrix_C1209_BF(3,1),3; Err_Metrix_C1209_BF(4,1),4; Err_Metrix_C1209_BF(5,1),5; Err_Metrix_C1209_BF(6,1),6; Err_Metrix_C1209_BF(7,1),7;];
Ranking_C1209_BF_rank = sortrows(Err_Metrix_C1209_BF_rank,1);

Err_Metrix_C1209_ME = sortrows(Err_Metrix_C1209, 6);
Err_Metrix_C1209_ME_rank = [Err_Metrix_C1209_ME(1,1),1; Err_Metrix_C1209_ME(2,1),2; Err_Metrix_C1209_ME(3,1),3; Err_Metrix_C1209_ME(4,1),4; Err_Metrix_C1209_ME(5,1),5; Err_Metrix_C1209_ME(6,1),6; Err_Metrix_C1209_ME(7,1),7;];
Ranking_C1209_ME_rank = sortrows(Err_Metrix_C1209_ME_rank,1);

Ranking_C1209=[Ranking_C1209_AIC_rank(:,1), Ranking_C1209_AIC_rank(:,2), Ranking_C1209_RMSE_rank(:,2), Ranking_C1209_RE_rank(:,2), Ranking_C1209_BF_rank(:,2), Ranking_C1209_ME_rank(:,2)];

Ranking_C1209{1,7} = Ranking_C1209{1,2} + Ranking_C1209{1,3} + Ranking_C1209{1,4} + Ranking_C1209{1,5} + Ranking_C1209{1,6};
Ranking_C1209{2,7} = Ranking_C1209{2,2} + Ranking_C1209{2,3} + Ranking_C1209{2,4} + Ranking_C1209{2,5} + Ranking_C1209{2,6};
Ranking_C1209{3,7} = Ranking_C1209{3,2} + Ranking_C1209{3,3} + Ranking_C1209{3,4} + Ranking_C1209{3,5} + Ranking_C1209{3,6};
Ranking_C1209{4,7} = Ranking_C1209{4,2} + Ranking_C1209{4,3} + Ranking_C1209{4,4} + Ranking_C1209{4,5} + Ranking_C1209{4,6};
Ranking_C1209{5,7} = Ranking_C1209{5,2} + Ranking_C1209{5,3} + Ranking_C1209{5,4} + Ranking_C1209{5,5} + Ranking_C1209{5,6};
Ranking_C1209{6,7} = Ranking_C1209{6,2} + Ranking_C1209{6,3} + Ranking_C1209{6,4} + Ranking_C1209{6,5} + Ranking_C1209{6,6};
Ranking_C1209{7,7} = Ranking_C1209{7,2} + Ranking_C1209{7,3} + Ranking_C1209{7,4} + Ranking_C1209{7,5} + Ranking_C1209{7,6};
Ranking_C1209 = sortrows(Ranking_C1209,7);

Ranking_C1209=[Ranking_C1209(1,:),1;Ranking_C1209(2,:),2;Ranking_C1209(3,:),3;Ranking_C1209(4,:),4;Ranking_C1209(5,:),5;Ranking_C1209(6,:),6;Ranking_C1209(7,:),7];
Ranking_C1209_Table = cell2table(Ranking_C1209, "VariableNames",["OCV Model Ranking for C1209" "AIC" "RMSE" "R_SQ" "BF" "Max Error" " Sum" "Borda Ranking"])

%Ranking for Battery C1210


Err_Metrix_C1210_AIC = sortrows(Err_Metrix_C1210, 2);
Err_Metrix_C1210_AIC_rank = [Err_Metrix_C1210_AIC(1,1),1; Err_Metrix_C1210_AIC(2,1),2; Err_Metrix_C1210_AIC(3,1),3; Err_Metrix_C1210_AIC(4,1),4; Err_Metrix_C1210_AIC(5,1),5; Err_Metrix_C1210_AIC(6,1),6; Err_Metrix_C1210_AIC(7,1),7;];
Ranking_C1210_AIC_rank = sortrows(Err_Metrix_C1210_AIC_rank,1);

Err_Metrix_C1210_RMSE = sortrows(Err_Metrix_C1210, 3);
Err_Metrix_C1210_RMSE_rank = [Err_Metrix_C1210_RMSE(1,1),1; Err_Metrix_C1210_RMSE(2,1),2; Err_Metrix_C1210_RMSE(3,1),3; Err_Metrix_C1210_RMSE(4,1),4; Err_Metrix_C1210_RMSE(5,1),5; Err_Metrix_C1210_RMSE(6,1),6; Err_Metrix_C1210_RMSE(7,1),7;];
Ranking_C1210_RMSE_rank = sortrows(Err_Metrix_C1210_RMSE_rank,1);

Err_Metrix_C1210_RE = sortrows(Err_Metrix_C1210, 4, "descend");
Err_Metrix_C1210_RE_rank = [Err_Metrix_C1210_RE(1,1),1; Err_Metrix_C1210_RE(2,1),2; Err_Metrix_C1210_RE(3,1),3; Err_Metrix_C1210_RE(4,1),4; Err_Metrix_C1210_RE(5,1),5; Err_Metrix_C1210_RE(6,1),6; Err_Metrix_C1210_RE(7,1),7;];
Ranking_C1210_RE_rank =  sortrows(Err_Metrix_C1210_RE_rank,1);

Err_Metrix_C1210_BF = sortrows(Err_Metrix_C1210, 5, "descend");
Err_Metrix_C1210_BF_rank = [Err_Metrix_C1210_BF(1,1),1; Err_Metrix_C1210_BF(2,1),2; Err_Metrix_C1210_BF(3,1),3; Err_Metrix_C1210_BF(4,1),4; Err_Metrix_C1210_BF(5,1),5; Err_Metrix_C1210_BF(6,1),6; Err_Metrix_C1210_BF(7,1),7;];
Ranking_C1210_BF_rank = sortrows(Err_Metrix_C1210_BF_rank,1);

Err_Metrix_C1210_ME = sortrows(Err_Metrix_C1210, 6);
Err_Metrix_C1210_ME_rank = [Err_Metrix_C1210_ME(1,1),1; Err_Metrix_C1210_ME(2,1),2; Err_Metrix_C1210_ME(3,1),3; Err_Metrix_C1210_ME(4,1),4; Err_Metrix_C1210_ME(5,1),5; Err_Metrix_C1210_ME(6,1),6; Err_Metrix_C1210_ME(7,1),7;];
Ranking_C1210_ME_rank = sortrows(Err_Metrix_C1210_ME_rank,1);

Ranking_C1210=[Ranking_C1210_AIC_rank(:,1), Ranking_C1210_AIC_rank(:,2), Ranking_C1210_RMSE_rank(:,2), Ranking_C1210_RE_rank(:,2), Ranking_C1210_BF_rank(:,2), Ranking_C1210_ME_rank(:,2)];

Ranking_C1210{1,7} = Ranking_C1210{1,2} + Ranking_C1210{1,3} + Ranking_C1210{1,4} + Ranking_C1210{1,5} + Ranking_C1210{1,6};
Ranking_C1210{2,7} = Ranking_C1210{2,2} + Ranking_C1210{2,3} + Ranking_C1210{2,4} + Ranking_C1210{2,5} + Ranking_C1210{2,6};
Ranking_C1210{3,7} = Ranking_C1210{3,2} + Ranking_C1210{3,3} + Ranking_C1210{3,4} + Ranking_C1210{3,5} + Ranking_C1210{3,6};
Ranking_C1210{4,7} = Ranking_C1210{4,2} + Ranking_C1210{4,3} + Ranking_C1210{4,4} + Ranking_C1210{4,5} + Ranking_C1210{4,6};
Ranking_C1210{5,7} = Ranking_C1210{5,2} + Ranking_C1210{5,3} + Ranking_C1210{5,4} + Ranking_C1210{5,5} + Ranking_C1210{5,6};
Ranking_C1210{6,7} = Ranking_C1210{6,2} + Ranking_C1210{6,3} + Ranking_C1210{6,4} + Ranking_C1210{6,5} + Ranking_C1210{6,6};
Ranking_C1210{7,7} = Ranking_C1210{7,2} + Ranking_C1210{7,3} + Ranking_C1210{7,4} + Ranking_C1210{7,5} + Ranking_C1210{7,6};
Ranking_C1210 = sortrows(Ranking_C1210,7);

Ranking_C1210=[Ranking_C1210(1,:),1;Ranking_C1210(2,:),2;Ranking_C1210(3,:),3;Ranking_C1210(4,:),4;Ranking_C1210(5,:),5;Ranking_C1210(6,:),6;Ranking_C1210(7,:),7];
Ranking_C1210_Table = cell2table(Ranking_C1210, "VariableNames",["OCV Model Ranking for C1210" "AIC" "RMSE" "R_SQ" "BF" "Max Error" " Sum" "Borda Ranking"])

%Ranking for Battery C1211


Err_Metrix_C1211_AIC = sortrows(Err_Metrix_C1211, 2);
Err_Metrix_C1211_AIC_rank = [Err_Metrix_C1211_AIC(1,1),1; Err_Metrix_C1211_AIC(2,1),2; Err_Metrix_C1211_AIC(3,1),3; Err_Metrix_C1211_AIC(4,1),4; Err_Metrix_C1211_AIC(5,1),5; Err_Metrix_C1211_AIC(6,1),6; Err_Metrix_C1211_AIC(7,1),7;];
Ranking_C1211_AIC_rank = sortrows(Err_Metrix_C1211_AIC_rank,1);

Err_Metrix_C1211_RMSE = sortrows(Err_Metrix_C1211, 3);
Err_Metrix_C1211_RMSE_rank = [Err_Metrix_C1211_RMSE(1,1),1; Err_Metrix_C1211_RMSE(2,1),2; Err_Metrix_C1211_RMSE(3,1),3; Err_Metrix_C1211_RMSE(4,1),4; Err_Metrix_C1211_RMSE(5,1),5; Err_Metrix_C1211_RMSE(6,1),6; Err_Metrix_C1211_RMSE(7,1),7;];
Ranking_C1211_RMSE_rank = sortrows(Err_Metrix_C1211_RMSE_rank,1);

Err_Metrix_C1211_RE = sortrows(Err_Metrix_C1211, 4, "descend");
Err_Metrix_C1211_RE_rank = [Err_Metrix_C1211_RE(1,1),1; Err_Metrix_C1211_RE(2,1),2; Err_Metrix_C1211_RE(3,1),3; Err_Metrix_C1211_RE(4,1),4; Err_Metrix_C1211_RE(5,1),5; Err_Metrix_C1211_RE(6,1),6; Err_Metrix_C1211_RE(7,1),7;];
Ranking_C1211_RE_rank =  sortrows(Err_Metrix_C1211_RE_rank,1);

Err_Metrix_C1211_BF = sortrows(Err_Metrix_C1211, 5, "descend");
Err_Metrix_C1211_BF_rank = [Err_Metrix_C1211_BF(1,1),1; Err_Metrix_C1211_BF(2,1),2; Err_Metrix_C1211_BF(3,1),3; Err_Metrix_C1211_BF(4,1),4; Err_Metrix_C1211_BF(5,1),5; Err_Metrix_C1211_BF(6,1),6; Err_Metrix_C1211_BF(7,1),7;];
Ranking_C1211_BF_rank = sortrows(Err_Metrix_C1211_BF_rank,1);

Err_Metrix_C1211_ME = sortrows(Err_Metrix_C1211, 6);
Err_Metrix_C1211_ME_rank = [Err_Metrix_C1211_ME(1,1),1; Err_Metrix_C1211_ME(2,1),2; Err_Metrix_C1211_ME(3,1),3; Err_Metrix_C1211_ME(4,1),4; Err_Metrix_C1211_ME(5,1),5; Err_Metrix_C1211_ME(6,1),6; Err_Metrix_C1211_ME(7,1),7;];
Ranking_C1211_ME_rank = sortrows(Err_Metrix_C1211_ME_rank,1);

Ranking_C1211=[Ranking_C1211_AIC_rank(:,1), Ranking_C1211_AIC_rank(:,2), Ranking_C1211_RMSE_rank(:,2), Ranking_C1211_RE_rank(:,2), Ranking_C1211_BF_rank(:,2), Ranking_C1211_ME_rank(:,2)];

Ranking_C1211{1,7} = Ranking_C1211{1,2} + Ranking_C1211{1,3} + Ranking_C1211{1,4} + Ranking_C1211{1,5} + Ranking_C1211{1,6};
Ranking_C1211{2,7} = Ranking_C1211{2,2} + Ranking_C1211{2,3} + Ranking_C1211{2,4} + Ranking_C1211{2,5} + Ranking_C1211{2,6};
Ranking_C1211{3,7} = Ranking_C1211{3,2} + Ranking_C1211{3,3} + Ranking_C1211{3,4} + Ranking_C1211{3,5} + Ranking_C1211{3,6};
Ranking_C1211{4,7} = Ranking_C1211{4,2} + Ranking_C1211{4,3} + Ranking_C1211{4,4} + Ranking_C1211{4,5} + Ranking_C1211{4,6};
Ranking_C1211{5,7} = Ranking_C1211{5,2} + Ranking_C1211{5,3} + Ranking_C1211{5,4} + Ranking_C1211{5,5} + Ranking_C1211{5,6};
Ranking_C1211{6,7} = Ranking_C1211{6,2} + Ranking_C1211{6,3} + Ranking_C1211{6,4} + Ranking_C1211{6,5} + Ranking_C1211{6,6};
Ranking_C1211{7,7} = Ranking_C1211{7,2} + Ranking_C1211{7,3} + Ranking_C1211{7,4} + Ranking_C1211{7,5} + Ranking_C1211{7,6};
Ranking_C1211 = sortrows(Ranking_C1211,7);

Ranking_C1211=[Ranking_C1211(1,:),1;Ranking_C1211(2,:),2;Ranking_C1211(3,:),3;Ranking_C1211(4,:),4;Ranking_C1211(5,:),5;Ranking_C1211(6,:),6;Ranking_C1211(7,:),7];
Ranking_C1211_Table = cell2table(Ranking_C1211, "VariableNames",["OCV Model Ranking for C1211" "AIC" "RMSE" "R_SQ" "BF" "Max Error" " Sum" "Borda Ranking"])

%Ranking for Battery C1212


Err_Metrix_C1212_AIC = sortrows(Err_Metrix_C1212, 2);
Err_Metrix_C1212_AIC_rank = [Err_Metrix_C1212_AIC(1,1),1; Err_Metrix_C1212_AIC(2,1),2; Err_Metrix_C1212_AIC(3,1),3; Err_Metrix_C1212_AIC(4,1),4; Err_Metrix_C1212_AIC(5,1),5; Err_Metrix_C1212_AIC(6,1),6; Err_Metrix_C1212_AIC(7,1),7;];
Ranking_C1212_AIC_rank = sortrows(Err_Metrix_C1212_AIC_rank,1);

Err_Metrix_C1212_RMSE = sortrows(Err_Metrix_C1212, 3);
Err_Metrix_C1212_RMSE_rank = [Err_Metrix_C1212_RMSE(1,1),1; Err_Metrix_C1212_RMSE(2,1),2; Err_Metrix_C1212_RMSE(3,1),3; Err_Metrix_C1212_RMSE(4,1),4; Err_Metrix_C1212_RMSE(5,1),5; Err_Metrix_C1212_RMSE(6,1),6; Err_Metrix_C1212_RMSE(7,1),7;];
Ranking_C1212_RMSE_rank = sortrows(Err_Metrix_C1212_RMSE_rank,1);

Err_Metrix_C1212_RE = sortrows(Err_Metrix_C1212, 4, "descend");
Err_Metrix_C1212_RE_rank = [Err_Metrix_C1212_RE(1,1),1; Err_Metrix_C1212_RE(2,1),2; Err_Metrix_C1212_RE(3,1),3; Err_Metrix_C1212_RE(4,1),4; Err_Metrix_C1212_RE(5,1),5; Err_Metrix_C1212_RE(6,1),6; Err_Metrix_C1212_RE(7,1),7;];
Ranking_C1212_RE_rank =  sortrows(Err_Metrix_C1212_RE_rank,1);

Err_Metrix_C1212_BF = sortrows(Err_Metrix_C1212, 5, "descend");
Err_Metrix_C1212_BF_rank = [Err_Metrix_C1212_BF(1,1),1; Err_Metrix_C1212_BF(2,1),2; Err_Metrix_C1212_BF(3,1),3; Err_Metrix_C1212_BF(4,1),4; Err_Metrix_C1212_BF(5,1),5; Err_Metrix_C1212_BF(6,1),6; Err_Metrix_C1212_BF(7,1),7;];
Ranking_C1212_BF_rank = sortrows(Err_Metrix_C1212_BF_rank,1);

Err_Metrix_C1212_ME = sortrows(Err_Metrix_C1212, 6);
Err_Metrix_C1212_ME_rank = [Err_Metrix_C1212_ME(1,1),1; Err_Metrix_C1212_ME(2,1),2; Err_Metrix_C1212_ME(3,1),3; Err_Metrix_C1212_ME(4,1),4; Err_Metrix_C1212_ME(5,1),5; Err_Metrix_C1212_ME(6,1),6; Err_Metrix_C1212_ME(7,1),7;];
Ranking_C1212_ME_rank = sortrows(Err_Metrix_C1212_ME_rank,1);

Ranking_C1212=[Ranking_C1212_AIC_rank(:,1), Ranking_C1212_AIC_rank(:,2), Ranking_C1212_RMSE_rank(:,2), Ranking_C1212_RE_rank(:,2), Ranking_C1212_BF_rank(:,2), Ranking_C1212_ME_rank(:,2)];

Ranking_C1212{1,7} = Ranking_C1212{1,2} + Ranking_C1212{1,3} + Ranking_C1212{1,4} + Ranking_C1212{1,5} + Ranking_C1212{1,6};
Ranking_C1212{2,7} = Ranking_C1212{2,2} + Ranking_C1212{2,3} + Ranking_C1212{2,4} + Ranking_C1212{2,5} + Ranking_C1212{2,6};
Ranking_C1212{3,7} = Ranking_C1212{3,2} + Ranking_C1212{3,3} + Ranking_C1212{3,4} + Ranking_C1212{3,5} + Ranking_C1212{3,6};
Ranking_C1212{4,7} = Ranking_C1212{4,2} + Ranking_C1212{4,3} + Ranking_C1212{4,4} + Ranking_C1212{4,5} + Ranking_C1212{4,6};
Ranking_C1212{5,7} = Ranking_C1212{5,2} + Ranking_C1212{5,3} + Ranking_C1212{5,4} + Ranking_C1212{5,5} + Ranking_C1212{5,6};
Ranking_C1212{6,7} = Ranking_C1212{6,2} + Ranking_C1212{6,3} + Ranking_C1212{6,4} + Ranking_C1212{6,5} + Ranking_C1212{6,6};
Ranking_C1212{7,7} = Ranking_C1212{7,2} + Ranking_C1212{7,3} + Ranking_C1212{7,4} + Ranking_C1212{7,5} + Ranking_C1212{7,6};
Ranking_C1212 = sortrows(Ranking_C1212,7);

Ranking_C1212=[Ranking_C1212(1,:),1;Ranking_C1212(2,:),2;Ranking_C1212(3,:),3;Ranking_C1212(4,:),4;Ranking_C1212(5,:),5;Ranking_C1212(6,:),6;Ranking_C1212(7,:),7];
Ranking_C1212_Table = cell2table(Ranking_C1212, "VariableNames",["OCV Model Ranking for C1212" "AIC" "RMSE" "R_SQ" "BF" "Max Error" " Sum" "Borda Ranking"])

 
