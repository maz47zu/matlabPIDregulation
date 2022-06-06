function [dz] = modelProj(t,z)
    global l2 m tau g c
    
    %A = [m*l2^2; m*l2^2*sin(z(2))^2];
    %b = [m*l2*cos(z(2))*z(3)^2-m*g*l2*sin(z(2))-c*z(1);tau];
    %alfaprim, alfa, psiprim, psi
    
    A = [m*l2^2; m*l2^2*sin(z(2))^2];
    b = [m*(z(3))^2*l2^2*cos(z(2))*sin(z(2))-m*g*l2*sin(z(2))-c*z(1);tau-2*m*z(3)*l2^2*z(1)*sin(z(2))*cos(z(2))];
    
    q=A.^-1.*b;
    
    dz = zeros(4,1);
    dz(1) = q(1);
    dz(2) = z(1);
    dz(3) = q(2);
    dz(4) = z(3);
end