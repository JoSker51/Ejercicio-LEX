%{
#include <stdio.h>
#include <stdlib.h>
%}

/* Definimos la unión que contiene los tipos de datos que usaremos */
%union {
    float fval;
    char* sval;
}

/* Declaramos los tokens y los tipos que devolverán */
%token <fval> NUMBER
%token <sval> ADD SUB MUL DIV LPAREN RPAREN EQUAL EOL

/* Declaramos el tipo de la regla gramatical */
%type <fval> expression
%type <sval> symbol

/* Precedencia de operadores */
%left ADD SUB
%left MUL DIV
%right EQUAL

%%

calculation:
    /* vacío */
    | calculation expression EOL { printf("Resultado: %f\n", $2); }
    | calculation symbol EOL     { printf("Símbolo: %s\n", $2); }
    ;

expression:
    NUMBER                          { $$ = $1; }
    | expression ADD expression     { $$ = $1 + $3; }
    | expression SUB expression     { $$ = $1 - $3; }
    | expression MUL expression     { $$ = $1 * $3; }
    | expression DIV expression     { $$ = $1 / $3; }
    | LPAREN expression RPAREN      { $$ = $2; }
    | expression EQUAL expression   { printf("Resultado: %f\n", $1); $$ = $1; }
    ;

symbol:
    ADD   { $$ = "suma (+)"; }
    | SUB { $$ = "resta (-)"; }
    | MUL { $$ = "multiplicación (*)"; }
    | DIV { $$ = "división (/)"; }
    | LPAREN { $$ = "paréntesis de apertura (()"; }
    | RPAREN { $$ = "paréntesis de cierre ())"; }
    | EQUAL { $$ = "igual (=)"; }
    ;

%%

int main() {
    printf("Ingrese una expresión o un símbolo:\n");
    yyparse();
    return 0;
}

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

