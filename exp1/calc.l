/* Rules are in tabular format  */

%%

[0-9]           printf("Digit: %s \n", yytext);
\n              printf("New line \n");
.               printf("Any: %s \n", yytext);

