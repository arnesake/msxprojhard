10 REM "******************************"
20 REM "* PROJETO PAINEL DE MSG MSX   "
30 REM "* HW DE BASE: PLACA PROJETO   "
40 REM "* HARDWARE REVISTA CPU MSX 22 "
50 REM "* + PLACA MSX_PAINEL_MSG BY   "
60 REM "* arne_robotics@hotmail.com   "
70 REM "******************************"
80 SCREEN 0:CLS:KEY OFF
90 PRINT "TESTE PLACA MSX_PAINEL_MSG"
100 PRINT "BY ARNE - arne_robotics@hotmail.com"
110 PRINT "CONFIGURANDO PPI8255..."
120 GOSUB 690
130 PRINT "TESTANDO PAINEL..."
140 GOSUB 770
150 GOSUB 180
160 LOCATE 0,2
170 GOTO 130
180 REM "*****************************"
190 REM "* ROTINA DE TESTE DO PAINEL  "
200 REM "*****************************"
210 A = 1: B=1: C=0: Z=3: Y=2
220 FOR I=1 TO 7
230 IF I=1 OR I=3 OR I=5 OR I=7 THEN GOSUB 360 ELSE GOSUB 380
240 FOR J=N TO M STEP O
250 B=J:C=0
260 LOCATE Z+3,7+I:PRINT "*":W=Z:Z=Z+Y
270 GOSUB 550: GOSUB 630
280 LOCATE W+3,7+I: PRINT " "
290 NEXT J
300 OUT &H3E,1
310 IF Z>31 THEN Z=W
320 IF Z<3 THEN Z=W
330 A = A * 2
340 NEXT I
350 GOTO 400
360 N=0: M=14: O=1: Y=2
370 RETURN
380 N=14: M=0: O=-1: Y=-2
390 RETURN
400 A=64:B=14:C=0:Z=31:Y=2
410 FOR I=1 TO 7
420 IF I=1 OR I=3 OR I=5 OR I=7 THEN GOSUB 380 ELSE GOSUB 360
430 FOR J=N TO M STEP O
440 B=J:C=0
450 LOCATE Z+3,7+(8-I):PRINT "*":W=Z:Z=Z+Y
460 GOSUB 550: GOSUB 630
470 LOCATE W+3,7+(8-I):PRINT " "
480 NEXT J
490 OUT &H3E,1
500 IF Z>31 THEN Z=W
510 IF Z<3 THEN Z=W
520 A=A/2
530 NEXT I
540 RETURN
550 REM "*****************************"
560 REM "* SUBROTINA DE ENVIO PARA    "
570 REM "* PPI 8255                   "
580 REM "*****************************"
590 OUT &H3C,A
600 OUT &H3D,B
610 OUT &H3E,C
620 RETURN
630 REM "*****************************"
640 REM "* SUBROTINA DE TEMPORIZACAO  "
650 REM "*****************************"
660 FOR K=0 TO 63
670 NEXT K
680 RETURN
690 REM "*****************************"
700 REM "* CONFIGURA PPI 8255         "
710 REM "*****************************"
720 OUT &H3F, &H80
730 A=0: OUT &H3C, A
740 B=0: OUT &H3D, B
750 C=1: OUT &H3E, C
760 RETURN
770 REM "*****************************"
780 REM "* SUBROTINA PARA TELA        "
790 REM "*****************************"
800 LOCATE 18,5: PRINT "COLUNAS"
810 LOCATE 3,7
820 PRINT "   A B C D E F G H I J K L M N O"
830 FOR I=1 TO 7
840 LOCATE 3,7+I
850 PRINT I
860 NEXT I
870 LOCATE 0,8: PRINT "L"
880 LOCATE 0,9: PRINT "I"
890 LOCATE 0,10: PRINT "N"
900 LOCATE 0,11: PRINT "H"
910 LOCATE 0,12: PRINT "A"
920 LOCATE 0,13: PRINT "S"
930 RETURN