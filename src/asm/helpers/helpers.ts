import * as i from "../runtime"
import * as j from "../runtime/util"

export const call = (what: i.Instr, ...args: i.Instr[]): i.Instr[] => {
    return [...args, what]
}

export type Func = () => i.Instr[]

export const execute = (f: Func, ...args: i.Instr[]): i.Instr[] => {
    return [...args, i.PUSHCONT(j.code(f())), i.EXECUTE()]
}

export const when = (cond: i.Instr[], then: i.Instr[]): i.Instr[] => {
    return [...cond, i.PUSHCONT(j.code(then)), i.IF()]
}

export const sliceConst = (instructions: i.Instr[]) => {
    return i.compileCell(instructions).asSlice()
}

export const runVM = (): i.Instr[] => [
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

export const measureGas2 = (instructions: i.Instr[]): i.Instr[] => {
    return execute(runVM, i.PUSHSLICE(sliceConst(instructions)), i.PUSHINT(1))
}
