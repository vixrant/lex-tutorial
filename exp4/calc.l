%{
    #define T_ADD 0
    #define T_SUB 1
    #define T_MUL 2
    #define T_DIV 3
    #define T_CLEAR 4
    #define T_EXIT 5
    #define T_INTEGER 6
    #define T_PRINT 7

    #define NO_ACTION -1

    // Usually defined by Yacc
    // but we are not using Yacc right now

    #define YYSTYPE int;
    YYSTYPE yylval;
%}

DIGIT    [0-9]

%%

[\t\n; ]                { /* Perform no action */ }
("+"|"-")?{DIGIT}+      { yylval = atoi(yytext); return T_INTEGER; };
ADD|add|"+"             return T_ADD;
SUB|sub|"-"             return T_SUB;
MUL|mul|"*"             return T_MUL;
DIV|div|"/"             return T_DIV;
CLEAR|clear             return T_CLEAR;
PRINT|print             return T_PRINT;
EXIT|exit               return T_EXIT;

%%

/* User code */

int
main( argc, argv )
int argc;
char **argv;
{
    argc--; argv++;
    if ( argc > 0 )
    {
        yyin = fopen(argv[0], "r" ); 
    }

    int action = NO_ACTION;
    int curr = 0;
    int tok = -1;

    while ( 1 )
    {
        tok = yylex();

        if ( tok == T_INTEGER && action != NO_ACTION )
        {
            if ( action == T_ADD ) curr += yylval;
            else
            if ( action == T_MUL ) curr *= yylval;
            else
            if ( action == T_SUB ) curr -= yylval;
            else
            if ( action == T_DIV ) curr /= yylval;

            action = NO_ACTION;
        }
        else
        if ( tok == T_ADD || tok == T_SUB || tok == T_MUL || tok == T_DIV )
        {
            action = tok;
        }
        else
        if ( tok == T_CLEAR )
        {
            curr = 0;
        }
        else
        if ( tok == T_PRINT )
        {
            printf("%d\n", curr);
        }
        else
        if ( tok == T_EXIT )
        {
            break;
        }
    }
    
    fclose(yyin);
}

