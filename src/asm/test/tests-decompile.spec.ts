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
} from "../runtime"
import {call, execute} from "../helpers/helpers"
import {code, dictMap, hex} from "../runtime/util"
import {print} from "../text/printer"

interface TestCase {
    readonly name: string
    readonly instructions: Instr[]
    readonly expected: string
}

const someFunction = (): Instr[] => [MUL(), ADD()]

const TESTS: TestCase[] = [
    {
        name: "IFBITJMPREF",
        instructions: [
            SETCP(0),
            DICTPUSHCONST(
                19,
                dictMap(new Map([[0, [IFBITJMPREF(2, code([PUSHINT(1), PUSHINT(1), ADD()]))]]])),
            ),
            DICTIGETJMPZ(),
            THROWARG(11),
        ],
        expected: `SETCP 0
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
    },
    {
        name: "IFNBITJMPREF",
        instructions: [
            SETCP(0),
            DICTPUSHCONST(
                19,
                dictMap(new Map([[0, [IFNBITJMPREF(2, code([PUSHINT(1), PUSHINT(2), ADD()]))]]])),
            ),
            DICTIGETJMPZ(),
            THROWARG(11),
        ],
        expected: `SETCP 0
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
    },

    {
        name: "call",
        instructions: [
            SETCP(0),
            DICTPUSHCONST(19, dictMap(new Map([[0, [...call(ADD(), PUSHINT(1), PUSHINT(2))]]]))),
            DICTIGETJMPZ(),
            THROWARG(11),
        ],
        expected: `SETCP 0
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
    },

    {
        name: "execute",
        instructions: [
            SETCP(0),
            DICTPUSHCONST(
                19,
                dictMap(
                    new Map([[0, [...execute(someFunction, PUSHINT(1), PUSHINT(2), PUSHINT(3))]]]),
                ),
            ),
            DICTIGETJMPZ(),
            THROWARG(11),
        ],
        expected: `SETCP 0
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
    },

    {
        name: "PUSHSLICE",
        instructions: [
            SETCP(0),
            DICTPUSHCONST(19, dictMap(new Map([[0, [PUSHSLICE(hex("6_"))]]]))),
            DICTIGETJMPZ(),
            THROWARG(11),
        ],
        expected: `SETCP 0
DICTPUSHCONST 19 [
    0 => {
        PUSHSLICE x{6_}
    }
]
DICTIGETJMPZ
THROWARG 11
`,
    },
    {
        name: "PUSHSLICE_LONG_1",
        instructions: [
            SETCP(0),
            DICTPUSHCONST(19, dictMap(new Map([[0, [PUSHSLICE_LONG_1(hex("6_"))]]]))),
            DICTIGETJMPZ(),
            THROWARG(11),
        ],
        expected: `SETCP 0
DICTPUSHCONST 19 [
    0 => {
        PUSHSLICE_LONG_1 x{6_}
    }
]
DICTIGETJMPZ
THROWARG 11
`,
    },
    {
        name: "DEBUGSTR",
        instructions: [
            SETCP(0),
            DICTPUSHCONST(
                19,
                dictMap(
                    new Map([
                        [
                            0,
                            [
                                DEBUGSTR(hex("016D61696E5F65787465726E616C")),
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
        expected: `SETCP 0
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
    },
    {
        name: "PUSHINT_LONG 130",
        instructions: [
            SETCP(0),
            DICTPUSHCONST(19, dictMap(new Map([[0, [PUSHINT_LONG(130n)]]]))),
            DICTIGETJMPZ(),
            THROWARG(11),
        ],
        expected: `SETCP 0
DICTPUSHCONST 19 [
    0 => {
        PUSHINT_LONG 130
    }
]
DICTIGETJMPZ
THROWARG 11
`,
    },
    {
        name: "STREFCONST",
        instructions: [SETCP(0), NEWC(), STREFCONST(code([PUSHINT(5), PUSHINT(6), ADD()])), ENDC()],
        expected: `SETCP 0
NEWC
STREFCONST {
    PUSHINT 5
    PUSHINT 6
    ADD
}
ENDC
`,
    },
    {
        name: "STREF2CONST",
        instructions: [
            SETCP(0),
            NEWC(),
            STREF2CONST(
                code([PUSHINT(5), PUSHINT(6), ADD()]),
                code([PUSHINT(6), PUSHINT(7), SUB()]),
            ),
            ENDC(),
        ],
        expected: `SETCP 0
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
    },
]

describe("tests with decompiled", () => {
    TESTS.forEach(({name, instructions, expected}: TestCase) => {
        it(`Test ${name}`, async () => {
            const compiled = compileCell(instructions)

            const disasn = decompileCell(compiled)
            const disasnRes = print(disasn)

            expect(disasnRes).toEqual(expected)
        })
    })
})
