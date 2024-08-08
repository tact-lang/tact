import { Address, Cell, toNano } from "@ton/core";
import { evalConstantExpression } from "./constEval";
import { CompilerContext } from "./context";
import {
    TactConstEvalError,
    TactParseError,
    idTextErr,
    throwConstEvalError,
} from "./errors";
import {
    AstBinaryOperation,
    AstBoolean,
    AstCondition,
    AstConditional,
    AstConstantDef,
    AstContract,
    AstExpression,
    AstFieldAccess,
    AstFunctionDef,
    AstId,
    AstInitOf,
    AstMessageDecl,
    AstMethodCall,
    AstModuleItem,
    AstNativeFunctionDecl,
    AstNull,
    AstNumber,
    AstOpBinary,
    AstOpUnary,
    AstPrimitiveTypeDecl,
    AstStatement,
    AstStatementAssign,
    AstStatementAugmentedAssign,
    AstStatementExpression,
    AstStatementForEach,
    AstStatementLet,
    AstStatementRepeat,
    AstStatementReturn,
    AstStatementTry,
    AstStatementTryCatch,
    AstStatementUntil,
    AstStatementWhile,
    AstStaticCall,
    AstString,
    AstStructDecl,
    AstStructInstance,
    AstTrait,
    AstUnaryOperation,
    eqNames,
    idText,
    isSelfId,
} from "./grammar/ast";
import { SrcInfo, dummySrcInfo, parseExpression } from "./grammar/grammar";
import { divFloor, modFloor } from "./optimizer/util";
import {
    getStaticConstant,
    getStaticFunction,
    getType,
    hasStaticConstant,
    hasStaticFunction,
} from "./types/resolveDescriptors";
import { getExpType } from "./types/resolveExpression";
import {
    CommentValue,
    StructValue,
    TypeRef,
    Value,
    showValue,
} from "./types/types";
import { sha256_sync } from "@ton/crypto";
import { enabledMasterchain } from "./config/features";

// TVM integers are signed 257-bit integers
const minTvmInt: bigint = -(2n ** 256n);
const maxTvmInt: bigint = 2n ** 256n - 1n;

// Range allowed in repeat statements
const minRepeatStatement: bigint = -(2n ** 256n); // Note it is the same as minimum for TVM
const maxRepeatStatement: bigint = 2n ** 31n - 1n;

