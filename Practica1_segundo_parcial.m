close all
clear all
clc
%Leer el Primer angulo
 promt = 'introduzca el valor (grados):';

 angDeg = input(promt);
 angRad = deg2rad(angDeg);
 
 %Leer el Segundo angulo con diferente variable 
  promt = 'introduzca el valor (grados) de la segunda articulacion:';
 angDeg2 = input(promt);
 angRad2 = deg2rad(angDeg2);
 %Leer la distancia 1
 abc = 'introduzca el valor de l1:';
l1= input(abc);

%Leer la distancia 2
 cba = 'introduzca el valor de l2:';
l2= input(cba);
%Imprimir los ejes
%
%Definir el p1
p1=[0 0 0]';
% p1[0 0 0]= vector renglon
% p1=[0 0 0]'; = vector columna
% p1=[0;0;0]; = vector columna

 %Obtener vector de angulos
 if angDeg>=0
     angVec = 0:0.1:angRad;
 else
     angVec = 0:-0.1:angRad;
 end
 %Calcular el valor del angulo en cada digito marcado.
 for i=1:length(angVec)
   clf
 PrintAxis();
     cos(angVec(i))
 %Definir el p2 
TRz = [cos(angVec(i)) -sin(angVec(i)) 0 0;sin(angVec(i)) cos(angVec(i)) 0 0;0 0 1 0;0 0 0 1];
TTx = [1 0 0 l1;0 1 0 0; 0 0 1 0; 0 0 0 1];
T1=TRz*TTx;
p2=T1(1:3,4);
line([p1(1) p2(1)],[p1(2) p2(2)],[p1(2) p2(2)],'color',[0 0 0],'linewidth',5)%primer eslabon del brazo
%Definir p3
 PrintAxis();
TRz2 = [cos(0) -sin(0) 0 0;sin(0) cos(0) 0 0;0 0 1 0;0 0 0 1];
TTx2 = [1 0 0 l2;0 1 0 0; 0 0 1 0; 0 0 0 1];
T2=TRz2*TTx2;
Tf=T1*T2;
p3=Tf(1:3,4);
line([p2(1) p3(1)],[p2(2) p3(2)],[p2(3) p3(3)],'color',[0.6 0 0.8],'linewidth',5)%segundo eslabon del brazo

pause(0.1);
 end
 %Obtener vector de angulos
 if angDeg<=0
 angVec2=0:0.1:angRad2;
 else
     angVec2=0:-0.1:angRad2;
 end
 %Valores para segundo eslabon
 %Calcular el valor del angulo en cada digito marcado.
 for i=1:length(angVec2)
   clf
 PrintAxis();
 %Definir el p2 
 %Ya no se toma el punto 1 ya que esta declarado en el primer ciclo for
p2=T1(1:3,4);
line([p1(1) p2(1)],[p1(2) p2(2)],[p1(2) p2(2)],'color',[0 0 0],'linewidth',5)%primer eslabon del brazo
 
 %Se define p3 
TRz2 = [cos(angVec2(i)) -sin(angVec2(i)) 0 0;sin(angVec2(i)) cos(angVec2(i)) 0 0;0 0 1 0;0 0 0 1];
TTx2 = [1 0 0 l2;0 1 0 0; 0 0 1 0; 0 0 0 1];
T2=TRz2*TTx2;
Tf=T1*T2;
p3=Tf(1:3,4);
line([p2(1) p3(1)],[p2(2) p3(2)],[p2(3) p3(3)],'color',[0.6 0 0.8],'linewidth',5)%segundo eslabon del brazo
pause(0.1);
 end
% 
%  