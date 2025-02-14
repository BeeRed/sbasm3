                .LF     test.lst
;---------------------------------------------------------------------------
;   1805.asm
;
;   Opcode test for the SB-Assembler 1805 cross
;
;---------------------------------------------------------------------------

                .CR     1805            And now it's an 1805 assembler
                .TF     test.hex,hex
                .OR     $100
                .LI     TON

;---------------------------------------------------------------------------
;   Implied addressing mode instructions
;---------------------------------------------------------------------------

                IRX
                LDX
                LDXA
                STXD
                OR
                XOR
                AND
                SHR
                SHRC
                RSHR
                SHL
                SHLC
                RSHL
                ADD
                ADC
                SD
                SDB
                SM
                SMB
                IDL
                NOP
                SEQ
                REQ
                SAV
                MARK
                RET
                DIS

                ETQ
                LDC
                GEC
                STPC
                DTC
                STM
                SCM1
                SCM2
                SPM1
                SPM2
                XIE
                XID
                CIE
                CID

                DADD
                DADC
                DSM
                DSMB
                DSAV

;---------------------------------------------------------------------------
;   Register instructions
;---------------------------------------------------------------------------

                INC     0
                DEC     1
                GLO     2
                PLO     3
                GHI     4
                PHI     5
                LDN     6               Operand may not be 0!
                LDA     7
                STR     8
                SEP     9
                SEX     10
                OUT     1               Range between 1 and 7
                INP     7               Range between 1 and 7

                RLXA    1
                RSXD    2
                RNX     3
                SCAL    4,#$1234        #, /, \, = are optional
                SCAL    4,$1234
                SRET    5
                DBNZ    6,#$1234        #, /, \, = are optional
                DBNZ    6,$1234

;---------------------------------------------------------------------------
;   Immediate addressing
;---------------------------------------------------------------------------

                LDI     #$1234
                ORI     $1234
                XRI     /$1234
                ANI     =$12345678
                ADI     \$12345678
                ADCI    $12
                SDI     #$12
                SDBI    123
                SMI     #$12
                SMBI    #$12

                RLDI    0,$1234
                RLDI    1,#$12345678
                RLDI    2,/$12345678
                RLDI    3,=$12345678
                RLDI    4,\$12345678

                DADI    $12
                DACI    $12
                DSMI    $12
                DSBI    $12

;---------------------------------------------------------------------------
;   Branching
;---------------------------------------------------------------------------

                BR      $123
                NBR     $123
                BZ      $123
                BNZ     $123
                BDF     $123
                BPZ     $123
                BGE     $123
                BNF     $123
                BM      $123
                BL      $123
                BQ      $123
                BNQ     $123
                B1      $123
                BN1     $123
                B2      $123
                BN2     $123
                B3      $123
                BN3     $123
                B4      $123
                BN4     $123

                BCI     $123
                BXI     $123

# Branch range testing. Make != 0 to do the tests.
# Produces errors and warnings.
TESTING = 0
        .DO TESTING
                BR      $100        This is OK
                BR      $200        Out of range
                BR      $0FF        Out of range

                .OR     $1FE
                BR      $123        This is OK
                BR      $200        This is OK
                .OR     $1FF
                BR      $123        This is out of range
                .OR     $1FF
                BR      $234        This is OK
        .FI

;---------------------------------------------------------------------------
;   Long Branching
;---------------------------------------------------------------------------

                LBR     $1234
                NLBR    $1234
                LBZ     $1234
                LBNZ    $1234
                LBDF    $1234
                LBNF    $1234
                LBQ     $1234
                LBNQ    $1234

;---------------------------------------------------------------------------
;   Skip and Long Skip instructions
;   Used to skip one or two byte instructions, instead of jumping to a new
;   destination.
;---------------------------------------------------------------------------

                SKP
                LSKP
                LSZ
                LSNZ
                LSDF
                LSNF
                LSQ
                LSNQ
                LSIE
