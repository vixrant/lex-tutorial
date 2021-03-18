/* Declarations: C code, macros, configuration */ 

DIGIT    [0-9]
ID       [a-zA-Z][a-zA-Z0-9]*

%%

[\t ]           { /* Perform no action */ }
{DIGIT}+        printf("Digit: %s \n", yytext);
{ID}            printf("Identifier: %s \n", yytext);
\n              printf("New line \n");

