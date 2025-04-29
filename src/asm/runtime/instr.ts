import * as $ from "./util"
import * as G from "@ton/core"
import * as c from "./constructors"
import {PSEUDO_EXOTIC} from "./constructors"
import assert from "node:assert"
import {Instr, rangeToType, storeMapping} from "./instr-gen"
import {CodeBuilder, Mapping} from "./builder"

export const instr: $.Type<Instr> = {
    store: (b, t) => {
        if (t.$ === "PSEUDO_PUSHREF") {
            return $.PSEUDO_PUSHREF.store(b, t)
        }
        if (t.$ === "PSEUDO_PUSHSLICE") {
            return $.PSEUDO_PUSHSLICE.store(b, t)
        }
        if (t.$ === "PSEUDO_EXOTIC") {
            return $.PSEUDO_EXOTIC.store(b, t)
        }

        const store = storeMapping.get(t.$)
        if (!store) {
            throw new Error("unknown instruction")
        }
        return store(b, t)
    },
    load: getLoadInstr<Instr>(rangeToType),
}

export type codeType = Instr[]

export const codeType = (): $.Type<codeType> => {
    const processCell = (cell: G.Cell): Instr[] => {
        if (cell.isExotic) {
            return [parseExotic(cell)]
        }

        return codeType().load(cell.asSlice())
    }
    return {
        load: slice => {
            const arr: Instr[] = []

            const sliceBackup = slice.clone()

            while (slice.remainingBits > 0) {
                try {
                    arr.push(instr.load(slice))
                } catch {
                    return [c.PSEUDO_PUSHSLICE(sliceBackup)]
                }
            }

            while (slice.remainingRefs > 0) {
                const source = slice.loadRef()
                const instructions = processCell(source)
                arr.push(c.PSEUDO_PUSHREF($.decompiledCode(instructions)))
            }

            return arr
        },
        store(b, t) {
            for (const it of t) {
                instr.store(b, it)
            }
        },
    }
}

type Range<T> = {
    min: number
    max: number
    load: $.Load<T>
}

function DummyOpcode(min: number, max: number): Range<never> {
    return {
        min,
        max,
        load: s => {
            throw new Error(`invalid opcode, slice: ${s.asCell().toString()}`)
        },
    }
}

function getLoadInstr<T>(instructionList: Range<T>[]) {
    const list: Range<T>[] = []

    const MAX_OPCODE_BITS = 24

    const top_opcode = 1 << MAX_OPCODE_BITS
    const sorted = instructionList.sort((a, b) => a.min - b.min)

    let upto = 0
    for (const instruction of sorted) {
        const {min, max} = instruction

        if (min === max && min === 0) continue // skip pseudo instructions

        assert(min < max)
        assert(min >= upto)
        assert(max <= top_opcode)
        if (upto < min) {
            list.push(DummyOpcode(upto, min))
        }
        list.push(instruction)
        upto = max
    }

    if (upto < top_opcode) {
        list.push(DummyOpcode(upto, top_opcode))
    }

    return (s: G.Slice) => {
        const bits = Math.min(s.remainingBits, 24)
        const opcode = s.preloadUint(bits) << (24 - bits)

        let i = 0
        let j = list.length
        while (j - i > 1) {
            const k = (j + i) >> 1
            if (list[k].min <= opcode) {
                i = k
            } else {
                j = k
            }
        }

        const instr = list[i]

        if (bits < 8) {
            throw new Error(
                `invalid opcode, not enough bits, expected at least 8 bits, but got ${bits}`,
            )
        }

        return instr.load(s)
    }
}

export const parseExotic = (cell: G.Cell): Instr => {
    const slice = cell.beginParse(true)
    return PSEUDO_EXOTIC($.exotic.load(slice))
}

export const compile = (instructions: Instr[]): Buffer => {
    return compileCell(instructions).toBoc()
}

export const compileCell = (instructions: Instr[]): G.Cell => {
    const b = new CodeBuilder()
    codeType().store(b, instructions)
    return b.asCell()
}

export const compileCellWithMapping = (instructions: Instr[]): [G.Cell, Mapping] => {
    const b = new CodeBuilder()
    codeType().store(b, instructions)
    return b.build()
}

export const decompile = (buffer: Buffer): Instr[] => {
    return decompileCell(G.Cell.fromBoc(buffer)[0])
}

export const decompileCell = (cell: G.Cell): Instr[] => {
    if (cell.isExotic) {
        return [parseExotic(cell)]
    }
    return codeType().load(cell.asSlice())
}
