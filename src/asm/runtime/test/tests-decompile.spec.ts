import type { Instr } from "@/asm/runtime/index";
import {
    compileCell,
    THROWARG,
    SETCP,
    DICTIGETJMPZ,
    DICTPUSHCONST,
    IFBITJMPREF,
    PUSHINT,
    ADD,
    IFNBITJMPREF,
    MUL,
    PUSHSLICE,
    PUSHSLICE_LONG_1,
    DEBUGSTR,
    PUSHINT_LONG,
    decompileCell,
    NEWC,
    STREFCONST,
    ENDC,
    STREF2CONST,
    SUB,
} from "@/asm/runtime/index";
import { call, execute } from "@/asm/helpers/helpers";
import { code, dictMap, hex } from "@/asm/runtime/util";
import { print } from "@/asm/text/printer";
import { Cell } from "@ton/core";

const someFunction = (): Instr[] => [MUL(), ADD()];

const test = (instructions: Instr[], expected: string): (() => void) => {
    return () => {
        const compiled = compileCell(instructions);
        const disasn = decompileCell(compiled);
        const disasnRes = print(disasn);
        expect(disasnRes).toEqual(expected);
    };
};

describe("tests with decompiled", () => {
    it(
        "with IFBITJMPREF",
        test(
            [
                SETCP(0),
                DICTPUSHCONST(
                    19,
                    dictMap(
                        new Map([
                            [
                                0,
                                [
                                    IFBITJMPREF(
                                        2,
                                        code([PUSHINT(1), PUSHINT(1), ADD()]),
                                    ),
                                ],
                            ],
                        ]),
                    ),
                ),
                DICTIGETJMPZ(),
                THROWARG(11),
            ],
            `SETCP 0
DICTPUSHCONST 19 [
    0 => {
        IFBITJMPREF 2 {
            PUSHINT 1
            PUSHINT 1
            ADD
        }
    }
]
DICTIGETJMPZ
THROWARG 11
`,
        ),
    );

    it(
        "with IFNBITJMPREF",
        test(
            [
                SETCP(0),
                DICTPUSHCONST(
                    19,
                    dictMap(
                        new Map([
                            [
                                0,
                                [
                                    IFNBITJMPREF(
                                        2,
                                        code([PUSHINT(1), PUSHINT(2), ADD()]),
                                    ),
                                ],
                            ],
                        ]),
                    ),
                ),
                DICTIGETJMPZ(),
                THROWARG(11),
            ],
            `SETCP 0
DICTPUSHCONST 19 [
    0 => {
        IFNBITJMPREF 2 {
            PUSHINT 1
            PUSHINT 2
            ADD
        }
    }
]
DICTIGETJMPZ
THROWARG 11
`,
        ),
    );

    it(
        "with call helper",
        test(
            [
                SETCP(0),
                DICTPUSHCONST(
                    19,
                    dictMap(
                        new Map([
                            [0, [...call(ADD(), PUSHINT(1), PUSHINT(2))]],
                        ]),
                    ),
                ),
                DICTIGETJMPZ(),
                THROWARG(11),
            ],
            `SETCP 0
DICTPUSHCONST 19 [
    0 => {
        PUSHINT 1
        PUSHINT 2
        ADD
    }
]
DICTIGETJMPZ
THROWARG 11
`,
        ),
    );

    it(
        "with execute helper",
        test(
            [
                SETCP(0),
                DICTPUSHCONST(
                    19,
                    dictMap(
                        new Map([
                            [
                                0,
                                [
                                    ...execute(
                                        someFunction,
                                        PUSHINT(1),
                                        PUSHINT(2),
                                        PUSHINT(3),
                                    ),
                                ],
                            ],
                        ]),
                    ),
                ),
                DICTIGETJMPZ(),
                THROWARG(11),
            ],
            `SETCP 0
DICTPUSHCONST 19 [
    0 => {
        PUSHINT 1
        PUSHINT 2
        PUSHINT 3
        PUSHCONT {
            MUL
            ADD
        }
        EXECUTE
    }
]
DICTIGETJMPZ
THROWARG 11
`,
        ),
    );

    it(
        "with PUSHSLICE",
        test(
            [
                SETCP(0),
                DICTPUSHCONST(
                    19,
                    dictMap(new Map([[0, [PUSHSLICE(hex("6_"))]]])),
                ),
                DICTIGETJMPZ(),
                THROWARG(11),
            ],
            `SETCP 0
DICTPUSHCONST 19 [
    0 => {
        PUSHSLICE x{6_}
    }
]
DICTIGETJMPZ
THROWARG 11
`,
        ),
    );

    it(
        "with PUSHSLICE_LONG_1",
        test(
            [
                SETCP(0),
                DICTPUSHCONST(
                    19,
                    dictMap(new Map([[0, [PUSHSLICE_LONG_1(hex("6_"))]]])),
                ),
                DICTIGETJMPZ(),
                THROWARG(11),
            ],
            `SETCP 0
DICTPUSHCONST 19 [
    0 => {
        PUSHSLICE_LONG_1 x{6_}
    }
]
DICTIGETJMPZ
THROWARG 11
`,
        ),
    );

    it(
        "with DEBUGSTR",
        test(
            [
                SETCP(0),
                DICTPUSHCONST(
                    19,
                    dictMap(
                        new Map([
                            [
                                0,
                                [
                                    DEBUGSTR(
                                        hex("016D61696E5F65787465726E616C"),
                                    ),
                                    DEBUGSTR(hex("01636865636B5369676E")),
                                    DEBUGSTR(hex("01636865636B5369676E32")),
                                    DEBUGSTR(hex("01636865636B5369676E33")),
                                    DEBUGSTR(hex("017265706C61795F70726F74")),
                                    DEBUGSTR(hex("017265706C61795F70726F74")),
                                    DEBUGSTR(hex("017265706C61795F70726F7432")),
                                ],
                            ],
                        ]),
                    ),
                ),
                DICTIGETJMPZ(),
                THROWARG(11),
            ],
            `SETCP 0
DICTPUSHCONST 19 [
    0 => {
        DEBUGSTR x{016D61696E5F65787465726E616C}
        DEBUGSTR x{01636865636B5369676E}
        DEBUGSTR x{01636865636B5369676E32}
        DEBUGSTR x{01636865636B5369676E33}
        DEBUGSTR x{017265706C61795F70726F74}
        DEBUGSTR x{017265706C61795F70726F74}
        DEBUGSTR x{017265706C61795F70726F7432}
    }
]
DICTIGETJMPZ
THROWARG 11
`,
        ),
    );

    it(
        "with PUSHINT_LONG 130",
        test(
            [
                SETCP(0),
                DICTPUSHCONST(
                    19,
                    dictMap(new Map([[0, [PUSHINT_LONG(130n)]]])),
                ),
                DICTIGETJMPZ(),
                THROWARG(11),
            ],
            `SETCP 0
DICTPUSHCONST 19 [
    0 => {
        PUSHINT_LONG 130
    }
]
DICTIGETJMPZ
THROWARG 11
`,
        ),
    );

    it(
        "with STREFCONST",
        test(
            [
                SETCP(0),
                NEWC(),
                STREFCONST(code([PUSHINT(5), PUSHINT(6), ADD()])),
                ENDC(),
            ],
            `SETCP 0
NEWC
STREFCONST {
    PUSHINT 5
    PUSHINT 6
    ADD
}
ENDC
`,
        ),
    );

    it(
        "with STREF2CONST",
        test(
            [
                SETCP(0),
                NEWC(),
                STREF2CONST(
                    code([PUSHINT(5), PUSHINT(6), ADD()]),
                    code([PUSHINT(6), PUSHINT(7), SUB()]),
                ),
                ENDC(),
            ],
            `SETCP 0
NEWC
STREF2CONST {
    PUSHINT 5
    PUSHINT 6
    ADD
} {
    PUSHINT 6
    PUSHINT 7
    SUB
}
ENDC
`,
        ),
    );

    it(
        "with STREF2CONST1",
        test(
            decompileCell(
                Cell.fromHex(
                    "b5ee9c724102150100079500022cff008e88f4a413f4bcf2c80bed53208e8130e1ed43d901020033a65ec0bb51343e903e903e8015481b04fe0a95185014901b0d20049401d072d721d200d200fa4021103450666f04f86102f862ed44d0fa40fa40fa0055206c1304e30202d70d1ff2e0822182100f8a7ea5bae302218210178d4519bae3022182107ac8d559ba03040c1100b2028020d7217021d749c21f9430d31f01de208210178d4519ba8e1930d33ffa00596c2113a0c855205acf1658cf1601fa02c9ed54e082107bdd97deba8e18d33ffa00596c2113a0c855205acf1658cf1601fa02c9ed54e05f0402fe31d33ffa00fa4020d70b01c30093fa40019472d7216de201f404fa00516616151443303723fa4430f2d08a8123fff8425290c705f2f4f8416f2424b8a4541432817d7106fa40fa0071d721fa00fa00306c6170f83a12a85230a0801e814e2070f838a0812af870f836aa008208989680a0a0bcf2f4216ee30201206ef2d080050701f4315183a181093e21c2fff2f425f404016e913091d1e250437080407f29481350c96d01c8556032ca00e201cf16c9543164f82ac855215acf1658cf1601fa02c910380600ac1045102410235f41f90001f9005ad76501d76582020134c8cb17cb0fcb0fcbffcbff71f9040003c8cf8580ca0012cccccf884008cbff01fa028069cf40cf8634f400c901fb0002c855205acf1658c08210178d45195008cb1f16cb3f5004fa0258cf1601206e9430cf848092cf16e201fa02216eb39f7f01ca0001206ef2d0806f2202cccc947f1601fa02c9ed540294d0d31fd2000195d4d4596f02916de21202d1012171b093352905de6d2274b08e1230814699216eb3f2f4206ef2d0806f226f029131e251a5a10172b0e30245407080407f2a04103948da080a01c245407080407f2a04103948dac855608210178d45195008cb1f16cb3f5004fa0258cf1601206e9430cf848092cf16e201fa02216eb39f7f01ca0001206ef2d0806f2202cccc947032ca00e201cf16c9543163f82ac855215acf1658cf1601fa02c90900bc705920f90022f9005ad76501d76582020134c8cb17cb0fcb0fcbffcbff71f90400c87401cb0212ca07cbffc9d010341023102750034414c8cf8580ca00cf8440ce01fa02806acf40f400c901fb0002c855205acf1658cf1601fa02c9ed5401fcc855608210178d45195008cb1f16cb3f5004fa0258cf1601206e9430cf848092cf16e201fa02216eb39f7f01ca0001206ef2d0806f2202cccc947032ca00e201cf16c9543163f82ac855215acf1658cf1601fa02c91045103410381045102410235f41f90001f9005ad76501d76582020134c8cb17cb0fcb0fcbffcbff710b0066f9040003c8cf8580ca0012cccccf884008cbff01fa028069cf40cf8634f400c901fb0002c855205acf1658cf1601fa02c9ed5401fe31d33ffa00fa4020d70b01c30093fa40019472d7216de201fa00d2000195d4d4596f02916de25416061026102510241023375194a0533870f82ac855215acf1658cf1601fa02c9f842fa44315920f90022f9005ad76501d76582020134c8cb17cb0fcb0fcbffcbff71f90400206ef2d08001ba9a8123fff8422ac705f2f4df0d02fef8416f2421f8276f1021a127c2008ee55531fa40fa0071d721fa00fa00306c6170f83a5240a012a12b6eb38e443b7170284813507ac8553082107362d09c5005cb1f13cb3f01fa0201cf1601cf16c92846145055441359c8cf8580ca00cf8440ce01fa02806acf40f400c901fb00503306e30d131697108f3c10596c81e2030e1001fe2b206ef2d0806f22705920f90022f9005ad76501d76582020134c8cb17cb0fcb0fcbffcbff71f90400c87401cb0212ca07cbffc9d02a8200ca9802c705f2f471700d206ef2d0806f222a4a13509cc8553082107362d09c5005cb1f13cb3f01fa0201cf1601cf16c910451049103c4760040555205f41f90001f9005ad765010f006ad76582020134c8cb17cb0fcb0fcbffcbff71f9040003c8cf8580ca0012cccccf884008cbff01fa028069cf40cf8634f400c901fb0000c08208989680b60972fb02256eb39322c2009170e28e3605206ef2d0808100827003c8018210d53276db58cb1fcb3fc9414013441359c8cf8580ca00cf8440ce01fa02806acf40f400c901fb0092355be202c855205acf1658cf1601fa02c9ed5402fe8e6331fa40d200596d339931f82a4330126f0301926c22e259c8598210ca77fdc25003cb1f01fa02216eb38e137f01ca0001206ef2d0806f235acf1658cf16cc947032ca00e2c90170804043137fc8cf8580ca00cf8440ce01fa02806acf40f400c901fb00e0218210595f07bcbae302333302820b93b1cebae3025bf2c082121401c831d33ffa0020d70b01c30093fa40019472d7216de201f404553030338123fff8425250c705f2f45155a181093e21c2fff2f4f8416f2443305230fa40fa0071d721fa00fa00306c6170f83a817d71811a2c70f836aa0012a012bcf2f47080405413757f061300a0c8553082107bdd97de5005cb1f13cb3f01fa0201cf1601206e9430cf848092cf16e2c9254744441359c8cf8580ca00cf8440ce01fa02806acf40f400c901fb0002c855205acf1658cf1601fa02c9ed54006cfa4001318123fff84213c70512f2f482089896808010fb027083066d40037fc8cf8580ca00cf8440ce01fa02806acf40f400c901fb009fc18b16",
                ),
            ),
            `SETCP 0
PUSHCONT {
    DICTPUSHCONST 19 [
        83229 => {
            PUSHCTR c4
            CTOS
            LDMSGADDR
            LDU 32
            ROTREV
            BLKDROP2 1 2
            CALLREF {
                OVER
            }
            BLKDROP2 2 1
        }
        104984 => {
            PUSHCTR c4
            CTOS
            LDMSGADDR
            LDU 32
            ROTREV
            BLKDROP2 1 2
            CALLREF {
                DUP
            }
            BLKDROP2 2 1
        }
    ]
    DICTIGETJMPZ
    THROWARG 11
}
POPCTR c3
DUP
IFNOTJMPREF {
    DROP
    SWAP
    CTOS
    PUSHINT 2
    SDSKIPFIRST
    LDI 1
    LDI 1
    LDMSGADDR
    OVER
    XCHG_1 s3 s4
    XCHG2 s6 s6
    TUPLE 4
    SETGLOB 1
    XCHG_0 s2
    SETGLOB 2
    PUSHCTR c4
    CTOS
    LDMSGADDR
    LDU 32
    ROTREV
    BLKDROP2 1 2
    XCHG_0 s3
    PUSHCONT_SHORT {
        BLKDROP 3
    }
    IFJMP
    PUSHINT 0
    PUSH s2
    SBITS
    DUP
    GTINT 31
    PUSHCONT_SHORT {
        NIP
        XCHG_0 s2
        LDU 32
        XCHG_0 s3
    }
    IF
    OVER
    EQINT 1
    PUSHCONT {
        XCHG_1 s2 s3
        BLKDROP 3
        SWAP
        PUSHINT 1
        CALLREF {
            ROTREV
            CALLREF {
                GETGLOB 2
                PUSH s2
                SDEQ
                THROWIFNOT 132
            }
            ROT
            ADD
        }
        NEWC
        ROTREV
        XCHG_0 s2
        STSLICE
        STU 32
        ENDC
        POPCTR c4
    }
    IFJMP
    OVER
    EQINT 2
    PUSHCONT {
        DROP2
        SWAP
        LDU 32
        DROP
        XCHG_3 s1 s2
        CALLREF {
            ROTREV
            CALLREF {
                GETGLOB 2
                PUSH s2
                SDEQ
                THROWIFNOT 132
            }
            ROT
            ADD
        }
        NEWC
        ROTREV
        XCHG_0 s2
        STSLICE
        STU 32
        ENDC
        POPCTR c4
    }
    IFJMP
    BLKDROP2 2 2
    POP s2
    EQINT 0
    SWAP
    LESSINT 33
    AND
    IFJMPREF {
        GETGLOB 2
        NEWC
        STSLICECONST x{42_}
        STSLICE
        PUSHINT 0
        STUR 111
        ENDC
        PUSHINT_8 66
        SENDRAWMSG
    }
    THROW 130
}
PUSHCTR c3
JMPX
`,
        ),
    );
});
