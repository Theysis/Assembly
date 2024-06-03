; Joshua Wyatt
; 09/22/2021
; Source.asm - Reads a value from an array, adds the value to shift,
;   and saves the sum of the two values to a register
.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
	input byte 1,2,3,4,5,6,7,8
	shift byte 2

.code
	main PROC
	
		mov EAX,0
		mov EBX,0
		mov ECX,0
		mov EDX,0

; AH AL BH BL CH CL DH DL
		mov AH,input
		add AH,shift

		mov AL,input+1
		add AL,shift

		mov BH,input+2
		add BH,shift

		mov BL,input+3
		add BL,shift

		mov CH,input+4
		add CH,shift

		mov CL,input+5
		add CL,shift

		mov DH,input+6
		add DH,shift

		mov DL,input+7
		add DL,shift


		INVOKE ExitProcess,0
	main ENDP
END main