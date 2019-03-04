%Metodos Numericos 543 25 de febrero de 2019
%Practica 4 - Ejercicio 
%Navarro Rodriguez Juan Francisco
%Simple bot 895
%Este programa aproxima por el metodo de iteracion simple de punto fijo
%a la raiz de f(x) = sin(sqrt(x))-x
clc;clear;
%Constantes
maxi = 15; %numero maximo de iteraciones
cifras = 5; %cantidad de cifras minimas de la aproximacion

f = @(x) sin(sqrt(x))-x; %funcion anonima

% como x = g(x)
g = @(x) sin(sqrt(x)); %funcion anonima

xinf = 0; % x l inicial
xsup = 1; % x u inicial
xaprox = 0; % x r
eaprox = inf;
tol = 0.01; % porciento de tolerancia

vectorea = []
vectori = []

fprintf(['\n\nSimple bot 895\n\tEste programa aproxima de forma numerica', ...
'\n\tpor el metodo de iteracion simple de punto fijo, los ceros de una funcion,', ...
'\n\tcuya f(x) = sin(sqrt(x))-x', ...
'\n\nAproximacion', ...
'\nse espera un maximo de %d iteraciones\nse tiene una tolerancia de %f %%\n\n', ...
], maxi, tol);


%grafica
res = 100; %resolucion
stepsize = (xsup-xinf)/res;
xvector = xinf:stepsize:xsup;
yvector = arrayfun(f,xvector);
plot(xvector,yvector,'r','LineWidth',3);
xlabel('Valor de x','FontSize',20);
ylabel('Valor de la funcion','FontSize',20);
title('Grafica de la funcion','FontSize',20);
grid on;

%con base en la grafica, te das cuenta
%que la segunda raiz esta cerca a 0.5
xaprox = 0.5;
fprintf(['\n   i','\t|Xi\t','\t|g(x)\t','\t|Ea']);

for i = 1:(maxi)
	xold = xaprox;
	xaprox = g(xold);


	fprintf(['\n   %d','\t|%f','\t|%f'],i,xold,xaprox)

	if (i ~= 1)
		eaprox = abs((1-xold/xaprox)*100);
		fprintf('\t|%f %%',eaprox)
	else
		fprintf('\t|\t')
	end

	vectorea = [vectorea,eaprox];
	vectori = [vectori,i];

	if (eaprox < tol)
		break;
	end
end
fprintf('\n\nEl valor al que se llego fue de:\n\tx = %f\n\tf(x) = %f\n',xold,f(xold))


%grafica
figure;
semilogy(vectori,vectorea,'b','LineWidth',3);
xlabel('Numero de iteracion','FontSize',20);
ylabel('Error de la aproximacion','FontSize',20);
title('Grafica del error respecto a el numero de iteracion','FontSize',15);
grid on;