import { Address, Cell, toNano } from "@ton/core";
import { enabledMasterchain } from "./config/features";
import { CompilerContext } from "./context";
import {
    AstBinaryOperation,
    AstExpression,
    AstId,
    AstStructFieldInitializer,
    SrcInfo,
    AstUnaryOperation,
    isSelfId,
    eqNames,
    idText,
    AstValue,
    isValue,
} from "./grammar/ast";
import { TactConstEvalError, idTextErr, throwConstEvalError } from "./errors";
import { CommentValue, showValue, StructValue, Value } from "./types/types";
import { sha256_sync } from "@ton/crypto";
import {
    extractValue,
    makeValueExpression,
    makeUnaryExpression,
    makeBinaryExpression,
    divFloor,
    modFloor,
} from "./optimizer/util";
import { ExpressionTransformer } from "./optimizer/types";
import { StandardOptimizer } from "./optimizer/standardOptimizer";
import {
    getStaticConstant,
    getType,
    hasStaticConstant,
} from "./types/resolveDescriptors";
import { getExpType } from "./types/resolveExpression";
import { dummySrcInfo } from "./grammar/grammar";

// TVM integers are signed 257-bit integers
const minTvmInt: bigint = -(2n ** 256n);
const maxTvmInt: bigint = 2n ** 256n - 1n;

// The optimizer that applies the rewriting rules during partial evaluation.
// For the moment we use an optimizer that respects overflows.
const optimizer: ExpressionTransformer = new StandardOptimizer();

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
        throwErrorConstEval(
            `integer expected, but got '${showValue(val)}'`,
            source,
        );
    }
    if (minTvmInt <= val && val <= maxTvmInt) {
        return val;
    } else {
        throwErrorConstEval(
            `integer '${showValue(val)}' does not fit into TVM Int type`,
            source,
        );
    }
}

function ensureBoolean(val: Value, source: SrcInfo): boolean {
    if (typeof val !== "boolean") {
        throwErrorConstEval(
            `boolean expected, but got '${showValue(val)}'`,
            source,
        );
    }
    return val;
}

function ensureString(val: Value, source: SrcInfo): string {
    if (typeof val !== "string") {
        throwErrorConstEval(
            `string expected, but got '${showValue(val)}'`,
            source,
        );
    }
    return val;
}

function ensureFunArity(arity: number, args: AstExpression[], source: SrcInfo) {
    if (args.length !== arity) {
        throwErrorConstEval(
            `function expects ${arity} argument(s), but got ${args.length}`,
            source,
        );
    }
}

function ensureMethodArity(
    arity: number,
    args: AstExpression[],
    source: SrcInfo,
) {
    if (args.length !== arity) {
        throwErrorConstEval(
            `method expects ${arity} argument(s), but got ${args.length}`,
            source,
        );
    }
}

export function evalUnaryOp(
    op: AstUnaryOperation,
    valOperand: Value,
    operandLoc: SrcInfo = dummySrcInfo,
    source: SrcInfo = dummySrcInfo,
): Value {
    switch (op) {
        case "+":
            return ensureInt(valOperand, operandLoc);
        case "-":
            return ensureInt(-ensureInt(valOperand, operandLoc), source);
        case "~":
            return ~ensureInt(valOperand, operandLoc);
        case "!":
            return !ensureBoolean(valOperand, operandLoc);
        case "!!":
            if (valOperand === null) {
                throwErrorConstEval(
                    "non-null value expected but got null",
                    operandLoc,
                );
            }
            return valOperand;
    }
}

function fullyEvalUnaryOp(
    op: AstUnaryOperation,
    operand: AstExpression,
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

    return evalUnaryOp(op, valOperand, operand.loc, source);
}

function partiallyEvalUnaryOp(
    op: AstUnaryOperation,
    operand: AstExpression,
    source: SrcInfo,
    ctx: CompilerContext,
): AstExpression {
    const simplOperand = partiallyEvalExpression(operand, ctx);

    if (isValue(simplOperand)) {
        const valueOperand = extractValue(simplOperand as AstValue);
        const result = evalUnaryOp(op, valueOperand, simplOperand.loc, source);
        // Wrap the value into a Tree to continue simplifications
        return makeValueExpression(result);
    } else {
        const newAst = makeUnaryExpression(op, simplOperand);
        return optimizer.applyRules(newAst);
    }
}

