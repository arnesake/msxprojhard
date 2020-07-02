10 REM ***************************
20 REM * Programa de teste1 placa
30 REM * Projeto Hardware - CPU 22
40 REM ***************************
50 CLS:KEY OFF
55 PRINT "Projeto Hardware"
60 PRINT "Revista CPU MSX nr22"
65 PRINT "Teste 1"
70 PRINT "by Arne - arne_robotics@hotmail.com"
80 PRINT " ":PRINT "Configurando placa..."
90 GOSUB 700
100 PRINT "liga led em PB2..."
110 OUT &H3D, &H4
120 GOSUB 400: REM "TEMPO"
130 PRINT "desliga led em PB2"
140 OUT &H3D, &H0
150 GOSUB 400
160 GOTO 100
400 REM "****************************"
410 REM "Subrotina de temporizacao"
420 REM "****************************"
430 FOR I=0 TO 250
440 NEXT I
450 RETURN
700 REM "****************************"
710 REM "Configura PPI 8255"
720 REM "****************************"
730 OUT &H3F, &H80
740 OUT &H3C, &H0
750 OUT &H3D, &H0
760 OUT &H3E, &H0
770 RETURN
