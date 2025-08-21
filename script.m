% Script de GNU Octave para cálculos matemáticos
printf("🧮 Ejecutando GNU Octave en Docker\n\n");

% Calcular números de Fibonacci
n = 15;
fib = zeros(1, n);
fib(1) = 1;
fib(2) = 1;

for i = 3:n
    fib(i) = fib(i-1) + fib(i-2);
end

printf("Fibonacci primeros %d números:\n", n);
disp(fib);

% Calcular π usando series
terms = 1000000;
pi_approx = 0;
for k = 0:terms
    pi_approx += ((-1)^k) / (2*k + 1);
end
pi_approx *= 4;

printf("\nπ aproximado con %d términos: %.10f\n", terms, pi_approx);
printf("π real: %.10f\n", pi);
printf("Error: %.10f\n", abs(pi - pi_approx));

% Matriz de ejemplo
A = [1, 2, 3; 4, 5, 6; 7, 8, 9];
printf("\nMatriz de ejemplo A:\n");
disp(A);

printf("\n✅ Script completado exitosamente\n");