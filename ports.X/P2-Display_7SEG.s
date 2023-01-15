;--------------------------------------------------------------
; @file	  = P2-Display_7SEG.s
; @brief  = Este programa esta diseñado para mostar en el display
;           una cuenta ascendente del 0 al 9 automaticamente y solo 
;	    cuando se mantiene presionado el pulsador va a contar del 
;	    A al F. 
; @date   = 13/01/23
; @author = Alexander Arturo Flores Juarez
; Tarjeta = Curiosity Nano PIC18F57Q84
; Entorno = MPLAB X IDE
; Idioma  = AMS 
; Frecuencia del oscilador = 4Mhz   
;------------------------------------------------------------------    
    
include "Bit_config.inc"  // config statements should precede project file includes.
#include <xc.inc>  

PSECT resetVect,class=CODE,reloc=2
resetVect:
    goto Main
    PSECT udata_acs
contador1: DS 1   
contador2: DS 1            ; reserva 1 byte en access ram
contador3: DS 1    
    
    
PSECT CODE
 
Main:
     CALL Config_OSC,1
     CALL Config_Port,1
     CALL Delay_1s,1
     nop
     
BUTTONPRESS:
     BTFSS  PORTA,3,b       ;PORTA<3> = 0? - Button press?
     GOTO   Valores_A_al_F 
     GOTO   Valores_0_al_9
    
Valores_0_al_9:
    BANKSEL PORTD
    MOVLW    01000000B     ;w--> combinacion del Numero 0  
    MOVWF    LATD,b        ;(w)-->LATD<7:0>
    CALL     Delay_1s,1    ;RETARDO DE 1s
    BTFSS   PORTA,3,0      ;PORTA<3> = 0? - Button press?
    goto    Valores_A_al_F
    
    
    MOVLW    011111001B    ;w--> combinacion del Numero 1  
    MOVWF    LATD,b        ;(w)-->LATD<7:0>
    CALL     Delay_1s,1    ;RETARDO DE 1s
    BTFSS   PORTA,3,0      ;PORTA<3> = 0? - Button press?
    goto    Valores_A_al_F
       
    MOVLW    00100100B     ;w--> combinacion del Numero 2 
    MOVWF    LATD,b        ;(w)-->LATD<7:0>
    CALL     Delay_1s,1    ;RETARDO DE 1s
    BTFSS   PORTA,3,0      ;PORTA<3> = 0? - Button press?
    goto    Valores_A_al_F
    
    MOVLW    00110000B     ;w--> combinacion del Numero 3 
    MOVWF    LATD,b        ;(w)-->LATD<7:0>
    CALL     Delay_1s,1    ;RETARDO DE 1s
    BTFSS   PORTA,3,0      ;PORTA<3> = 0? - Button press?
    goto    Valores_A_al_F
    
    
    MOVLW    00011001B     ;w--> combinacion del Numero 4
    MOVWF    LATD,b        ;(w)-->LATD<7:0>
    CALL     Delay_1s,1    ;RETARDO DE 1s
    BTFSS   PORTA,3,0      ;PORTA<3> = 0? - Button press?
    goto    Valores_A_al_F
    
    MOVLW    00010010B     ;w--> combinacion del Numero 5
    MOVWF    LATD,b        ;(w)-->LATD<7:0>
    CALL     Delay_1s,1    ;RETARDO DE 1s
    BTFSS   PORTA,3,0      ;PORTA<3> = 0? - Button press?
    goto    Valores_A_al_F
    
    MOVLW    00000010B     ;w--> combinacion del Numero 6
    MOVWF    LATD,b        ;(w)-->LATD<7:0>
    CALL     Delay_1s,1    ;RETARDO DE 1s
    BTFSS   PORTA,3,0      ;PORTA<3> = 0? - Button press?
    goto    Valores_A_al_F
    
    MOVLW    01111000B     ;w--> combinacion del Numero 7
    MOVWF    LATD,b        ;(w)-->LATD<7:0>
    CALL     Delay_1s,1    ;RETARDO DE 1s
    BTFSS   PORTA,3,0      ;PORTA<3> = 0? - Button press?
    goto    Valores_A_al_F
    
    MOVLW    00000000B     ;w--> combinacion del Numero 8
    MOVWF    LATD,b        ;(w)-->LATD<7:0>
    CALL     Delay_1s,1    ;RETARDO DE 1s
    BTFSS   PORTA,3,0      ;PORTA<3> = 0? - Button press?
    goto    Valores_A_al_F
    
    MOVLW    00011000B     ;w--> combinacion del Numero 9
    MOVWF    LATD,b        ;(w)-->LATD<7:0> 
    CALL     Delay_1s,1    ;RETARDO DE 1s
    BTFSS   PORTA,3,0      ;PORTA<3> = 0? - Button press?
    goto    Valores_A_al_F
    goto    BUTTONPRESS
    
