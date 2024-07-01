import { Address, Cell, toNano } from "@ton/core";
import { enabledMasterchain } from "./config/features";
import { CompilerContext } from "./context";
import {
    ASTBinaryOperation,
    ASTExpression,
    AstId,
    ASTNewParameter,
    SrcInfo,
    ASTUnaryOperation,
    isSelfId,
    eqNames,
    idText,
} from "./grammar/ast";
import { idTextErr, throwConstEvalError } from "./errors";
import { CommentValue, StructValue, Value } from "./types/types";
import { sha256_sync } from "@ton/crypto";
import {
    getStaticConstant,
    getType,
    hasStaticConstant,
} from "./types/resolveDescriptors";
import { getExpType } from "./types/resolveExpression";

// TVM integers are signed 257-bit integers
const minTvmInt: bigint = -(2n ** 256n);
const maxTvmInt: bigint = 2n ** 256n - 1n;

// Throws a non-fatal const-eval error, in the sense that const-eval as a compiler
// optimization cannot be applied, e.g. to `let`-statements.
// Note that for const initializers this is a show-stopper.
function throwNonFatalErrorConstEval(msg: string, source: SrcInfo): never {
    throwConstEvalError(
        `Cannot evaluate expression to a constant: ${msg}`,
        false,
        source,
    );
}

// Throws a fatal const-eval, meaning this is a meaningless program,
// so compilation should be aborted in all cases
function throwErrorConstEval(msg: string, source: SrcInfo): never {
    throwConstEvalError(
        `Cannot evaluate expression to a constant: ${msg}`,
        true,
        source,
    );
}

function ensureInt(val: Value, source: SrcInfo): bigint {
    if (typeof val !== "bigint") {
        throwErrorConstEval(`integer expected, but got '${val}'`, source);
    }
    if (minTvmInt <= val && val <= maxTvmInt) {
        return val;
    } else {
        throwErrorConstEval(
            `integer '${val}' does not fit into TVM Int type`,
            source,
        );
    }
}

function ensureBoolean(val: Value, source: SrcInfo): boolean {
    if (typeof val !== "boolean") {
        throwErrorConstEval(`boolean expected, but got '${val}'`, source);
    }
    return val;
}

function ensureString(val: Value, source: SrcInfo): string {
    if (typeof val !== "string") {
        throwErrorConstEval(`string expected, but got '${val}'`, source);
    }
    return val;
}

function ensureFunArity(arity: number, args: ASTExpression[], source: SrcInfo) {
    if (args.length !== arity) {
        throwErrorConstEval(
            `function expects ${arity} argument(s), but got ${args.length}`,
            source,
        );
    }
}

function ensureMethodArity(
    arity: number,
    args: ASTExpression[],
    source: SrcInfo,
) {
    if (args.length !== arity) {
        throwErrorConstEval(
            `method expects ${arity} argument(s), but got ${args.length}`,
            source,
        );
    }
}

function evalUnaryOp(
    op: ASTUnaryOperation,
    operand: ASTExpression,
    source: SrcInfo,
    ctx: CompilerContext,
): Value {
    // Tact grammar does not have negative integer literals,
    // so in order to avoid errors for `-115792089237316195423570985008687907853269984665640564039457584007913129639936`
    // which is `-(2**256)` we need to have a special case for it
    if (operand.kind === "number" && op === "-") {
        // emulating negative integer literals
        return ensureInt(-operand.value, source);
    }
    const valOperand = evalConstantExpression(operand, ctx);
    switch (op) {
        case "+":
            return ensureInt(valOperand, operand.loc);
        case "-":
            return ensureInt(-ensureInt(valOperand, operand.loc), source);
        case "~":
            return ~ensureInt(valOperand, operand.loc);
        case "!":
            return !ensureBoolean(valOperand, operand.loc);
        case "!!":
            if (valOperand === null) {
                throwErrorConstEval(
                    "non-null value expected but got null",
                    operand.loc,
                );
            }
            return valOperand;
    }
}

