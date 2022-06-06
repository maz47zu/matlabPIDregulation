clear clc

global l2 m tau g c

l2 = 0.8;
m = 0.5;
tau = 0.3;
g = 9.81;
c = 2;

h=0.001;

t=0:h:30;
n=length(t);
z0=[0;pi/16;0;0]; %alfaprim, alfa, psiprim, psi
tspan = [0 20];

[t, z] = ode45('modelProj',tspan,z0);

subplot(4,1,1)
plot(t,z(:,1))
ylabel('$\dot{\alpha}$','Interpreter', 'Latex')

subplot(4,1,2)
plot(t,z(:,2))
ylabel('$\alpha$','Interpreter', 'Latex')

subplot(4,1,3)
plot(t,z(:,3))
ylabel('$\dot{\psi}$','Interpreter', 'Latex')

subplot(4,1,4)
plot(t,z(:,4))
ylabel('${\psi}$','Interpreter', 'Latex')
xlabel('t')