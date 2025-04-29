import * as $ from "@tonstudio/parser-runtime"
import {
    boc,
    Code,
    decompiledCode,
    DecompiledMethod,
    DefaultExoticCell,
    Dict,
    hex,
    bin,
    LibraryCell,
    Loc,
} from "../runtime/util"
import {$ast} from "./grammar"
import * as c from "../runtime"
import {convertInstruction} from "./convert"
import {beginCell} from "@ton/core"

export type Ctx = {
    readonly lines: readonly string[]
    readonly filepath: string
}

export type Convert = (ctx: Ctx, instr: $ast.Instruction, loc: Loc) => c.Instr

export class ParseError extends Error {
    public loc: Loc
    public msg: string

    public constructor(loc: Loc, msg: string) {
        super(msg)
        this.name = "ParseError"
        this.loc = loc
        this.msg = msg
    }

    public override toString() {
        return `${this.name}: ${this.msg} at ${this.loc.file}:${this.loc.line}`
    }
}

const offsetToLine = (lines: readonly string[], searchOffset: number): number => {
    let offset = 0
    let index = 0
    for (const line of lines) {
        offset += line.length + 1
        if (searchOffset < offset) {
            return index
        }
        index++
    }

    return lines.length - 1
}

export const createLoc = (ctx: Ctx, loc: $.Loc): Loc => {
    if (loc.$ === "empty") {
        return {
            file: ctx.filepath,
            line: offsetToLine(ctx.lines, loc.at),
        }
    }

    return {
        file: ctx.filepath,
        line: offsetToLine(ctx.lines, loc.start),
    }
}

export const processInstructions = (ctx: Ctx, instructions: $ast.instructions): c.Instr[] => {
    return instructions.map(it => {
        const loc = createLoc(ctx, it.loc)
        try {
            if (it.$ === "ExplicitRef") {
                return c.PSEUDO_PUSHREF(
                    c.util.code(processInstructions(ctx, it.code.instructions)),
                    loc,
                )
            }

            if (it.$ === "EmbedSlice") {
                return c.PSEUDO_PUSHSLICE(parseDataLiteral(it.data), loc)
            }

            if (it.$ === "Exotic") {
                if (it.lib.$ === "DefaultExotic") {
                    return c.PSEUDO_EXOTIC(
                        DefaultExoticCell(parseDataLiteral(it.lib.data).asCell()),
                    )
                }

                return c.PSEUDO_EXOTIC(LibraryCell(parseDataLiteral(it.lib.data)), loc)
            }

            return convertInstruction(ctx, it, loc)
        } catch (error) {
            if (typeof error === "string") {
                throw new ParseError(loc, error)
            }

            throw error
        }
    })
}

export const singleIntegerArg = (instr: $ast.Instruction) => {
    const arg = instr.args[0].expression
    if (arg.$ !== "IntegerLiteral") {
        throw new Error(`Expected integer literal argument, got ${arg.$}`)
    }

    return parseNumber(arg)
}

export const singleStackArg = (instr: $ast.Instruction) => {
    const arg = instr.args[0].expression
    if (arg.$ !== "StackElement") {
        throw new Error(`Expected stack element argument, got ${arg.$}`)
    }

    return parseStackElement(arg)
}

export const singleControlArg = (instr: $ast.Instruction) => {
    const arg = instr.args[0].expression
    if (arg.$ !== "ControlRegister") {
        throw new Error(`Expected control register argument, got ${arg.$}`)
    }

    const number = Number.parseInt(arg.value.slice(1))
    if (number === 6) {
        throw new Error(`c6 doesn't exist`)
    }

    return number
}

export const singleBigIntArg = (instr: $ast.Instruction) => {
    const arg = instr.args[0].expression
    if (arg.$ !== "IntegerLiteral") {
        throw new Error(`Expected integer literal argument, got ${arg.$}`)
    }

    const value = BigInt(arg.value.digits)
    if (arg.op === "-") {
        return -value
    }
    return value
}

export const twoIntegerArgs = (instr: $ast.Instruction): [number, number] => {
    const arg = instr.args[0].expression
    if (arg.$ !== "IntegerLiteral") {
        throw new Error(`Expected integer literal argument 1, got ${arg.$}`)
    }

    const arg2 = instr.args[1].expression
    if (arg2.$ !== "IntegerLiteral") {
        throw new Error(`Expected integer literal argument 2, got ${arg2.$}`)
    }

    return [parseNumber(arg), parseNumber(arg2)]
}

export const twoStackArgs = (instr: $ast.Instruction): [number, number] => {
    const arg = instr.args[0].expression
    if (arg.$ !== "StackElement") {
        throw new Error(`Expected stack element argument 1, got ${arg.$}`)
    }

    const arg2 = instr.args[1].expression
    if (arg2.$ !== "StackElement") {
        throw new Error(`Expected stack element argument 2, got ${arg2.$}`)
    }

    return [parseStackElement(arg), parseStackElement(arg2)]
}

export const threeIntegerArgs = (instr: $ast.Instruction): [number, number, number] => {
    const arg = instr.args[0].expression
    if (arg.$ !== "IntegerLiteral") {
        throw new Error(`Expected integer literal argument 1, got ${arg.$}`)
    }

    const arg2 = instr.args[1].expression
    if (arg2.$ !== "IntegerLiteral") {
        throw new Error(`Expected integer literal argument 2, got ${arg2.$}`)
    }

    const arg3 = instr.args[2].expression
    if (arg3.$ !== "IntegerLiteral") {
        throw new Error(`Expected integer literal argument 3, got ${arg3.$}`)
    }

    return [parseNumber(arg), parseNumber(arg2), parseNumber(arg3)]
}