// precondition: the divisor is not zero
// rounds the division result towards negative infinity
function divFloor(a: bigint, b: bigint): bigint {
    const almostSameSign = a > 0n === b > 0n;
    if (almostSameSign) {
        return a / b;
    }
    return a / b + (a % b === 0n ? 0n : -1n);
}

// precondition: the divisor is not zero
// rounds the result towards negative infinity
// Uses the fact that a / b * b + a % b == a, for all b != 0.
function modFloor(a: bigint, b: bigint): bigint {
    return a - divFloor(a, b) * b;
}

function evalBinaryOp(
    op: ASTBinaryOperation,
    left: ASTExpression,
    right: ASTExpression,
    source: SrcInfo,
    ctx: CompilerContext,
): Value {
    const valLeft = evalConstantExpression(left, ctx);
    const valRight = evalConstantExpression(right, ctx);
    switch (op) {
        case "+":
            return ensureInt(
                ensureInt(valLeft, left.loc) + ensureInt(valRight, right.loc),
                source,
            );
        case "-":
            return ensureInt(
                ensureInt(valLeft, left.loc) - ensureInt(valRight, right.loc),
                source,
            );
        case "*":
            return ensureInt(
                ensureInt(valLeft, left.loc) * ensureInt(valRight, right.loc),
                source,
            );
        case "/": {
            // The semantics of integer division for TVM (and by extension in Tact)
            // is a non-conventional one: by default it rounds towards negative infinity,
            // meaning, for instance, -1 / 5 = -1 and not zero, as in many mainstream languages.
            // Still, the following holds: a / b * b + a % b == a, for all b != 0.
            const r = ensureInt(valRight, right.loc);
            if (r === 0n)
                throwErrorConstEval(
                    "divisor expression must be non-zero",
                    right.loc,
                );
            return ensureInt(divFloor(ensureInt(valLeft, left.loc), r), source);
        }
        case "%": {
            // Same as for division, see the comment above
            // Example: -1 % 5 = 4
            const r = ensureInt(valRight, right.loc);
            if (r === 0n)
                throwErrorConstEval(
                    "divisor expression must be non-zero",
                    right.loc,
                );
            return ensureInt(modFloor(ensureInt(valLeft, left.loc), r), source);
        }
        case "&":
            return (
                ensureInt(valLeft, left.loc) & ensureInt(valRight, right.loc)
            );
        case "|":
            return (
                ensureInt(valLeft, left.loc) | ensureInt(valRight, right.loc)
            );
        case "^":
            return (
                ensureInt(valLeft, left.loc) ^ ensureInt(valRight, right.loc)
            );
        case "<<": {
            const valNum = ensureInt(valLeft, left.loc);
            const valBits = ensureInt(valRight, right.loc);
            if (0n > valBits || valBits > 256n) {
                throwErrorConstEval(
                    `the number of bits shifted ('${valBits}') must be within [0..256] range`,
                    right.loc,
                );
            }
            try {
                return ensureInt(valNum << valBits, source);
            } catch (e) {
                if (e instanceof RangeError)
                    // this actually should not happen
                    throwErrorConstEval(
                        `integer does not fit into TVM Int type`,
                        source,
                    );
                throw e;
            }
        }
        case ">>": {
            const valNum = ensureInt(valLeft, left.loc);
            const valBits = ensureInt(valRight, right.loc);
            if (0n > valBits || valBits > 256n) {
                throwErrorConstEval(
                    `the number of bits shifted ('${valBits}') must be within [0..256] range`,
                    right.loc,
                );
            }
            try {
                return ensureInt(valNum >> valBits, source);
            } catch (e) {
                if (e instanceof RangeError)
                    // this is actually should not happen
                    throwErrorConstEval(
                        `integer does not fit into TVM Int type`,
                        source,
                    );
                throw e;
            }
        }
        case ">":
            return (
                ensureInt(valLeft, left.loc) > ensureInt(valRight, right.loc)
            );
        case "<":
            return (
                ensureInt(valLeft, left.loc) < ensureInt(valRight, right.loc)
            );
        case ">=":
            return (
                ensureInt(valLeft, left.loc) >= ensureInt(valRight, right.loc)
            );
        case "<=":
            return (
                ensureInt(valLeft, left.loc) <= ensureInt(valRight, right.loc)
            );
        case "==":
            // the null comparisons account for optional types, e.g.
            // a const x: Int? = 42 can be compared to null
            if (
                typeof valLeft !== typeof valRight &&
                valLeft !== null &&
                valRight !== null
            ) {
                throwErrorConstEval(
                    "operands of `==` must have same type",
                    source,
                );
            }
            return valLeft === valRight;
        case "!=":
            if (typeof valLeft !== typeof valRight) {
                throwErrorConstEval(
                    "operands of `!=` must have same type",
                    source,
                );
            }
            return valLeft !== valRight;
        case "&&":
            return (
                ensureBoolean(valLeft, left.loc) &&
                ensureBoolean(valRight, right.loc)
            );
        case "||":
            return (
                ensureBoolean(valLeft, left.loc) ||
                ensureBoolean(valRight, right.loc)
            );
    }
}