function fullyEvalBinaryOp(
    op: AstBinaryOperation,
    left: AstExpression,
    right: AstExpression,
    source: SrcInfo,
    ctx: CompilerContext,
): Value {
    const valLeft = evalConstantExpression(left, ctx);
    const valRight = evalConstantExpression(right, ctx);

    return evalBinaryOp(op, valLeft, valRight, left.loc, right.loc, source);
}

function partiallyEvalBinaryOp(
    op: AstBinaryOperation,
    left: AstExpression,
    right: AstExpression,
    source: SrcInfo,
    ctx: CompilerContext,
): AstExpression {
    const leftOperand = partiallyEvalExpression(left, ctx);
    const rightOperand = partiallyEvalExpression(right, ctx);

    if (isValue(leftOperand) && isValue(rightOperand)) {
        const valueLeftOperand = extractValue(leftOperand as AstValue);
        const valueRightOperand = extractValue(rightOperand as AstValue);
        const result = evalBinaryOp(
            op,
            valueLeftOperand,
            valueRightOperand,
            leftOperand.loc,
            rightOperand.loc,
            source,
        );
        // Wrap the value into a Tree to continue simplifications
        return makeValueExpression(result);
    } else {
        const newAst = makeBinaryExpression(op, leftOperand, rightOperand);
        return optimizer.applyRules(newAst);
    }
}

