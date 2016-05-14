%{
#include <stdio.h>
%}


%%
([0-4][0-9][0-9][0-9][0-9])				{printf("Codigo Postal:""%s\n", yytext);}
[0-3][0-9]\-[0-1][0-9]\-[0-2][0-9][0-9][0-9]	{printf("Fecha:""%s\n",yytext);}
[0-9][0-9][0-9][0-9][A-Z][A-Z][A-Z]			{printf("Matrícula:""%s\n", yytext);}
[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][A-Z]		{printf("DNI:""%s\n", yytext);}
[69][0-9][0-9]\-[0-9][0-9]\-[0-9][0-9]\-[0-9][0-9]		{printf("Telefono:""%s\n", yytext);}

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
