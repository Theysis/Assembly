; Joshua Wyatt
; 10/15/2021
; Source.asm - Reads a value from an array and places the value in another
;   array with the location shifted by a certain amount.
.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
	input byte 1,2,3,4,5,6,7,8
	output byte LENGTHOF input DUP(?)
	shift DWORD 5

.code
	main PROC
		; clears ecx, al
		mov ecx,0
		mov al,0
		; ecx : lengthof input - shift
		mov ecx,shift
		mov esi,lengthof input
		sub esi,shift
		mov edi,0
		; offset pointer ecx distance
		L1:
			mov al,input[esi]
			mov output[edi],al
			inc esi
			inc edi
		loop L1
		; Resets esi back to 0
		mov esi,0
		mov ecx,lengthof input
		sub ecx,shift
		;fills in remaining array
		L2:
			mov al,input[esi]
			mov output[edi],al
			inc esi
			inc edi
		loop L2

		INVOKE ExitProcess,0
	main ENDP
END main
