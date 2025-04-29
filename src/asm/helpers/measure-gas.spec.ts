import {Instr, PUSHINT, THROWIF, CHKDEPTH, CALLDICT, CALLDICT_LONG} from "../runtime"
import {measureGas} from "./measure-gas"

interface TestCase {
    readonly name: string
    readonly instructions: Instr[]
    readonly expectedGas: number
}

const TESTS: TestCase[] = [
    {
        name: "THROW_IF false",
        instructions: [PUSHINT(0), THROWIF(11)],
        expectedGas: 52,
    },
    {
        name: "THROW_IF true",
        instructions: [PUSHINT(1), THROWIF(11)],
        expectedGas: 97,
    },
    {
        name: "CHKDEPTH false",
        instructions: [PUSHINT(0), PUSHINT(1), CHKDEPTH()],
        expectedGas: 18 * 2 + 18,
    },
    {
        name: "CHKDEPTH true",
        instructions: [PUSHINT(0), PUSHINT(2), CHKDEPTH()],
        expectedGas: 18 * 2 + 63,
    },
    {
        name: "CALLDICT",
        instructions: [CALLDICT(1)],
        expectedGas: 21,
    },
    {
        name: "CALLDICT_LONG",
        instructions: [PUSHINT(1), PUSHINT(1), PUSHINT(1), CALLDICT_LONG(1)],
        expectedGas: 18 * 3 + 29,
    },
]

describe("tests", () => {
    // TODO: rewrite with just `it()`
    for (const {name, instructions, expectedGas} of TESTS) {
        it(`Test ${name}`, async () => {
            const gasUsed = await measureGas(instructions)
            expect(gasUsed).toEqual(expectedGas)
        })
    }
})
