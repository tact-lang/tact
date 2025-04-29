import {Instr} from "../runtime"
import * as i from "../runtime"
import * as j from "../runtime/util"

export const call = (what: Instr, ...args: Instr[]): Instr[] => {
    return [...args, what]
}

export type Func = () => Instr[]

export const execute = (f: Func, ...args: Instr[]): Instr[] => {
    return [...args, i.PUSHCONT(j.code(f())), i.EXECUTE()]
}

export const when = (cond: Instr[], then: Instr[]): Instr[] => {
    return [...cond, i.PUSHCONT(j.code(then)), i.IF()]
}

export const sliceConst = (instructions: Instr[]) => {
    return i.compileCell(instructions).asSlice()
}

export const runVM = (): Instr[] => [
    i.DUP(),
    i.PUSHCTR(7),
    i.SWAP(),
    i.TPUSH(),
    i.POPCTR(7),

    i.PUSHINT(0),
    i.ROTREV(),
    i.PUSHINT_LONG(1000000n),

    i.RUNVM(392),
    i.PUSHINT(5),
    i.SUB(),
    // i.DUMPSTK(),

    i.PUSHCTR(7),
    i.SWAP(),
    i.TPUSH(),
    i.SWAP(),
    i.TPUSH(),
    i.PUSHCTR(7),
    i.LAST(),
    i.SWAP(),
    i.POPCTR(7),
    i.DROPX(),
    i.PUSHCTR(7),
    i.TPOP(),
    i.SWAP(),
    i.TPOP(),
    i.SWAP(),
    i.POPCTR(7),
]

export const measureGas2 = (instructions: Instr[]): Instr[] => {
    return execute(runVM, i.PUSHSLICE(sliceConst(instructions)), i.PUSHINT(1))
}
