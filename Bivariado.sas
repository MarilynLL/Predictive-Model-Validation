libname PG1 "/home/u63456768/EPG194/data";

FILENAME REFFILE '/home/u63456768/Trabajo/001 ANALISIS_BIVARIADO_2.csv';

/* Importamos la información mediante un archivo csv*/
PROC IMPORT DATAFILE=REFFILE
	DBMS=CSV
	OUT=WORK.Datanalisis;
	GETNAMES=YES;
RUN;

/*Para visualizar el archivo como tabla*/
PROC PRINT data=work.Datanalisis;



/*Se realiza una normalización de los datos, es decir, se convierten en variables Z con media = 0 y varianza de 1*/
proc standard data=Datanalisis out=salida mean=0 std=1 noprint;
/*Se puede escribir este código o sólo poner ¨var¨ para realizar la instrucción en todas las variables*/
var var1 var2 var3;
run;

 
/*la instrucción obtiene los resultados de la tabla salida, junto con los coeficientes de pearson y spearman*/
proc corr data=salida outs=Salida_spearman outp=Salida_Pearson noprint;
var var1 var2 var3;
run;