function evalConditional(
    condition: ASTExpression,
    thenBranch: ASTExpression,
    elseBranch: ASTExpression,
    ctx: CompilerContext,
): Value {
    // here we rely on the typechecker that both branches have the same type
    const valCond = ensureBoolean(
        evalConstantExpression(condition, ctx),
        condition.loc,
    );
    if (valCond) {
        return evalConstantExpression(thenBranch, ctx);
    } else {
        return evalConstantExpression(elseBranch, ctx);
    }
}

function evalStructInstance(
    structTypeId: AstId,
    structFields: ASTNewParameter[],
    ctx: CompilerContext,
): StructValue {
    return structFields.reduce(
        (resObj, fieldWithInit) => {
            resObj[fieldWithInit.name.text] = evalConstantExpression(
                fieldWithInit.exp,
                ctx,
            );
            return resObj;
        },
        { $tactStruct: structTypeId.text } as StructValue,
    );
}

function evalFieldAccess(
    structExpr: ASTExpression,
    fieldId: AstId,
    source: SrcInfo,
    ctx: CompilerContext,
): Value {
    // special case for contract/trait constant accesses via `self.constant`
    if (structExpr.kind === "id" && isSelfId(structExpr)) {
        const selfTypeRef = getExpType(ctx, structExpr);
        if (selfTypeRef.kind == "ref") {
            const contractTypeDescription = getType(ctx, selfTypeRef.name);
            const foundContractConst = contractTypeDescription.constants.find(
                (constId) => eqNames(fieldId, constId.name),
            );
            if (foundContractConst === undefined) {
                // not a constant, e.g. `self.storageVariable`
                throwNonFatalErrorConstEval(
                    `cannot a evaluate non-constant self field access`,
                    structExpr.loc,
                );
            }
            if (foundContractConst.value !== undefined) {
                return foundContractConst.value;
            } else {
                throwErrorConstEval(
                    `cannot evaluate declared contract/trait constant ${idTextErr(fieldId)} as it does not have a body`,
                    fieldId.loc,
                );
            }
        }
    }
    const valStruct = evalConstantExpression(structExpr, ctx);
    if (
        valStruct == null ||
        typeof valStruct !== "object" ||
        !("$tactStruct" in valStruct)
    ) {
        throwErrorConstEval(
            `constant struct expected, but got ${valStruct}`,
            structExpr.loc,
        );
    }
    if (fieldId.text in valStruct) {
        return valStruct[fieldId.text];
    } else {
        // this cannot happen in a well-typed program
        throwErrorConstEval(
            `struct field ${idTextErr(fieldId)} is missing`,
            structExpr.loc,
        );
    }
}

function evalMethod(
    methodName: AstId,
    object: ASTExpression,
    args: ASTExpression[],
    source: SrcInfo,
    ctx: CompilerContext,
): Value {
    switch (idText(methodName)) {
        case "asComment": {
            ensureMethodArity(0, args, source);
            const comment = ensureString(
                evalConstantExpression(object, ctx),
                object.loc,
            );
            return new CommentValue(comment);
        }
        default:
            throwNonFatalErrorConstEval(
                `calls of ${idTextErr(methodName)} are not supported at this moment`,
                source,
            );
    }
}