// Throws a non-fatal const-eval error, in the sense that const-eval as a compiler
// optimization cannot be applied, e.g. to `let`-statements.
// Note that for const initializers this is a show-stopper.
export function throwNonFatalErrorConstEval(
    msg: string,
    source: SrcInfo,
): never {
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
type EvalResult =
    | { kind: "ok"; value: Value }
    | { kind: "error"; message: string };

export function ensureInt(val: Value, source: SrcInfo): bigint {
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

function ensureRepeatInt(val: Value, source: SrcInfo): bigint {
    if (typeof val !== "bigint") {
        throwErrorConstEval(
            `integer expected, but got '${showValue(val)}'`,
            source,
        );
    }
    if (minRepeatStatement <= val && val <= maxRepeatStatement) {
        return val;
    } else {
        throwErrorConstEval(
            `repeat argument must be a number between -2^256 (inclusive) and 2^31 - 1 (inclusive)`,
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

class ReturnSignal extends Error {
    private value?: Value;

    constructor(value?: Value) {
        super();
        this.value = value;
    }

    public getValue(): Value | undefined {
        return this.value;
    }
}

type InterpreterConfig = {
    // Options that tune the interpreter's behavior.

    // Maximum number of iterations inside a loop before a time out is issued.
    // This option only applies to: do...until and while loops
    maxLoopIterations: bigint;
};

class RuntimeEnvironment {
    private values: Map<string, Value>;
    private enclosing?: RuntimeEnvironment;

    constructor(enclosing?: RuntimeEnvironment) {
        this.values = new Map();
        this.enclosing = enclosing;
    }

    private findBindingMap(name: string): Map<string, Value> | undefined {
        if (this.values.has(name)) {
            return this.values;
        } else if (this.enclosing !== undefined) {
            return this.enclosing.findBindingMap(name);
        } else {
            return undefined;
        }
    }

    public setNewBinding(name: string, val: Value) {
        this.values.set(name, val);
    }

    public updateBinding(name: string, val: Value) {
        const bindings = this.findBindingMap(name);
        if (bindings !== undefined) {
            bindings.set(name, val);
        }
    }

    public getBinding(name: string): Value | undefined {
        if (this.values.has(name)) {
            return this.values.get(name)!;
        } else {
            if (this.enclosing !== undefined) {
                return this.enclosing.getBinding(name);
            } else {
                return undefined;
            }
        }
    }

    public getParentEnvironment(): RuntimeEnvironment | undefined {
        return this.enclosing;
    }
}

export function parseAndEvalExpression(sourceCode: string): EvalResult {
    try {
        const ast = parseExpression(sourceCode);
        const constEvalResult = evalConstantExpression(
            ast,
            new CompilerContext(),
        );
        return { kind: "ok", value: constEvalResult };
    } catch (error) {
        if (
            error instanceof TactParseError ||
            error instanceof TactConstEvalError
        )
            return { kind: "error", message: error.message };
        throw error;
    }
}

const defaultInterpreterConfig: InterpreterConfig = {
    // We set the default max number of loop iterations
    // to the maximum number allowed for repeat loops
    maxLoopIterations: maxRepeatStatement,
};

export class Interpreter {
    private currentEnv: RuntimeEnvironment;
    private initialContext: CompilerContext;
    private config: InterpreterConfig;

    constructor(
        initialContext: CompilerContext = new CompilerContext(),
        config: InterpreterConfig = defaultInterpreterConfig,
    ) {
        this.currentEnv = new RuntimeEnvironment();
        this.initialContext = initialContext;
        this.config = config;
    }

    // Opens a new environment with the provided param names and
    // values.
    private openNewEnvironment(
        args: { paramNames: string[]; values: Value[] } = {
            paramNames: [],
            values: [],
        },
    ) {
        const paramNames = args.paramNames;
        const values = args.values;

        this.currentEnv = new RuntimeEnvironment(this.currentEnv);
        paramNames.forEach((param, index) => {
            this.currentEnv.setNewBinding(param, values[index]!);
        }, this);
    }

    // Closes the current environment and returns to its
    // parent environment
    private closeCurrentEnvironment() {
        const parentEnv = this.currentEnv.getParentEnvironment();
        if (parentEnv === undefined) {
            // This is a programmer's error, not even a compilation error.
            throw new Error(
                "Attempt to close an environment without a parent. Did you forget to previously call openNewEnvironment?",
            );
        }
        this.currentEnv = parentEnv;
    }

    public interpretModuleItem(ast: AstModuleItem): void {
        switch (ast.kind) {
            case "constant_def":
                this.interpretConstantDef(ast);
                break;
            case "function_def":
                this.interpretFunctionDef(ast);
                break;
            case "struct_decl":
                this.interpretStructDecl(ast);
                break;
            case "message_decl":
                this.interpretMessageDecl(ast);
                break;
            case "native_function_decl":
                this.interpretFunctionDecl(ast);
                break;
            case "primitive_type_decl":
                this.interpretPrimitiveTypeDecl(ast);
                break;
            case "contract":
                this.interpretContract(ast);
                break;
            case "trait":
                this.interpretTrait(ast);
                break;
        }
    }

    public interpretConstantDef(ast: AstConstantDef) {
        throwNonFatalErrorConstEval(
            "Constant definitions are currently not supported.",
            ast.loc,
        );
    }

    public interpretFunctionDef(ast: AstFunctionDef) {
        throwNonFatalErrorConstEval(
            "Function definitions are currently not supported.",
            ast.loc,
        );
    }

    public interpretStructDecl(ast: AstStructDecl) {
        throwNonFatalErrorConstEval(
            "Struct declarations are currently not supported.",
            ast.loc,
        );
    }

    public interpretMessageDecl(ast: AstMessageDecl) {
        throwNonFatalErrorConstEval(
            "Message declarations are currently not supported.",
            ast.loc,
        );
    }

    public interpretPrimitiveTypeDecl(ast: AstPrimitiveTypeDecl) {
        throwNonFatalErrorConstEval(
            "Primitive type declarations are currently not supported.",
            ast.loc,
        );
    }

    public interpretFunctionDecl(ast: AstNativeFunctionDecl) {
        throwNonFatalErrorConstEval(
            "Native function declarations are currently not supported.",
            ast.loc,
        );
    }

    public interpretContract(ast: AstContract) {
        throwNonFatalErrorConstEval(
            "Contract declarations are currently not supported.",
            ast.loc,
        );
    }

    public interpretTrait(ast: AstTrait) {
        throwNonFatalErrorConstEval(
            "Trait declarations are currently not supported.",
            ast.loc,
        );
    }

    public interpretExpression(ast: AstExpression): Value {
        switch (ast.kind) {
            case "id":
                return this.interpretName(ast);
            case "method_call":
                return this.interpretMethodCall(ast);
            case "init_of":
                return this.interpretInitOf(ast);
            case "null":
                return this.interpretNull(ast);
            case "boolean":
                return this.interpretBoolean(ast);
            case "number":
                return this.interpretNumber(ast);
            case "string":
                return this.interpretString(ast);
            case "op_unary":
                return this.interpretUnaryOp(ast);
            case "op_binary":
                return this.interpretBinaryOp(ast);
            case "conditional":
                return this.interpretConditional(ast);
            case "struct_instance":
                return this.interpretStructInstance(ast);
            case "field_access":
                return this.interpretFieldAccess(ast);
            case "static_call":
                return this.interpretStaticCall(ast);
        }
    }

    public interpretName(ast: AstId): Value {
        if (hasStaticConstant(this.initialContext, idText(ast))) {
            const constant = getStaticConstant(
                this.initialContext,
                idText(ast),
            );
            if (constant.value !== undefined) {
                return constant.value;
            } else {
                throwErrorConstEval(
                    `cannot evaluate declared constant ${idTextErr(ast)} as it does not have a body`,
                    ast.loc,
                );
            }
        }
        const letBinding = this.currentEnv.getBinding(idText(ast));
        if (letBinding !== undefined) {
            return letBinding;
        }
        throwNonFatalErrorConstEval("cannot evaluate a variable", ast.loc);
    }

    public interpretMethodCall(ast: AstMethodCall): Value {
        const methodName = ast.method;
        const args = ast.args;
        const source = ast.loc;
        const object = ast.self;

        switch (idText(methodName)) {
            case "asComment": {
                ensureMethodArity(0, args, source);
                const comment = ensureString(
                    this.interpretExpression(object),
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

    public interpretInitOf(ast: AstInitOf): Value {
        throwNonFatalErrorConstEval(
            "initOf is not supported at this moment",
            ast.loc,
        );
    }

    public interpretNull(_ast: AstNull): null {
        return null;
    }

    public interpretBoolean(ast: AstBoolean): boolean {
        return ast.value;
    }

    public interpretNumber(ast: AstNumber): bigint {
        return ensureInt(ast.value, ast.loc);
    }

    public interpretString(ast: AstString): string {
        return ensureString(
            interpretEscapeSequences(ast.value, ast.loc),
            ast.loc,
        );
    }

    public interpretUnaryOp(ast: AstOpUnary): Value {
        const operand = ast.operand;
        const op = ast.op;
        const source = ast.loc;

        // Tact grammar does not have negative integer literals,
        // so in order to avoid errors for `-115792089237316195423570985008687907853269984665640564039457584007913129639936`
        // which is `-(2**256)` we need to have a special case for it

        if (operand.kind === "number" && op === "-") {
            // emulating negative integer literals
            return ensureInt(-operand.value, source);
        }

        const valOperand = this.interpretExpression(operand);

        return evalUnaryOp(op, valOperand, operand.loc, source);
    }

    public interpretBinaryOp(ast: AstOpBinary): Value {
        const left = ast.left;
        const right = ast.right;
        const op = ast.op;
        const source = ast.loc;

        const valLeft = this.interpretExpression(left);
        const valRight = this.interpretExpression(right);

        return evalBinaryOp(op, valLeft, valRight, left.loc, right.loc, source);
    }

    public interpretConditional(ast: AstConditional): Value {
        const condition = ast.condition;
        const thenBranch = ast.thenBranch;
        const elseBranch = ast.elseBranch;

        // here we rely on the typechecker that both branches have the same type
        const valCond = ensureBoolean(
            this.interpretExpression(condition),
            condition.loc,
        );
        if (valCond) {
            return this.interpretExpression(thenBranch);
        } else {
            return this.interpretExpression(elseBranch);
        }
    }

    public interpretStructInstance(ast: AstStructInstance): StructValue {
        const structTypeId = ast.type;
        const structFields = ast.args;

        const structTy = getType(this.initialContext, structTypeId);

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
            resObj[idText(fieldWithInit.field)] = this.interpretExpression(
                fieldWithInit.initializer,
            );
            return resObj;
        }, resultWithDefaultFields);
    }

    public interpretFieldAccess(ast: AstFieldAccess): Value {
        const structExpr = ast.aggregate;
        const fieldId = ast.field;

        // special case for contract/trait constant accesses via `self.constant`
        if (structExpr.kind === "id" && isSelfId(structExpr)) {
            const selfTypeRef = getExpType(this.initialContext, structExpr);
            if (selfTypeRef.kind == "ref") {
                const contractTypeDescription = getType(
                    this.initialContext,
                    selfTypeRef.name,
                );
                const foundContractConst =
                    contractTypeDescription.constants.find((constId) =>
                        eqNames(fieldId, constId.name),
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
        const valStruct = this.interpretExpression(structExpr);
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

    public interpretStaticCall(ast: AstStaticCall): Value {
        const builtinName = ast.function;
        const args = ast.args;
        const source = ast.loc;

        switch (idText(builtinName)) {
            case "ton": {
                ensureFunArity(1, args, source);
                const tons = ensureString(
                    this.interpretExpression(args[0]!),
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
                    this.interpretExpression(args[0]!),
                    args[0]!.loc,
                );
                const valExp = ensureInt(
                    this.interpretExpression(args[1]!),
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
                    this.interpretExpression(args[0]!),
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
                    this.interpretExpression(args[0]!),
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
                        this.interpretExpression(args[0]!),
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
                        this.interpretExpression(args[0]!),
                        args[0]!.loc,
                    );
                    try {
                        const address = Address.parse(str);
                        if (
                            address.workChain !== 0 &&
                            address.workChain !== -1
                        ) {
                            throwErrorConstEval(
                                `${str} is invalid address`,
                                source,
                            );
                        }
                        if (
                            !enabledMasterchain(this.initialContext) &&
                            address.workChain !== 0
                        ) {
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
                    this.interpretExpression(args[0]!),
                    args[0]!.loc,
                );
                const addr = Buffer.from(
                    ensureInt(this.interpretExpression(args[1]!), args[1]!.loc)
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
                if (!enabledMasterchain(this.initialContext) && wc !== 0n) {
                    throwErrorConstEval(
                        `${wc}:${addr.toString("hex")} address is from masterchain which is not enabled for this contract`,
                        source,
                    );
                }
                return new Address(Number(wc), addr);
            }
            default:
                if (
                    hasStaticFunction(this.initialContext, idText(builtinName))
                ) {
                    const functionDescription = getStaticFunction(
                        this.initialContext,
                        idText(builtinName),
                    );
                    const functionCode = functionDescription.ast;
                    const returns = functionDescription.returns;
                    switch (functionCode.kind) {
                        case "function_def":
                            // Currently, no attribute is supported
                            if (functionCode.attributes.length > 0) {
                                throwNonFatalErrorConstEval(
                                    `calls to functions with attributes are currently not supported`,
                                    source,
                                );
                            }
                            return this.evalStaticFunction(
                                functionCode,
                                args,
                                returns,
                            );

                        case "function_decl":
                            throwNonFatalErrorConstEval(
                                `${idTextErr(builtinName)} cannot be interpreted because it does not have a body`,
                                source,
                            );
                            break;
                        case "native_function_decl":
                            throwNonFatalErrorConstEval(
                                `native function calls are currently not supported`,
                                source,
                            );
                            break;
                    }
                } else {
                    throwNonFatalErrorConstEval(
                        `unsupported builtin ${idTextErr(builtinName)}`,
                        source,
                    );
                }
        }
    }

    private evalStaticFunction(
        functionCode: AstFunctionDef,
        args: AstExpression[],
        returns: TypeRef,
    ): Value {
        // Evaluate the arguments in the current environment
        const argValues = args.map(this.interpretExpression, this);
        // Extract the parameter names
        const paramNames = functionCode.params.map((param) =>
            idText(param.name),
        );
        // Open a new environment for the function
        this.openNewEnvironment({ paramNames: paramNames, values: argValues });

        // Interpret all the statements
        try {
            functionCode.statements.forEach(this.interpretStatement, this);
            // At this point, the function did not execute a return.
        } catch (e) {
            if (e instanceof ReturnSignal) {
                const val = e.getValue();
                if (val !== undefined) {
                    return val;
                }
                // The function executed a return without a value
            } else {
                throw e;
            }
        } finally {
            // Close the environment created before calling the function
            this.closeCurrentEnvironment();
        }
        // If execution reaches this point, it means that
        // the function had no return statement or executed a return
        // without a value. This is an error only if the return type of the
        // function is not void
        if (returns.kind !== "void") {
            throwErrorConstEval(
                `function ${idText(functionCode.name)} must return a value`,
                functionCode.loc,
            );
        } else {
            // The function does not return a value.
            // We rely on the typechecker so that the function is called as a statement.
            // Hence, we can return a dummy null, since the null will be discarded anyway.
            return null;
        }
    }

    public interpretStatement(ast: AstStatement): void {
        switch (ast.kind) {
            case "statement_let":
                this.interpretLetStatement(ast);
                break;
            case "statement_assign":
                this.interpretAssignStatement(ast);
                break;
            case "statement_augmentedassign":
                this.interpretAugmentedAssignStatement(ast);
                break;
            case "statement_condition":
                this.interpretConditionStatement(ast);
                break;
            case "statement_expression":
                this.interpretExpressionStatement(ast);
                break;
            case "statement_foreach":
                this.interpretForEachStatement(ast);
                break;
            case "statement_repeat":
                this.interpretRepeatStatement(ast);
                break;
            case "statement_return":
                this.interpretReturnStatement(ast);
                break;
            case "statement_try":
                this.interpretTryStatement(ast);
                break;
            case "statement_try_catch":
                this.interpretTryCatchStatement(ast);
                break;
            case "statement_until":
                this.interpretUntilStatement(ast);
                break;
            case "statement_while":
                this.interpretWhileStatement(ast);
                break;
        }
    }

    public interpretLetStatement(ast: AstStatementLet) {
        const val = this.interpretExpression(ast.expression);
        this.currentEnv.setNewBinding(idText(ast.name), val);
    }

    public interpretAssignStatement(ast: AstStatementAssign) {
        const path = ast.path;
        const exp = ast.expression;

        if (path.kind === "id") {
            const val = this.interpretExpression(exp);
            this.currentEnv.updateBinding(idText(path), val);
        } else {
            throwNonFatalErrorConstEval(
                `only identifiers are currently supported as path expressions`,
                path.loc,
            );
        }
    }

    public interpretAugmentedAssignStatement(ast: AstStatementAugmentedAssign) {
        const path = ast.path;
        const exp = ast.expression;
        const op = ast.op;
        const source = ast.loc;

        if (path.kind === "id") {
            const updateVal = this.interpretExpression(exp);
            const currentPathValue = this.currentEnv.getBinding(idText(path));
            if (currentPathValue === undefined) {
                throwNonFatalErrorConstEval(`undeclared identifier`, path.loc);
            }
            const newVal = evalBinaryOp(
                op,
                currentPathValue,
                updateVal,
                path.loc,
                exp.loc,
                source,
            );
            this.currentEnv.updateBinding(idText(path), newVal);
        } else {
            throwNonFatalErrorConstEval(
                `only identifiers are currently supported as path expressions`,
                path.loc,
            );
        }
    }

    public interpretConditionStatement(ast: AstCondition) {
        const condition = ensureBoolean(
            this.interpretExpression(ast.condition),
            ast.condition.loc,
        );
        if (condition) {
            this.openNewEnvironment();

            try {
                ast.trueStatements.forEach(this.interpretStatement, this);
            } finally {
                this.closeCurrentEnvironment();
            }
        } else if (ast.falseStatements !== null) {
            this.openNewEnvironment();

            try {
                ast.falseStatements.forEach(this.interpretStatement, this);
            } finally {
                this.closeCurrentEnvironment();
            }
        }
    }

    public interpretExpressionStatement(ast: AstStatementExpression) {
        this.interpretExpression(ast.expression);
    }

    public interpretForEachStatement(ast: AstStatementForEach) {
        throwNonFatalErrorConstEval(`foreach currently not supported`, ast.loc);
    }

    public interpretRepeatStatement(ast: AstStatementRepeat) {
        const iterations = ensureRepeatInt(
            this.interpretExpression(ast.iterations),
            ast.iterations.loc,
        );
        if (iterations > 0) {
            // We can create a single environment for all the iterations in the loop
            // (instead of a fresh environment for each iteration)
            // because the typechecker ensures that variables do not leak outside
            // the loop. Also, the language requires that all declared variables inside the
            // loop be initialized, which means that we can overwrite its value in the environment
            // in each iteration.
            this.openNewEnvironment();
            try {
                for (let i = 1; i <= iterations; i++) {
                    ast.statements.forEach(this.interpretStatement, this);
                }
            } finally {
                this.closeCurrentEnvironment();
            }
        }
    }

    public interpretReturnStatement(ast: AstStatementReturn) {
        if (ast.expression !== null) {
            const val = this.interpretExpression(ast.expression);
            throw new ReturnSignal(val);
        } else {
            throw new ReturnSignal();
        }
    }

    public interpretTryStatement(ast: AstStatementTry) {
        throwNonFatalErrorConstEval(
            `try statements currently not supported`,
            ast.loc,
        );
    }

    public interpretTryCatchStatement(ast: AstStatementTryCatch) {
        throwNonFatalErrorConstEval(
            `try-catch statements currently not supported`,
            ast.loc,
        );
    }

    public interpretUntilStatement(ast: AstStatementUntil) {
        let condition;
        let iterCount = 0;
        // We can create a single environment for all the iterations in the loop
        // (instead of a fresh environment for each iteration)
        // because the typechecker ensures that variables do not leak outside
        // the loop. Also, the language requires that all declared variables inside the
        // loop be initialized, which means that we can overwrite its value in the environment
        // in each iteration.
        this.openNewEnvironment();

        try {
            do {
                ast.statements.forEach(this.interpretStatement, this);

                iterCount++;
                if (iterCount >= this.config.maxLoopIterations) {
                    throwNonFatalErrorConstEval(
                        `loop timeout reached`,
                        ast.loc,
                    );
                }
                // The typechecker ensures that the condition does not refer to
                // variables declared inside the loop.
                condition = ensureBoolean(
                    this.interpretExpression(ast.condition),
                    ast.condition.loc,
                );
            } while (!condition);
        } finally {
            this.closeCurrentEnvironment();
        }
    }

    public interpretWhileStatement(ast: AstStatementWhile) {
        let condition;
        let iterCount = 0;
        // We can create a single environment for all the iterations in the loop
        // (instead of a fresh environment for each iteration)
        // because the typechecker ensures that variables do not leak outside
        // the loop. Also, the language requires that all declared variables inside the
        // loop be initialized, which means that we can overwrite its value in the environment
        // in each iteration.
        this.openNewEnvironment();

        try {
            do {
                // The typechecker ensures that the condition does not refer to
                // variables declared inside the loop.
                condition = ensureBoolean(
                    this.interpretExpression(ast.condition),
                    ast.condition.loc,
                );
                if (condition) {
                    ast.statements.forEach(this.interpretStatement, this);

                    iterCount++;
                    if (iterCount >= this.config.maxLoopIterations) {
                        throwNonFatalErrorConstEval(
                            `loop timeout reached`,
                            ast.loc,
                        );
                    }
                }
            } while (condition);
        } finally {
            this.closeCurrentEnvironment();
        }
    }
}
