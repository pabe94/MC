%{
#include <stdio.h>
%}


%%
"http://"|"www."[a-z]*\.[a-z]*	{printf("Pagina Web:""%s\n",yytext);}
[a-z]*[0-9]*"@"[a-z]*\.[a-z]*	{printf("Correo electronico:""%s\n", yytext);}

[^ \t\n]+	{}
[ \t]+	{}
\n	{}
%%

int main (int argc, char *argv[]) {
 if (argc == 2) {
 	yyin = fopen (argv[1], "rt");
 	if (yyin == NULL) {
 		printf ("El fichero %s no se puede abrir\n", argv[1]);
 		exit (-1);
 	}
 }
	else yyin = stdin;
	yylex ();
} 