Valores_A_al_F:
    MOVLW    00001000B     ;w--> combinacion de la letra A
    MOVWF    LATD,b        ;(w)-->LATB<7:0>
    CALL     Delay_1s,1    ;RETARDO DE 1s
    BTFSC   PORTA,3,0      ;PORTA<3> = 0? - Button press?
    goto    Valores_0_al_9
     
    MOVLW    000000011B    ;w--> combinacion de la letra B
    MOVWF   LATD,b         ;(w)-->LATD<7:0> 
    CALL     Delay_1s,1    ;RETARDO DE 1s
    BTFSC   PORTA,3,0      ;PORTA<3> = 0? - Button press?
    goto    Valores_0_al_9
    
    MOVLW    01000110B    ;w--> combinacion de la letra C
    MOVWF    LATD,b       ;(w)-->LATD<7:0>
    CALL     Delay_1s,1   ;RETARDO DE 1s
    BTFSC   PORTA,3,0     ;PORTA<3> = 0? - Button press?
    goto    Valores_0_al_9
    
    MOVLW    00100001B    ;w--> combinacion de la letra D
    MOVWF    LATD,b       ;(w)-->LATD<7:0>
    CALL     Delay_1s,1   ;RETARDO DE 1s
    BTFSC   PORTA,3,0     ;PORTA<3> = 0? - Button press?
    goto    Valores_0_al_9
    
    
    MOVLW    00000110B    ;w--> combinacion de la letra E
    MOVWF    LATD,b       ;(w)-->LATD<7:0>
    CALL     Delay_1s,1   ;RETARDO DE 1s
    BTFSC   PORTA,3,0     ;PORTA<3> = 0? - Button press?
    goto    Valores_0_al_9
    
    MOVLW    00001110B     ;w--> combinacion de la letra F
    MOVWF   LATD,b         ;(w)-->LATD<7:0>
    CALL     Delay_1s,1    ;RETARDO DE 1s
    BTFSC   PORTA,3,0      ;PORTA<3> = 0? - Button press?
    goto    Valores_0_al_9
    GOTO    Valores_A_al_F

    
    
Config_OSC:
        ;Configuracion del Oscilador interno a una frecuencia interna de 4Mhz 
         BANKSEL OSCCON1
	 MOVLW 0X60     ;Seleccionamos el bloque del osc con un Div:1
	 MOVWF OSCCON1,1
	 MOVLW 0X02     ;Seleccionamos una Frecuencia de 4Mhz
	 MOVWF OSCFRQ ,1
         RETURN

Config_Port:   ;PORT-LAT-ANSEL-TRIS  LED:RF3,  BUTTON:RA3
    ;Config Led
    BANKSEL  TRISD
    CLRF     TRISD,b    ;TRISC = 0 Como salida
    
         
    ;Config Button
    BANKSEL PORTA
    CLRF    PORTA,b     ;PortA<7:0> = 0 
    CLRF    ANSELA,b    ;PortA Digital
    BSF     TRISA,3,b   ;RA3 como entrada
    BSF     WPUA,3,b    ;Activamos la resistencia Pull-up del pin RA3
    RETURN   


;T= (6 + 4k1)(k2)(k3)us          1Tcy=1us 
Delay_1s:                  ;2Tcy--call
    MOVLW   4              ;1TCY--k3
    MOVWF   contador3,0    ;1TCY
       
D_1s:                 
    MOVLW   250             ;1Tcy--k2
    MOVWF   contador2,0     ;1Tcy
    
Ext1s_Loop:                  
    MOVLW   249             ;1Tcy--k1
    MOVWF   contador1,0     ;1Tcy
Int1s_Loop:
    NOP                     ;K1*Tcy
    DECFSZ  contador1,1,0   ;(k1-1)+ 3Tcy           
    GOTO    Int1s_Loop      ;2Tcy
    DECFSZ  contador2,1,0   ;2Tcy
    GOTO    Ext1s_Loop      ;2Tcy  
    DECFSZ  contador3,1,0   ;2TCY
    GOTO    D_1s
    RETURN                  ;2Tcy     
    

END resetVect

