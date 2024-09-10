import { Address, beginCell, BitString, Cell, toNano } from "@ton/core";
import { paddedBufferToBits } from "@ton/core/dist/boc/utils/paddedBits";
import * as crc32 from "crc-32";
import { evalConstantExpression } from "./constEval";
import { CompilerContext } from "./context";
import {
    TactConstEvalError,
    TactParseError,
    idTextErr,
    throwConstEvalError,
    throwInternalCompilerError,
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

const WILDCARD_NAME: string = "_";

type Environment = { values: Map<string, Value>; parent?: Environment };

class EnvironmentStack {
    private currentEnv: Environment;

    constructor() {
        this.currentEnv = { values: new Map() };
    }

    private findBindingMap(name: string): Map<string, Value> | undefined {
        let env: Environment | undefined = this.currentEnv;
        while (env !== undefined) {
            if (env.values.has(name)) {
                return env.values;
            } else {
                env = env.parent;
            }
        }
        return undefined;
    }

    /*
    Sets a binding for "name" in the **current** environment of the stack.
    If a binding for "name" already exists in the current environment, it 
    overwrites the binding with the provided value.
    As a special case, name "_" is ignored.

    Note that this method does not check if binding "name" already exists in 
    a parent environment.
    This means that if binding "name" already exists in a parent environment, 
    it will be shadowed by the provided value in the current environment.
    This shadowing behavior is useful for modelling recursive function calls.
    For example, consider the recursive implementation of factorial 
    (for simplification purposes, it returns 1 for the factorial of 
    negative numbers):

    1  fun factorial(a: Int): Int {
    2  if (a <= 1) {
    3     return 1;
    4  } else {
    5     return a * factorial(a - 1);
    6  }

    Just before factorial(4) finishes its execution, the environment stack will
    look as follows (the arrows point to their parent environment):

    a = 4 <------- a = 3 <-------- a = 2 <------- a = 1

    Note how each child environment shadows variable a, because each
    recursive call to factorial at line 5 creates a child
    environment with a new binding for a.

    When factorial(1) = 1 finishes execution, the environment at the top
    of the stack is popped:
    
    a = 4 <------- a = 3 <-------- a = 2

    and execution resumes at line 5 in the environment where a = 2,
    so that the return at line 5 is 2 * 1 = 2.

    This in turn causes the stack to pop the environment at the top:

    a = 4 <------- a = 3

    so that the return at line 5 (now in the environment a = 3) will 
    produce 3 * 2 = 6, and so on.
    */
    public setNewBinding(name: string, val: Value) {
        if (name !== WILDCARD_NAME) {
            this.currentEnv.values.set(name, val);
        }
    }

    /*
    Searches the binding "name" in the stack, starting at the current
    environment and moving towards the parent environments. 
    If it finds the binding, it updates its value
    to "val". If it does not find "name", the stack is unchanged.
    As a special case, name "_" is always ignored.
    */
    public updateBinding(name: string, val: Value) {
        if (name !== WILDCARD_NAME) {
            const bindings = this.findBindingMap(name);
            if (bindings !== undefined) {
                bindings.set(name, val);
            }
        }
    }

    /*
    Searches the binding "name" in the stack, starting at the current
    environment and moving towards the parent environments. 
    If it finds "name", it returns its value.
    If it does not find "name", it returns undefined.
    As a special case, name "_" always returns undefined.
    */
    public getBinding(name: string): Value | undefined {
        if (name === WILDCARD_NAME) {
            return undefined;
        }
        const bindings = this.findBindingMap(name);
        if (bindings !== undefined) {
            return bindings.get(name);
        } else {
            return undefined;
        }
    }

    public selfInEnvironment(): boolean {
        return this.findBindingMap("self") !== undefined;
    }

    /*
    Executes "code" in a fresh environment that is placed at the top
    of the environment stack. The fresh environment is initialized
    with the bindings in "initialBindings". Once "code" finishes
    execution, the new environment is automatically popped from 
    the stack. 
    
    This method is useful for starting a new local variables scope, 
    like in a function call.
    */
    public executeInNewEnvironment<T>(
        code: () => T,
        initialBindings: { names: string[]; values: Value[] } = {
            names: [],
            values: [],
        },
    ): T {
        const names = initialBindings.names;
        const values = initialBindings.values;

        const oldEnv = this.currentEnv;
        this.currentEnv = { values: new Map(), parent: oldEnv };

        names.forEach((name, index) => {
            this.setNewBinding(name, values[index]!);
        }, this);

        try {
            return code();
        } finally {
            this.currentEnv = oldEnv;
        }
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

/*
Interprets Tact AST trees. 
The constructor receives an optional CompilerContext which includes 
all external declarations that the interpreter will use during interpretation.
If no CompilerContext is provided, the interpreter will use an empty 
CompilerContext.

**IMPORTANT**: if a custom CompilerContext is provided, it should be the 
CompilerContext provided by the typechecker. 

The reason for requiring a CompilerContext is that the interpreter should work 
in the use case where the interpreter only knows part of the code.
For example, consider the following code (I marked with brackets [ ] the places 
where the interpreter gets called during expression simplification in the 
compilation phase):

const C: Int = [1];

contract TestContract {

   get fun test(): Int {
      return [C + 1];
   }
}

When the interpreter gets called inside the brackets, it does not know what 
other code is surrounding those brackets, because the interpreter did not execute the 
code outside the brackets. Hence, it relies on the typechecker to receive the 
CompilerContext that includes the declarations in the code 
(the constant C for example).

Since the interpreter relies on the typechecker, it assumes that the given AST tree
is already a valid Tact program.

Internally, the interpreter uses a stack of environments to keep track of
variables at different scopes. Each environment in the stack contains a map
that binds a variable name to its corresponding value.
*/
export class Interpreter {
    private envStack: EnvironmentStack;
    private context: CompilerContext;
    private config: InterpreterConfig;

    constructor(
        context: CompilerContext = new CompilerContext(),
        config: InterpreterConfig = defaultInterpreterConfig,
    ) {
        this.envStack = new EnvironmentStack();
        this.context = context;
        this.config = config;
    }

    public interpretModuleItem(ast: AstModuleItem): void {
        switch (ast.kind) {
            case "constant_def":
                this.interpretConstantDef(ast);
                break;
            case "function_def":
                this.interpretFunctionDef(ast);
                break;
            case "asm_function_def":
                throwNonFatalErrorConstEval(
                    "Asm functions are currently not supported.",
                    ast.loc,
                );
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
        if (hasStaticConstant(this.context, idText(ast))) {
            const constant = getStaticConstant(this.context, idText(ast));
            if (constant.value !== undefined) {
                return constant.value;
            } else {
                throwErrorConstEval(
                    `cannot evaluate declared constant ${idTextErr(ast)} as it does not have a body`,
                    ast.loc,
                );
            }
        }
        const variableBinding = this.envStack.getBinding(idText(ast));
        if (variableBinding !== undefined) {
            return variableBinding;
        }
        throwNonFatalErrorConstEval("cannot evaluate a variable", ast.loc);
    }

    public interpretMethodCall(ast: AstMethodCall): Value {
        switch (idText(ast.method)) {
            case "asComment": {
                ensureMethodArity(0, ast.args, ast.loc);
                const comment = ensureString(
                    this.interpretExpression(ast.self),
                    ast.self.loc,
                );
                return new CommentValue(comment);
            }
            default:
                throwNonFatalErrorConstEval(
                    `calls of ${idTextErr(ast.method)} are not supported at this moment`,
                    ast.loc,
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
        // Tact grammar does not have negative integer literals,
        // so in order to avoid errors for `-115792089237316195423570985008687907853269984665640564039457584007913129639936`
        // which is `-(2**256)` we need to have a special case for it

        if (ast.operand.kind === "number" && ast.op === "-") {
            // emulating negative integer literals
            return ensureInt(-ast.operand.value, ast.loc);
        }

        const valOperand = this.interpretExpression(ast.operand);

        return evalUnaryOp(ast.op, valOperand, ast.operand.loc, ast.loc);
    }

    public interpretBinaryOp(ast: AstOpBinary): Value {
        const valLeft = this.interpretExpression(ast.left);
        const valRight = this.interpretExpression(ast.right);

        return evalBinaryOp(
            ast.op,
            valLeft,
            valRight,
            ast.left.loc,
            ast.right.loc,
            ast.loc,
        );
    }

    public interpretConditional(ast: AstConditional): Value {
        // here we rely on the typechecker that both branches have the same type
        const valCond = ensureBoolean(
            this.interpretExpression(ast.condition),
            ast.condition.loc,
        );
        if (valCond) {
            return this.interpretExpression(ast.thenBranch);
        } else {
            return this.interpretExpression(ast.elseBranch);
        }
    }

    public interpretStructInstance(ast: AstStructInstance): StructValue {
        const structTy = getType(this.context, ast.type);

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
            { $tactStruct: idText(ast.type) } as StructValue,
        );

        // this will override default fields set above
        return ast.args.reduce((resObj, fieldWithInit) => {
            resObj[idText(fieldWithInit.field)] = this.interpretExpression(
                fieldWithInit.initializer,
            );
            return resObj;
        }, resultWithDefaultFields);
    }

    public interpretFieldAccess(ast: AstFieldAccess): Value {
        // special case for contract/trait constant accesses via `self.constant`
        // interpret "self" as a contract/trait access only if "self"
        // is not already assigned in the environment (this would mean
        // we are executing inside an extends function)
        if (
            ast.aggregate.kind === "id" &&
            isSelfId(ast.aggregate) &&
            !this.envStack.selfInEnvironment()
        ) {
            const selfTypeRef = getExpType(this.context, ast.aggregate);
            if (selfTypeRef.kind === "ref") {
                const contractTypeDescription = getType(
                    this.context,
                    selfTypeRef.name,
                );
                const foundContractConst =
                    contractTypeDescription.constants.find((constId) =>
                        eqNames(ast.field, constId.name),
                    );
                if (foundContractConst === undefined) {
                    // not a constant, e.g. `self.storageVariable`
                    throwNonFatalErrorConstEval(
                        "cannot evaluate non-constant self field access",
                        ast.aggregate.loc,
                    );
                }
                if (foundContractConst.value !== undefined) {
                    return foundContractConst.value;
                } else {
                    throwErrorConstEval(
                        `cannot evaluate declared contract/trait constant ${idTextErr(ast.field)} as it does not have a body`,
                        ast.field.loc,
                    );
                }
            }
        }
        const valStruct = this.interpretExpression(ast.aggregate);
        if (
            valStruct === null ||
            typeof valStruct !== "object" ||
            !("$tactStruct" in valStruct)
        ) {
            throwErrorConstEval(
                `constant struct expected, but got ${showValue(valStruct)}`,
                ast.aggregate.loc,
            );
        }
        if (idText(ast.field) in valStruct) {
            return valStruct[idText(ast.field)]!;
        } else {
            // this cannot happen in a well-typed program
            throwInternalCompilerError(
                `struct field ${idTextErr(ast.field)} is missing`,
                ast.aggregate.loc,
            );
        }
    }

    public interpretStaticCall(ast: AstStaticCall): Value {
        switch (idText(ast.function)) {
            case "ton": {
                ensureFunArity(1, ast.args, ast.loc);
                const tons = ensureString(
                    this.interpretExpression(ast.args[0]!),
                    ast.args[0]!.loc,
                );
                try {
                    return ensureInt(
                        BigInt(toNano(tons).toString(10)),
                        ast.loc,
                    );
                } catch (e) {
                    if (e instanceof Error && e.message === "Invalid number") {
                        throwErrorConstEval(
                            `invalid ${idTextErr(ast.function)} argument`,
                            ast.loc,
                        );
                    }
                    throw e;
                }
            }
            case "pow": {
                ensureFunArity(2, ast.args, ast.loc);
                const valBase = ensureInt(
                    this.interpretExpression(ast.args[0]!),
                    ast.args[0]!.loc,
                );
                const valExp = ensureInt(
                    this.interpretExpression(ast.args[1]!),
                    ast.args[1]!.loc,
                );
                if (valExp < 0n) {
                    throwErrorConstEval(
                        `${idTextErr(ast.function)} builtin called with negative exponent ${valExp}`,
                        ast.loc,
                    );
                }
                try {
                    return ensureInt(valBase ** valExp, ast.loc);
                } catch (e) {
                    if (e instanceof RangeError) {
                        // even TS bigint type cannot hold it
                        throwErrorConstEval(
                            "integer does not fit into TVM Int type",
                            ast.loc,
                        );
                    }
                    throw e;
                }
            }
            case "pow2": {
                ensureFunArity(1, ast.args, ast.loc);
                const valExponent = ensureInt(
                    this.interpretExpression(ast.args[0]!),
                    ast.args[0]!.loc,
                );
                if (valExponent < 0n) {
                    throwErrorConstEval(
                        `${idTextErr(ast.function)} builtin called with negative exponent ${valExponent}`,
                        ast.loc,
                    );
                }
                try {
                    return ensureInt(2n ** valExponent, ast.loc);
                } catch (e) {
                    if (e instanceof RangeError) {
                        // even TS bigint type cannot hold it
                        throwErrorConstEval(
                            "integer does not fit into TVM Int type",
                            ast.loc,
                        );
                    }
                    throw e;
                }
            }
            case "sha256": {
                ensureFunArity(1, ast.args, ast.loc);
                const str = ensureString(
                    this.interpretExpression(ast.args[0]!),
                    ast.args[0]!.loc,
                );
                const dataSize = Buffer.from(str).length;
                if (dataSize > 128) {
                    throwErrorConstEval(
                        `data is too large for sha256 hash, expected up to 128 bytes, got ${dataSize}`,
                        ast.loc,
                    );
                }
                return BigInt("0x" + sha256_sync(str).toString("hex"));
            }
            case "emptyMap": {
                ensureFunArity(0, ast.args, ast.loc);
                return null;
            }
            case "cell":
                {
                    ensureFunArity(1, ast.args, ast.loc);
                    const str = ensureString(
                        this.interpretExpression(ast.args[0]!),
                        ast.args[0]!.loc,
                    );
                    try {
                        return Cell.fromBase64(str);
                    } catch (_) {
                        throwErrorConstEval(
                            `invalid base64 encoding for a cell: ${str}`,
                            ast.loc,
                        );
                    }
                }
                break;
            case "slice":
                {
                    ensureFunArity(1, ast.args, ast.loc);
                    const str = ensureString(
                        this.interpretExpression(ast.args[0]!),
                        ast.args[0]!.loc,
                    );
                    try {
                        return Cell.fromBase64(str).asSlice();
                    } catch (_) {
                        throwErrorConstEval(
                            `invalid base64 encoding for a cell: ${str}`,
                            ast.loc,
                        );
                    }
                }
                break;
            case "rawSlice":
                {
                    ensureFunArity(1, ast.args, ast.loc);
                    const str = ensureString(
                        this.interpretExpression(ast.args[0]!),
                        ast.args[0]!.loc,
                    );

                    if (!/^[0-9a-fA-F]*_?$/.test(str)) {
                        throwErrorConstEval(
                            `invalid hex string: ${str}`,
                            ast.loc,
                        );
                    }

                    // Remove underscores from the hex string
                    const hex = str.replace("_", "");
                    const paddedHex = hex.length % 2 === 0 ? hex : "0" + hex;
                    const buffer = Buffer.from(paddedHex, "hex");

                    // Initialize the BitString
                    let bits = new BitString(
                        buffer,
                        hex.length % 2 === 0 ? 0 : 4,
                        hex.length * 4,
                    );

                    // Handle the case where the string ends with an underscore
                    if (str.endsWith("_")) {
                        const paddedBits = paddedBufferToBits(buffer);

                        // Ensure there's enough length to apply the offset
                        const offset = hex.length % 2 === 0 ? 0 : 4;
                        if (paddedBits.length >= offset) {
                            bits = paddedBits.substring(
                                offset,
                                paddedBits.length - offset,
                            );
                        } else {
                            bits = new BitString(Buffer.from(""), 0, 0);
                        }
                    }

                    // Ensure the bit length is within acceptable limits
                    if (bits.length > 1023) {
                        throwErrorConstEval(
                            `slice constant is too long, expected up to 1023 bits, got ${bits.length}`,
                            ast.loc,
                        );
                    }

                    // Return the constructed slice
                    return beginCell().storeBits(bits).endCell().asSlice();
                }
                break;
            case "ascii":
                {
                    ensureFunArity(1, ast.args, ast.loc);
                    const str = ensureString(
                        this.interpretExpression(ast.args[0]!),
                        ast.args[0]!.loc,
                    );
                    const hex = Buffer.from(str).toString("hex");
                    if (hex.length > 64) {
                        throwErrorConstEval(
                            `ascii string is too long, expected up to 32 bytes, got ${Math.floor(hex.length / 2)}`,
                            ast.loc,
                        );
                    }
                    if (hex.length == 0) {
                        throwErrorConstEval(
                            `ascii string cannot be empty`,
                            ast.loc,
                        );
                    }
                    return BigInt("0x" + hex);
                }
                break;
            case "crc32":
                {
                    ensureFunArity(1, ast.args, ast.loc);
                    const str = ensureString(
                        this.interpretExpression(ast.args[0]!),
                        ast.args[0]!.loc,
                    );
                    return BigInt(crc32.str(str) >>> 0); // >>> 0 converts to unsigned
                }
                break;
            case "address":
                {
                    ensureFunArity(1, ast.args, ast.loc);
                    const str = ensureString(
                        this.interpretExpression(ast.args[0]!),
                        ast.args[0]!.loc,
                    );
                    try {
                        const address = Address.parse(str);
                        if (
                            address.workChain !== 0 &&
                            address.workChain !== -1
                        ) {
                            throwErrorConstEval(
                                `${str} is invalid address`,
                                ast.loc,
                            );
                        }
                        if (
                            !enabledMasterchain(this.context) &&
                            address.workChain !== 0
                        ) {
                            throwErrorConstEval(
                                `address ${str} is from masterchain which is not enabled for this contract`,
                                ast.loc,
                            );
                        }
                        return address;
                    } catch (_) {
                        throwErrorConstEval(
                            `invalid address encoding: ${str}`,
                            ast.loc,
                        );
                    }
                }
                break;
            case "newAddress": {
                ensureFunArity(2, ast.args, ast.loc);
                const wc = ensureInt(
                    this.interpretExpression(ast.args[0]!),
                    ast.args[0]!.loc,
                );
                const addr = Buffer.from(
                    ensureInt(
                        this.interpretExpression(ast.args[1]!),
                        ast.args[1]!.loc,
                    )
                        .toString(16)
                        .padStart(64, "0"),
                    "hex",
                );
                if (wc !== 0n && wc !== -1n) {
                    throwErrorConstEval(
                        `expected workchain of an address to be equal 0 or -1, received: ${wc}`,
                        ast.loc,
                    );
                }
                if (!enabledMasterchain(this.context) && wc !== 0n) {
                    throwErrorConstEval(
                        `${wc}:${addr.toString("hex")} address is from masterchain which is not enabled for this contract`,
                        ast.loc,
                    );
                }
                return new Address(Number(wc), addr);
            }
            default:
                if (hasStaticFunction(this.context, idText(ast.function))) {
                    const functionDescription = getStaticFunction(
                        this.context,
                        idText(ast.function),
                    );
                    switch (functionDescription.ast.kind) {
                        case "function_def":
                            // Currently, no attribute is supported
                            if (functionDescription.ast.attributes.length > 0) {
                                throwNonFatalErrorConstEval(
                                    "calls to functions with attributes are currently not supported",
                                    ast.loc,
                                );
                            }
                            return this.evalStaticFunction(
                                functionDescription.ast,
                                ast.args,
                                functionDescription.returns,
                            );

                        case "asm_function_def":
                            throwNonFatalErrorConstEval(
                                `${idTextErr(ast.function)} cannot be interpreted because it's an asm-function`,
                                ast.loc,
                            );
                            break;
                        case "function_decl":
                            throwNonFatalErrorConstEval(
                                `${idTextErr(ast.function)} cannot be interpreted because it does not have a body`,
                                ast.loc,
                            );
                            break;
                        case "native_function_decl":
                            throwNonFatalErrorConstEval(
                                "native function calls are currently not supported",
                                ast.loc,
                            );
                            break;
                    }
                } else {
                    throwNonFatalErrorConstEval(
                        `function ${idTextErr(ast.function)} is not declared`,
                        ast.loc,
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
        // Check parameter names do not shadow constants
        if (
            paramNames.some((paramName) =>
                hasStaticConstant(this.context, paramName),
            )
        ) {
            throwInternalCompilerError(
                `some parameter of function ${idText(functionCode.name)} shadows a constant with the same name`,
                functionCode.loc,
            );
        }
        // Call function inside a new environment
        return this.envStack.executeInNewEnvironment(
            () => {
                // Interpret all the statements
                try {
                    functionCode.statements.forEach(
                        this.interpretStatement,
                        this,
                    );
                    // At this point, the function did not execute a return.
                    // Execution continues after the catch.
                } catch (e) {
                    if (e instanceof ReturnSignal) {
                        const val = e.getValue();
                        if (val !== undefined) {
                            return val;
                        }
                        // The function executed a return without a value.
                        // Execution continues after the catch.
                    } else {
                        throw e;
                    }
                }
                // If execution reaches this point, it means that
                // the function had no return statement or executed a return
                // without a value. This is an error only if the return type of the
                // function is not void
                if (returns.kind !== "void") {
                    throwInternalCompilerError(
                        `function ${idText(functionCode.name)} must return a value`,
                        functionCode.loc,
                    );
                } else {
                    // The function does not return a value.
                    // We rely on the typechecker so that the function is called as a statement.
                    // Hence, we can return a dummy null, since the null will be discarded anyway.
                    return null;
                }
            },
            { names: paramNames, values: argValues },
        );
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
        if (hasStaticConstant(this.context, idText(ast.name))) {
            // Attempt of shadowing a constant in a let declaration
            throwInternalCompilerError(
                `declaration of ${idText(ast.name)} shadows a constant with the same name`,
                ast.loc,
            );
        }
        const val = this.interpretExpression(ast.expression);
        this.envStack.setNewBinding(idText(ast.name), val);
    }

    public interpretAssignStatement(ast: AstStatementAssign) {
        if (ast.path.kind === "id") {
            const val = this.interpretExpression(ast.expression);
            this.envStack.updateBinding(idText(ast.path), val);
        } else {
            throwNonFatalErrorConstEval(
                "only identifiers are currently supported as path expressions",
                ast.path.loc,
            );
        }
    }

    public interpretAugmentedAssignStatement(ast: AstStatementAugmentedAssign) {
        if (ast.path.kind === "id") {
            const updateVal = this.interpretExpression(ast.expression);
            const currentPathValue = this.envStack.getBinding(idText(ast.path));
            if (currentPathValue === undefined) {
                throwNonFatalErrorConstEval(
                    "undeclared identifier",
                    ast.path.loc,
                );
            }
            const newVal = evalBinaryOp(
                ast.op,
                currentPathValue,
                updateVal,
                ast.path.loc,
                ast.expression.loc,
                ast.loc,
            );
            this.envStack.updateBinding(idText(ast.path), newVal);
        } else {
            throwNonFatalErrorConstEval(
                "only identifiers are currently supported as path expressions",
                ast.path.loc,
            );
        }
    }

    public interpretConditionStatement(ast: AstCondition) {
        const condition = ensureBoolean(
            this.interpretExpression(ast.condition),
            ast.condition.loc,
        );
        if (condition) {
            this.envStack.executeInNewEnvironment(() => {
                ast.trueStatements.forEach(this.interpretStatement, this);
            });
        } else if (ast.falseStatements !== null) {
            this.envStack.executeInNewEnvironment(() => {
                ast.falseStatements!.forEach(this.interpretStatement, this);
            });
        }
    }

    public interpretExpressionStatement(ast: AstStatementExpression) {
        this.interpretExpression(ast.expression);
    }

    public interpretForEachStatement(ast: AstStatementForEach) {
        throwNonFatalErrorConstEval("foreach currently not supported", ast.loc);
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
            this.envStack.executeInNewEnvironment(() => {
                for (let i = 1; i <= iterations; i++) {
                    ast.statements.forEach(this.interpretStatement, this);
                }
            });
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
            "try statements currently not supported",
            ast.loc,
        );
    }

    public interpretTryCatchStatement(ast: AstStatementTryCatch) {
        throwNonFatalErrorConstEval(
            "try-catch statements currently not supported",
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
        this.envStack.executeInNewEnvironment(() => {
            do {
                ast.statements.forEach(this.interpretStatement, this);

                iterCount++;
                if (iterCount >= this.config.maxLoopIterations) {
                    throwNonFatalErrorConstEval(
                        "loop timeout reached",
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
        });
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
        this.envStack.executeInNewEnvironment(() => {
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
                            "loop timeout reached",
                            ast.loc,
                        );
                    }
                }
            } while (condition);
        });
    }
}