function evalBuiltins(
    builtinName: AstId,
    args: ASTExpression[],
    source: SrcInfo,
    ctx: CompilerContext,
): Value {
    switch (idText(builtinName)) {
        case "ton": {
            ensureFunArity(1, args, source);
            const tons = ensureString(
                evalConstantExpression(args[0], ctx),
                args[0].loc,
            );
            try {
                return ensureInt(BigInt(toNano(tons).toString(10)), source);
            } catch (e) {
                if (e instanceof Error && e.message === "Invalid number") {
                    throwErrorConstEval(
                        `invalid ${idTextErr(builtinName)} argument`,
                        source,
                    );
                }
                throw e;
            }
        }
        case "pow": {
            ensureFunArity(2, args, source);
            const valBase = ensureInt(
                evalConstantExpression(args[0], ctx),
                args[0].loc,
            );
            const valExp = ensureInt(
                evalConstantExpression(args[1], ctx),
                args[1].loc,
            );
            if (valExp < 0n) {
                throwErrorConstEval(
                    `${idTextErr(builtinName)} builtin called with negative exponent ${valExp}`,
                    source,
                );
            }
            try {
                return ensureInt(valBase ** valExp, source);
            } catch (e) {
                if (e instanceof RangeError) {
                    // even TS bigint type cannot hold it
                    throwErrorConstEval(
                        `integer does not fit into TVM Int type`,
                        source,
                    );
                }
                throw e;
            }
        }
        case "pow2": {
            ensureFunArity(1, args, source);
            const valExponent = ensureInt(
                evalConstantExpression(args[0], ctx),
                args[0].loc,
            );
            if (valExponent < 0n) {
                throwErrorConstEval(
                    `${idTextErr(builtinName)} builtin called with negative exponent ${valExponent}`,
                    source,
                );
            }
            try {
                return ensureInt(2n ** valExponent, source);
            } catch (e) {
                if (e instanceof RangeError) {
                    // even TS bigint type cannot hold it
                    throwErrorConstEval(
                        `integer does not fit into TVM Int type`,
                        source,
                    );
                }
                throw e;
            }
        }
        case "sha256": {
            ensureFunArity(1, args, source);
            const str = ensureString(
                evalConstantExpression(args[0], ctx),
                args[0].loc,
            );
            const dataSize = Buffer.from(str).length;
            if (dataSize > 128) {
                throwErrorConstEval(
                    `data is too large for sha256 hash, expected up to 128 bytes, got ${dataSize}`,
                    source,
                );
            }
            return BigInt("0x" + sha256_sync(str).toString("hex"));
        }
        case "emptyMap": {
            ensureFunArity(0, args, source);
            return null;
        }
        case "cell":
            {
                ensureFunArity(1, args, source);
                const str = ensureString(
                    evalConstantExpression(args[0], ctx),
                    args[0].loc,
                );
                try {
                    return Cell.fromBase64(str);
                } catch (_) {
                    throwErrorConstEval(
                        `invalid base64 encoding for a cell: ${str}`,
                        source,
                    );
                }
            }
            break;
        case "address":
            {
                ensureFunArity(1, args, source);
                const str = ensureString(
                    evalConstantExpression(args[0], ctx),
                    args[0].loc,
                );
                try {
                    const address = Address.parse(str);
                    if (address.workChain !== 0 && address.workChain !== -1) {
                        throwErrorConstEval(
                            `${str} is invalid address`,
                            source,
                        );
                    }
                    if (!enabledMasterchain(ctx) && address.workChain !== 0) {
                        throwErrorConstEval(
                            `address ${str} is from masterchain which is not enabled for this contract`,
                            source,
                        );
                    }
                    return address;
                } catch (_) {
                    throwErrorConstEval(
                        `invalid address encoding: ${str}`,
                        source,
                    );
                }
            }
            break;
        case "newAddress": {
            ensureFunArity(2, args, source);
            const wc = ensureInt(
                evalConstantExpression(args[0], ctx),
                args[0].loc,
            );
            const addr = Buffer.from(
                ensureInt(
                    evalConstantExpression(args[1], ctx),
                    args[1].loc,
                ).toString(16),
                "hex",
            );
            if (wc !== 0n && wc !== -1n) {
                throwErrorConstEval(
                    `expected workchain of an address to be equal 0 or -1, received: ${wc}`,
                    source,
                );
            }
            if (!enabledMasterchain(ctx) && wc !== 0n) {
                throwErrorConstEval(
                    `${wc}:${addr} address is from masterchain which is not enabled for this contract`,
                    source,
                );
            }
            return new Address(Number(wc), addr);
        }
        default:
            throwNonFatalErrorConstEval(
                `unsupported builtin ${idTextErr(builtinName)}`,
                source,
            );
    }
}

