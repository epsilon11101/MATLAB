%/*****************************************
% *           ???????????  ??????         *
% *           ?? ????????  ? ????         *
% *           ????  ?????????????         *
% *                                       *
% *  Autor: Aar?n Miranda V.              *
% *  Correo: epsilon11101@gmail.com       *
% *  Titulo: Comunicaci?n Serial          *
% *  Descripci?n:Matlab Serial/AVR        *
% *                                       *
% *                                       *
% *****************************************/


close all;
clc;
%variable donde se almacenaran valores
lectura = zeros(1,1000);
%borrar datos previos del puerto serial
delete(instrfind({'port'},{'/dev/cu.usbmodem1411'}));
%definir el puerto
puerto = serial('/dev/cu.usbmodem1411');
%definir baudaje
puerto.BaudRate = 9600;
%abrir puerto serial
fopen(puerto);

%configuracion de la grafica
figure('Name','Graf')
title('grafica prueba')
xlabel('t')
ylabel('vcc')
grid on;
hold on;

%muestras que se mostraran en la grafica
for i=1:1000
    
    ylim([0 5.5]);
    xlim([0 1000]); % limites
    valor = fscanf(puerto,'%d'); %lectura del puerto serial
    lectura(i) = (valor/1023)*5; %% convertir valor a voltaje ref
    plot(i,lectura(i));%graficamos valor
    drawnow %actualizamos
end

%cerrar puerto 
fclose(puerto);
delete(puerto);
clear all;



