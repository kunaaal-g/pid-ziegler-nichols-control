clc;
clear;
close all;

s=tf('s');
G=1/(s*(s+2)*(s+5));

[GM, PM, Wcg, Wcp] = margin(G);

Ku=GM;
Pu=2*pi / Wcg;

Kp_P=0.5 * Ku;

Kp_PI=0.45 * Ku;
Ti_PI=Pu / 1.2;

Kp_PID=0.6 * Ku;
Ti_PID=Pu / 2;
Td_PID=Pu / 8;

fprintf('Ku = %.2f\n', Ku);
fprintf('Pu = %.2f\n', Pu);

fprintf('P: Kp = %.2f\n', Kp_P);
fprintf('PI: Kp = %.2f, Ti = %.2f\n', Kp_PI, Ti_PI);
fprintf('PID: Kp = %.2f, Ti = %.2f, Td = %.2f\n', Kp_PID, Ti_PID, Td_PID);

C_P = Kp_P;
C_PI = Kp_PI*(1 + 1/(Ti_PI*s));
C_PID = Kp_PID*(1 + 1/(Ti_PID*s) + Td_PID*s);

T_P = feedback(C_P*G,1);
T_PI = feedback(C_PI*G,1);
T_PID = feedback(C_PID*G,1);

figure;
step(T_P, T_PI, T_PID);
legend('P','PI','PID');
grid on;
title('Controller Comparison');
