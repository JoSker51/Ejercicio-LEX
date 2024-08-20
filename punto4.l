%{
#include <stdio.h>
%}

%%
[0-9]+      { printf("NUMBER(%s)\n", yytext); }   /* Reconoce números */
"+"         { printf("ADD(+)\n"); }              /* Reconoce el operador de suma */
"-"         { printf("SUB(-)\n"); }              /* Reconoce el operador de resta */
"*"         { printf("MUL(*)\n"); }              /* Reconoce el operador de multiplicación */
"/"         { printf("DIV(/)\n"); }              /* Reconoce el operador de división */
"abs"       { printf("ABS(abs)\n"); }            /* Reconoce la palabra 'abs' */
\n          { printf("EOL\n"); }                 /* Reconoce fin de línea (EOL) */
.           { printf("Token no reconocido: %s\n", yytext); }  /* Cualquier otro carácter no reconocido */

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

