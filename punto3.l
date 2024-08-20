%{
#include <stdio.h>
%}

%%


[0-9]+(\.[0-9]+)?           { printf("Número: %s\n", yytext); }

/* Operadores matemáticos */
\+                          { printf("Operador: Suma (+)\n"); }
\-                          { printf("Operador: Resta (-)\n"); }
\*                          { printf("Operador: Multiplicación (*)\n"); }
\/                          { printf("Operador: División (/)\n"); }
\(                          { printf("Paréntesis: Apertura (()\n"); }
\)                          { printf("Paréntesis: Cierre ())\n"); }
\=                          { printf("Operador: Igual (=)\n"); }


[ \t\n]+                    { /* No hacer nada */ }


.                           { printf("Carácter no reconocido: %s\n", yytext); }

%%

int main(int argc, char **argv) {
    if (argc > 1) {
        FILE *file = fopen(argv[1], "r");
        if (!file) {
            perror("No se pudo abrir el archivo");
            return 1;
        }
        yyin = file;
    }

    yylex();  /* Ejecuta el análisis léxico */

    return 0;
}

int yywrap() {
    return 1;
}