export const threeStackArgs = (instr: $ast.Instruction): [number, number, number] => {
    const arg = instr.args[0].expression
    if (arg.$ !== "StackElement") {
        throw new Error(`Expected stack element argument 1, got ${arg.$}`)
    }

    const arg2 = instr.args[1].expression
    if (arg2.$ !== "StackElement") {
        throw new Error(`Expected stack element argument 2, got ${arg2.$}`)
    }

    const arg3 = instr.args[2].expression
    if (arg3.$ !== "StackElement") {
        throw new Error(`Expected stack element argument 3, got ${arg3.$}`)
    }

    return [parseStackElement(arg), parseStackElement(arg2), parseStackElement(arg3)]
}

export const codeSliceArg = (ctx: Ctx, instr: $ast.Instruction) => {
    const arg = instr.args[0].expression
    if (arg.$ !== "Code") {
        throw new Error(`Expected code argument, got ${arg.$}`)
    }

    return decompiledCode(processInstructions(ctx, arg.instructions))
}

export const twoCodeSliceArgs = (ctx: Ctx, instr: $ast.Instruction) => {
    const arg = instr.args[0].expression
    if (arg.$ !== "Code") {
        throw new Error(`Expected code argument 1, got ${arg.$}`)
    }

    const arg1 = instr.args[1].expression
    if (arg1.$ !== "Code") {
        throw new Error(`Expected code argument 2, got ${arg1.$}`)
    }

    return [
        decompiledCode(processInstructions(ctx, arg.instructions)),
        decompiledCode(processInstructions(ctx, arg1.instructions)),
    ]
}

export const ifElseBitArgs = (ctx: Ctx, instr: $ast.Instruction) => {
    const arg = instr.args[0].expression
    if (arg.$ !== "IntegerLiteral") {
        throw new Error(`Expected integer literal argument 1, got ${arg.$}`)
    }

    const arg1 = instr.args[1].expression
    if (arg1.$ !== "Code") {
        throw new Error(`Expected code argument 2, got ${arg1.$}`)
    }

    const arg2 = instr.args[2].expression
    if (arg2.$ !== "Code") {
        throw new Error(`Expected code argument 3, got ${arg2.$}`)
    }

    return [
        parseNumber(arg),
        decompiledCode(processInstructions(ctx, arg1.instructions)),
        decompiledCode(processInstructions(ctx, arg2.instructions)),
    ]
}

export const ifBitArgs = (ctx: Ctx, instr: $ast.Instruction): [number, Code] => {
    const arg = instr.args[0].expression
    if (arg.$ !== "IntegerLiteral") {
        throw new Error(`Expected integer literal argument 1, got ${arg.$}`)
    }

    const arg1 = instr.args[1].expression
    if (arg1.$ !== "Code") {
        throw new Error(`Expected code argument 2, got ${arg1.$}`)
    }

    return [parseNumber(arg), decompiledCode(processInstructions(ctx, arg1.instructions))]
}

export const sliceArg = (instr: $ast.Instruction) => {
    const arg = instr.args[0].expression
    if (arg.$ !== "DataLiteral") {
        throw new Error(`Expected hex, bin or boc literal argument 1, got ${arg.$}`)
    }

    return parseDataLiteral(arg)
}

export const debugstrArg = (instr: $ast.Instruction) => {
    const arg = instr.args[0].expression
    if (arg.$ !== "DataLiteral") {
        throw new Error(`Expected hex, bin or string literal argument 1, got ${arg.$}`)
    }

    return parseDataLiteral(arg)
}

export const dictpushArg = (ctx: Ctx, instr: $ast.Instruction): [number, Dict] => {
    const arg0 = instr.args[0].expression
    if (arg0.$ !== "IntegerLiteral") {
        throw new Error(`Expected integer argument 1, got ${arg0.$}`)
    }

    const keyLength = parseNumber(arg0)

    const arg1 = instr.args[1].expression

    if (arg1.$ === "DataLiteral") {
        const slice = parseDataLiteral(arg1)
        return [keyLength, c.util.rawDict(slice)]
    }

    if (arg1.$ !== "Dictionary") {
        throw new Error(`Expected dictionary argument 2, got ${arg1.$}`)
    }

    const methods = arg1.entries.map((entry): DecompiledMethod => {
        const id = entry.id
        const code = entry.code

        return {
            $: "DecompiledMethod",
            id: parseNumber(id),
            instructions: processInstructions(ctx, code.instructions),
        }
    })

    return [keyLength, c.util.decompiledDict(methods)]
}

const parseDataLiteral = (literal: $ast.DataLiteral) => {
    const arg = literal.value

    if (arg.$ === "StringLiteral") {
        return beginCell().storeBuffer(Buffer.from(arg.value)).asSlice()
    }

    if (arg.$ === "HexLiteral") {
        return hex(arg.content)
    }

    if (arg.$ === "BocLiteral") {
        return boc(arg.content)
    }

    return bin(arg.content)
}

const parseStackElement = (arg: $ast.StackElement) => Number.parseInt(arg.value.slice(1))

const parseNumber = (literal: $ast.IntegerLiteral) => {
    const val = Number.parseInt(literal.value.digits)
    if (literal.op === "-") {
        return -val
    }
    return val
}
