clear clc

global l2 m tau g c

l2 = 1.2;
m = 20;
tau = 0;
g = 9.81;
c = 500;

h=0.001;

t=0:h:30;
n=length(t);
z0=[0;pi/2;0;0]; %alfaprim, alfa, psiprim, psi
tspan = [0 20];

[t, z] = ode45('modelProj',tspan,z0);

subplot(4,1,1)
plot(t,z(:,1))
ylabel('$\dot{\alpha}{[rad/s]}$','Interpreter', 'Latex')

subplot(4,1,2)
plot(t,z(:,2)*(180/pi))
ylabel('$\alpha [^\circ]$','Interpreter', 'Latex')

subplot(4,1,3)
plot(t,z(:,3))
ylabel('$\dot{\psi}{[rad/s]}$','Interpreter', 'Latex')

subplot(4,1,4)
plot(t,z(:,4)*(180/pi))
ylabel('${\psi} [^\circ]$','Interpreter', 'Latex')
xlabel('t [s]')