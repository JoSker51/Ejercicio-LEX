%{
#include <stdio.h>
#include <string.h>

int chars = 0;
int words = 0;
int lines = 0;
%}

%%
[a-zA-Z]+ { words++; chars += strlen(yytext); }  /* Contar palabras y caracteres alfabéticos */
[0-9]+    { words++; chars += strlen(yytext); }  /* Contar números como palabras y caracteres */
\n        { chars++; lines++; }  /* Contar líneas y caracteres */
[ \t]+    { chars += strlen(yytext); }  /* Contar espacios y tabulaciones como caracteres */
.         { chars++; }  /* Contar cualquier otro carácter */

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

    printf("Líneas: %d\nPalabras: %d\nCaracteres: %d\n", lines, words, chars);

    return 0;
}

int yywrap() {
    return 1;
}

