;分段模型机程序

#LOAD "MXJ2.IS"         ;预调入指令系统/微程序
#SET RAM 0260h = 5500h  ;数据区0260H单元预置数据5500h

        org   0
start:  in    r0, 87h
        hcrc r0 ;r0不变
        jc choice2
choice1:;偶数
        mova AL,r0
        movb BX,0007h
        AND ax,bx
        st 0000h,al

        rr r0
        rr r0
        rr r0
        mova AL,r0
        movb BX,0007h
        AND ax,bx
        last 0000h
        st 0000h,al


        rr r0
        rr r0
        rr r0
        mova AL,r0
        movb BX,0003h
        AND ax,bx
        st 0001h,al
        jmp fendl
choice2:crc  R0
        movB BX,00FFh
        AND AX,BX
        ;movA AL,R0
        st 0000h,al

        rr r0
        rr r0
        rr r0
        rr r0
        mova AL,r0
        movb BX,000Fh
        AND AX,BX
        st 0001h,AL
        
fendl:   in R0,99h
        end