function interpretEscapeSequences(stringLiteral: string) {
    return stringLiteral.replace(
        /\\\\|\\"|\\n|\\r|\\t|\\v|\\b|\\f|\\u{([0-9A-Fa-f]+)}|\\u([0-9A-Fa-f]{4})|\\x([0-9A-Fa-f]{2})/g,
        (match, unicodeCodePoint, unicodeEscape, hexEscape) => {
            switch (match) {
                case "\\\\":
                    return "\\";
                case '\\"':
                    return '"';
                case "\\n":
                    return "\n";
                case "\\r":
                    return "\r";
                case "\\t":
                    return "\t";
                case "\\v":
                    return "\v";
                case "\\b":
                    return "\b";
                case "\\f":
                    return "\f";
                default:
                    // Handle Unicode code point escape
                    if (unicodeCodePoint) {
                        const codePoint = parseInt(unicodeCodePoint, 16);
                        return String.fromCodePoint(codePoint);
                    }
                    // Handle Unicode escape
                    if (unicodeEscape) {
                        const codeUnit = parseInt(unicodeEscape, 16);
                        return String.fromCharCode(codeUnit);
                    }
                    // Handle hex escape
                    if (hexEscape) {
                        const hexValue = parseInt(hexEscape, 16);
                        return String.fromCharCode(hexValue);
                    }
                    return match;
            }
        },
    );
}

export function evalConstantExpression(
    ast: ASTExpression,
    ctx: CompilerContext,
): Value {
    switch (ast.kind) {
        case "id":
            if (hasStaticConstant(ctx, ast.text)) {
                const constant = getStaticConstant(ctx, ast.text);
                if (constant.value !== undefined) {
                    return constant.value;
                } else {
                    throwErrorConstEval(
                        `cannot evaluate declared constant ${idTextErr(ast)} as it does not have a body`,
                        ast.loc,
                    );
                }
            }
            throwNonFatalErrorConstEval("cannot evaluate a variable", ast.loc);
            break;
        case "op_call":
            return evalMethod(ast.name, ast.src, ast.args, ast.loc, ctx);
        case "init_of":
            throwNonFatalErrorConstEval(
                "initOf is not supported at this moment",
                ast.loc,
            );
            break;
        case "null":
            return null;
        case "boolean":
            return ast.value;
        case "number":
            return ensureInt(ast.value, ast.loc);
        case "string":
            return ensureString(interpretEscapeSequences(ast.value), ast.loc);
        case "op_unary":
            return evalUnaryOp(ast.op, ast.right, ast.loc, ctx);
        case "op_binary":
            return evalBinaryOp(ast.op, ast.left, ast.right, ast.loc, ctx);
        case "conditional":
            return evalConditional(
                ast.condition,
                ast.thenBranch,
                ast.elseBranch,
                ctx,
            );
        case "op_new":
            return evalStructInstance(ast.type, ast.args, ctx);
        case "op_field":
            return evalFieldAccess(ast.src, ast.name, ast.loc, ctx);
        case "op_static_call":
            return evalBuiltins(ast.name, ast.args, ast.loc, ctx);
    }
}
