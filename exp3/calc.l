/* Declarations: C code, macros, configuration */ 

DIGIT    [0-9]
ID       [a-zA-Z][a-zA-Z0-9]*

%%

[\t ]           { /* Perform no action */ }
{DIGIT}+        printf("Digit: %s \n", yytext);
{ID}            printf("Identifier: %s \n", yytext);
\n              printf("New line \n");

%%

/* User code */

int main(argc, argv)
int argc;
char **argv;
{
    // Skip over program name
    ++argv, --argc; 

    // Check if user has passed in a file path
    // If yes, set yyin to file pointer
    if ( argc > 0 )
            yyin = fopen( argv[0], "r" );
    else
            yyin = stdin;

    // Start lexing
    yylex();
}

