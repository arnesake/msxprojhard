10 REM ***************************
20 REM * Programa de teste4 placa
30 REM * Projeto Hardware - CPU 22
40 REM ***************************
50 CLS:KEY OFF
55 PRINT "Projeto Hardware"
60 PRINT "Revista CPU MSX nr22"
65 PRINT "Teste 4"
70 PRINT "by Arne - arne_robotics@hotmail.com"
80 PRINT " ":PRINT "Configurando placa..."
90 GOSUB 700
95 N=7
100 LOCATE 0,N:PRINT "Liga sequencia de LEDs"
110 A=0:B=0:C=0: GOSUB 500 :L=1: K=2
115 B=L:C=CXOR1:GOSUB 500: N=N+1: LOCATE 0,N: PRINT "*";L: GOSUB 400
120 FOR J=0 TO 6
130 L = L * K
140 B=L:C=CXOR1:GOSUB 500: LOCATE 0,N: PRINT" ": N=N+1: PRINT "*";L
150 GOSUB 400: REM "TEMPO"
160 NEXT J
170 B=0: REM "APAGA PB"
180 FOR J=1 TO 2
190 A=J:C=CXOR1:GOSUB 500
200 LOCATE 0,N: PRINT" ": N=N+1: LOCATE 0,N: PRINT "*";J: GOSUB 400
210 NEXT J
220 LOCATE 0,N: PRINT " "
230 FOR J=2 TO 1 STEP-1
240 A=J: C=CXOR1 :GOSUB 500
250 LOCATE 0,N: PRINT "*";J
260 GOSUB 400
270 LOCATE 0,N: PRINT " "
280 N = N-1
290 NEXT J
300 A=0: L = 128: K = 2
310 B=L:C=CXOR1:GOSUB 500: LOCATE 0,N: PRINT "*";L
315 GOSUB 400
320 FOR J=0 TO 6
330 LOCATE 0,N: PRINT " ": N=N-1
340 L = L / 2: B=L:C=CXOR1: GOSUB500
350 LOCATE 0,N: PRINT "*";L
360 GOSUB 400
370 NEXT J
380 N=7: GOTO 100
400 REM "****************************"
410 REM "Subrotina de temporizacao"
420 REM "****************************"
430 FOR I=0 TO 125
440 NEXT I
450 RETURN
500 REM "***************************"
510 REM "Subrotina de envio para PPI"
520 REM "***************************"
530 OUT &H3C,A: OUT &H3D,B: OUT &H3E,C
540 RETURN
700 REM "****************************"
710 REM "Configura PPI 8255"
720 REM "****************************"
730 OUT &H3F, &H80
740 OUT &H3C, &H0
750 OUT &H3D, &H0
760 OUT &H3E, &H0
770 RETURN
