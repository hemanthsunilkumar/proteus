ORG 0
STRT: MOV TMOD,#15H	;TIMER 1 AS MODE 1 TIMER
                    ;TIMER 0 AS COUNTER
      SETB P3.4		;INPUT PORT
	  MOV TL0,#00
	  MOV TH0,#00
TIM1: MOV R3,#16
BACK: MOV TL1,#0
      MOV TH1,#0
      SETB TR1	    ;START TIMER 1
      SETB TR0	    ;START COUNTER 0
CHECK:JNB TF1,CHECK	
      CLR TF1
	  DJNZ R3,BACK  ;LOOP BACK UNTILL R3=0,1S WILL BE ELAPSED
	  MOV A,TL0
	  MOV P2,A
	  MOV A,TH0
	  MOV P1,A
	  SJMP STRT
END
