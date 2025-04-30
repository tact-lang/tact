import {
    compileCell,
    Instr,
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
});