export function evalBinaryOp(
    op: AstBinaryOperation,
    valLeft: Value,
    valRight: Value,
    locLeft: SrcInfo = dummySrcInfo,
    locRight: SrcInfo = dummySrcInfo,
    source: SrcInfo = dummySrcInfo,
): Value {
    switch (op) {
        case "+":
            return ensureInt(
                ensureInt(valLeft, locLeft) + ensureInt(valRight, locRight),
                source,
            );
        case "-":
            return ensureInt(
                ensureInt(valLeft, locLeft) - ensureInt(valRight, locRight),
                source,
            );
        case "*":
            return ensureInt(
                ensureInt(valLeft, locLeft) * ensureInt(valRight, locRight),
                source,
            );
        case "/": {
            // The semantics of integer division for TVM (and by extension in Tact)
            // is a non-conventional one: by default it rounds towards negative infinity,
            // meaning, for instance, -1 / 5 = -1 and not zero, as in many mainstream languages.
            // Still, the following holds: a / b * b + a % b == a, for all b != 0.
            const r = ensureInt(valRight, locRight);
            if (r === 0n)
                throwErrorConstEval(
                    "divisor expression must be non-zero",
                    locRight,
                );
            return ensureInt(divFloor(ensureInt(valLeft, locLeft), r), source);
        }
        case "%": {
            // Same as for division, see the comment above
            // Example: -1 % 5 = 4
            const r = ensureInt(valRight, locRight);
            if (r === 0n)
                throwErrorConstEval(
                    "divisor expression must be non-zero",
                    locRight,
                );
            return ensureInt(modFloor(ensureInt(valLeft, locLeft), r), source);
        }
        case "&":
            return ensureInt(valLeft, locLeft) & ensureInt(valRight, locRight);
        case "|":
            return ensureInt(valLeft, locLeft) | ensureInt(valRight, locRight);
        case "^":
            return ensureInt(valLeft, locLeft) ^ ensureInt(valRight, locRight);
        case "<<": {
            const valNum = ensureInt(valLeft, locLeft);
            const valBits = ensureInt(valRight, locRight);
            if (0n > valBits || valBits > 256n) {
                throwErrorConstEval(
                    `the number of bits shifted ('${valBits}') must be within [0..256] range`,
                    locRight,
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
            const valNum = ensureInt(valLeft, locLeft);
            const valBits = ensureInt(valRight, locRight);
            if (0n > valBits || valBits > 256n) {
                throwErrorConstEval(
                    `the number of bits shifted ('${valBits}') must be within [0..256] range`,
                    locRight,
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
            return ensureInt(valLeft, locLeft) > ensureInt(valRight, locRight);
        case "<":
            return ensureInt(valLeft, locLeft) < ensureInt(valRight, locRight);
        case ">=":
            return ensureInt(valLeft, locLeft) >= ensureInt(valRight, locRight);
        case "<=":
            return ensureInt(valLeft, locLeft) <= ensureInt(valRight, locRight);
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
                ensureBoolean(valLeft, locLeft) &&
                ensureBoolean(valRight, locRight)
            );
        case "||":
            return (
                ensureBoolean(valLeft, locLeft) ||
                ensureBoolean(valRight, locRight)
            );
    }
}

// In the process of writing a partiallyEval version of this
// function for the partial evaluator
function fullyEvalConditional(
    condition: AstExpression,
    thenBranch: AstExpression,
    elseBranch: AstExpression,
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

// In the process of writing a partiallyEval version of this
// function for the partial evaluator
function fullyEvalStructInstance(
    structTypeId: AstId,
    structFields: AstStructFieldInitializer[],
    ctx: CompilerContext,
): StructValue {
    const structTy = getType(ctx, structTypeId);

    // initialize the resulting struct value with
    // the default values for fields with initializers
    // or null for uninitialized optional fields
    const resultWithDefaultFields: StructValue = structTy.fields.reduce(
        (resObj, field) => {
            if (field.default !== undefined) {
                resObj[field.name] = field.default;
            } else {
                if (field.type.kind === "ref" && field.type.optional) {
                    resObj[field.name] = null;
                }
            }
            return resObj;
        },
        { $tactStruct: idText(structTypeId) } as StructValue,
    );

    // this will override default fields set above
    return structFields.reduce((resObj, fieldWithInit) => {
        resObj[idText(fieldWithInit.field)] = evalConstantExpression(
            fieldWithInit.initializer,
            ctx,
        );
        return resObj;
    }, resultWithDefaultFields);
}

// In the process of writing a partiallyEval version of this
// function for the partial evaluator
function fullyEvalFieldAccess(
    structExpr: AstExpression,
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
            `constant struct expected, but got ${showValue(valStruct)}`,
            structExpr.loc,
        );
    }
    if (idText(fieldId) in valStruct) {
        return valStruct[idText(fieldId)]!;
    } else {
        // this cannot happen in a well-typed program
        throwErrorConstEval(
            `struct field ${idTextErr(fieldId)} is missing`,
            structExpr.loc,
        );
    }
}

// In the process of writing a partiallyEval version of this
// function for the partial evaluator
function fullyEvalMethod(
    methodName: AstId,
    object: AstExpression,
    args: AstExpression[],
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

// In the process of writing a partiallyEval version of this
// function for the partial evaluator
function fullyEvalBuiltins(
    builtinName: AstId,
    args: AstExpression[],
    source: SrcInfo,
    ctx: CompilerContext,
): Value {
    switch (idText(builtinName)) {
        case "ton": {
            ensureFunArity(1, args, source);
            const tons = ensureString(
                evalConstantExpression(args[0]!, ctx),
                args[0]!.loc,
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
                evalConstantExpression(args[0]!, ctx),
                args[0]!.loc,
            );
            const valExp = ensureInt(
                evalConstantExpression(args[1]!, ctx),
                args[1]!.loc,
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
                evalConstantExpression(args[0]!, ctx),
                args[0]!.loc,
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
                evalConstantExpression(args[0]!, ctx),
                args[0]!.loc,
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
                    evalConstantExpression(args[0]!, ctx),
                    args[0]!.loc,
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
                    evalConstantExpression(args[0]!, ctx),
                    args[0]!.loc,
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
                evalConstantExpression(args[0]!, ctx),
                args[0]!.loc,
            );
            const addr = Buffer.from(
                ensureInt(evalConstantExpression(args[1]!, ctx), args[1]!.loc)
                    .toString(16)
                    .padStart(64, "0"),
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
                    `${wc}:${addr.toString("hex")} address is from masterchain which is not enabled for this contract`,
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

function interpretEscapeSequences(stringLiteral: string, source: SrcInfo) {
    return stringLiteral.replace(
        /\\\\|\\"|\\n|\\r|\\t|\\v|\\b|\\f|\\u{([0-9A-Fa-f]{1,6})}|\\u([0-9A-Fa-f]{4})|\\x([0-9A-Fa-f]{2})/g,
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
                        if (codePoint > 0x10ffff) {
                            throwErrorConstEval(
                                `unicode code point is outside of valid range 000000-10FFFF: ${stringLiteral}`,
                                source,
                            );
                        }
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

function lookupName(ast: AstId, ctx: CompilerContext): Value {
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
}

export function evalConstantExpression(
    ast: AstExpression,
    ctx: CompilerContext,
): Value {
    switch (ast.kind) {
        case "id":
            return lookupName(ast, ctx);
        case "method_call":
            return fullyEvalMethod(
                ast.method,
                ast.self,
                ast.args,
                ast.loc,
                ctx,
            );
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
            return ensureString(
                interpretEscapeSequences(ast.value, ast.loc),
                ast.loc,
            );
        case "op_unary":
            return fullyEvalUnaryOp(ast.op, ast.operand, ast.loc, ctx);
        case "op_binary":
            return fullyEvalBinaryOp(ast.op, ast.left, ast.right, ast.loc, ctx);
        case "conditional":
            return fullyEvalConditional(
                ast.condition,
                ast.thenBranch,
                ast.elseBranch,
                ctx,
            );
        case "struct_instance":
            return fullyEvalStructInstance(ast.type, ast.args, ctx);
        case "field_access":
            return fullyEvalFieldAccess(ast.aggregate, ast.field, ast.loc, ctx);
        case "static_call":
            return fullyEvalBuiltins(ast.function, ast.args, ast.loc, ctx);
    }
}

export function partiallyEvalExpression(
    ast: AstExpression,
    ctx: CompilerContext,
): AstExpression {
    switch (ast.kind) {
        case "id":
            try {
                return makeValueExpression(lookupName(ast, ctx));
            } catch (e) {
                if (e instanceof TactConstEvalError) {
                    if (!e.fatal) {
                        // If a non-fatal error occurs during lookup, just return the symbol
                        return ast;
                    }
                }
                throw e;
            }
        case "method_call":
            // Does not partially evaluate at the moment. Will attempt to fully evaluate
            return makeValueExpression(
                fullyEvalMethod(ast.method, ast.self, ast.args, ast.loc, ctx),
            );
        case "init_of":
            throwNonFatalErrorConstEval(
                "initOf is not supported at this moment",
                ast.loc,
            );
            break;
        case "null":
            return ast;
        case "boolean":
            return ast;
        case "number":
            return makeValueExpression(ensureInt(ast.value, ast.loc));
        case "string":
            return makeValueExpression(
                ensureString(
                    interpretEscapeSequences(ast.value, ast.loc),
                    ast.loc,
                ),
            );
        case "op_unary":
            return partiallyEvalUnaryOp(ast.op, ast.operand, ast.loc, ctx);
        case "op_binary":
            return partiallyEvalBinaryOp(
                ast.op,
                ast.left,
                ast.right,
                ast.loc,
                ctx,
            );
        case "conditional":
            // Does not partially evaluate at the moment. Will attempt to fully evaluate
            return makeValueExpression(
                fullyEvalConditional(
                    ast.condition,
                    ast.thenBranch,
                    ast.elseBranch,
                    ctx,
                ),
            );
        case "struct_instance":
            // Does not partially evaluate at the moment. Will attempt to fully evaluate
            return makeValueExpression(
                fullyEvalStructInstance(ast.type, ast.args, ctx),
            );
        case "field_access":
            // Does not partially evaluate at the moment. Will attempt to fully evaluate
            return makeValueExpression(
                fullyEvalFieldAccess(ast.aggregate, ast.field, ast.loc, ctx),
            );
        case "static_call":
            // Does not partially evaluate at the moment. Will attempt to fully evaluate
            return makeValueExpression(
                fullyEvalBuiltins(ast.function, ast.args, ast.loc, ctx),
            );
    }
}
