clear clc

global l2 m tau g c h

l2 = 1.2;
m = 20;
tau = 0;
g = 9.81;
c = 500;

T = 0;

h=0.001;

t=0:h:60;
n=length(t);
z=[0;pi/16;0;0];
%z0=[0;pi/16;0;0]; alfaprim, alfa, psiprim, psi
e_0=0;
I=0;
D=0;

for i=1:n
    [z] = RK('modelProj', t(i),z,4);
    alfa(i) = z(2);
    psi(i) = z(3);
    
    w=pi/4;
    
    e_1 = w-z(2);
    I=I+0.5*(e_1+e_0)/h;
    D=(e_1-e_0)/h;
    dtau = 100 * e_1 + 0.00001 *I +2 * D;
    tau = T + dtau;
    e_0=e_1;
    
    alfaC(i) = w;
    Tau(i) = tau;
end

subplot(3,1,1), plot(t,alfa,':k',t,alfaC,'r')
ylabel('$\alpha$','Interpreter', 'Latex')

subplot(3,1,2), plot(t,Tau)
ylabel('$\tau$','Interpreter', 'Latex')

subplot(3,1,3), plot(t,psi)
ylabel('$\dot{\psi}$','Interpreter', 'Latex')