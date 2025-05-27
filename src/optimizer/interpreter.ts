import {
    Address,
    beginCell,
    BitString,
    Cell,
    Dictionary,
    type DictionaryKey,
    type DictionaryKeyTypes,
    type DictionaryValue,
    toNano,
} from "@ton/core";
import { paddedBufferToBits } from "@ton/core/dist/boc/utils/paddedBits";
import { crc32 } from "@/utils/crc32";
import type * as Ast from "@/ast/ast";
import { evalConstantExpression } from "@/optimizer/constEval";
import { CompilerContext } from "@/context/context";
import {
    idTextErr,
    TactCompilationError,
    TactConstEvalError,
    throwCompilationError,
    throwConstEvalError,
    throwInternalCompilerError,
} from "@/error/errors";
import type { AstUtil } from "@/ast/util";
import { binaryOperationFromAugmentedAssignOperation } from "@/ast/util";
import { getAstUtil } from "@/ast/util";
import {
    getStaticConstant,
    getStaticFunction,
    getType,
    hasStaticConstant,
    hasStaticFunction,
} from "@/types/resolveDescriptors";
import { getExpType } from "@/types/resolveExpression";
import type { TypeRef } from "@/types/types";
import { getParser, type Parser, type SrcInfo } from "@/grammar";
import { dummySrcInfo } from "@/grammar";
import type { FactoryAst } from "@/ast/ast-helpers";
import {
    eqExpressions,
    eqNames,
    getAstFactory,
    idText,
    isSelfId,
} from "@/ast/ast-helpers";
import { divFloor, modFloor } from "@/optimizer/util";
import { sha256 } from "@/utils/sha256";
import { prettyPrint } from "@/ast/ast-printer";
import {
    type MapSerializerDescrKey,
    type MapSerializerDescrValue,
    mapSerializers,
} from "@/bindings/typescript/serializers";
import { getMapAbi } from "@/types/resolveABITypeRef";

const minSignedInt = (nBits: number): bigint => -(2n ** (BigInt(nBits) - 1n));

const maxSignedInt = (nBits: number): bigint => 2n ** (BigInt(nBits) - 1n) - 1n;

const minUnsignedInt = (_nBits: number): bigint => 0n;

const maxUnsignedInt = (nBits: number): bigint => 2n ** BigInt(nBits) - 1n;

const minVarInt = (length: number): bigint =>
    minSignedInt(8 * (2 ** length - 1));

const maxVarInt = (length: number): bigint =>
    maxSignedInt(8 * (2 ** length - 1));

const minVarUint = (_length: number): bigint => 0n;

const maxVarUint = (length: number): bigint =>
    maxUnsignedInt(8 * (2 ** length - 1));

type mapKeyOrValueIntFormat =
    | { kind: "int"; bits: number }
    | { kind: "uint"; bits: number }
    | { kind: "varint"; length: number }
    | { kind: "varuint"; length: number };

const ensureMapIntKeyOrValRange = (
    num: Ast.Number,
    intFormat: mapKeyOrValueIntFormat,
): Ast.Number => {
    const val = num.value;
    switch (intFormat.kind) {
        case "int":
            if (
                minSignedInt(intFormat.bits) <= val &&
                val <= maxSignedInt(intFormat.bits)
            ) {
                return num;
            }
            throwErrorConstEval(
                `integer '${prettyPrint(num)}' does not fit into ${intFormat.bits}-bit signed integer type`,
                num.loc,
            );
            break;
        case "uint":
            if (
                minUnsignedInt(intFormat.bits) <= val &&
                val <= maxUnsignedInt(intFormat.bits)
            ) {
                return num;
            }
            throwErrorConstEval(
                `integer '${prettyPrint(num)}' does not fit into ${intFormat.bits}-bit unsigned integer type`,
                num.loc,
            );
            break;
        case "varint":
            if (
                minVarInt(intFormat.length) <= val &&
                val <= maxVarInt(intFormat.length)
            ) {
                return num;
            }
            throwErrorConstEval(
                `integer '${prettyPrint(num)}' does not fit into variable-length signed integer type with ${intFormat.length}-bit length`,
                num.loc,
            );
            break;
        case "varuint":
            if (
                minVarUint(intFormat.length) <= val &&
                val <= maxVarUint(intFormat.length)
            ) {
                return num;
            }
            throwErrorConstEval(
                `integer '${prettyPrint(num)}' does not fit into variable-length unsigned integer type with ${intFormat.length}-bit length`,
                num.loc,
            );
    }
};

// TVM integers are signed 257-bit integers
const minTvmInt: bigint = minSignedInt(257);
const maxTvmInt: bigint = maxSignedInt(257);

// Range allowed in repeat statements
const minRepeatStatement: bigint = minTvmInt; // Note it is the same as minimum for TVM
const maxRepeatStatement: bigint = maxSignedInt(32);

// Util factory methods
// FIXME: pass util as argument
//const util = getAstUtil(getAstFactory());

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
    | { kind: "ok"; value: Ast.Literal }
    | { kind: "error"; message: string };

export function ensureInt(val: Ast.Expression): Ast.Number {
    if (val.kind !== "number") {
        throwErrorConstEval(
            `integer expected, but got expression of kind '${val.kind}'`,
            val.loc,
        );
    }
    if (minTvmInt <= val.value && val.value <= maxTvmInt) {
        return val;
    } else {
        throwErrorConstEval(
            `integer '${prettyPrint(val)}' does not fit into TVM Int type`,
            val.loc,
        );
    }
}

function ensureArgumentForEquality(val: Ast.Literal): Ast.Literal {
    switch (val.kind) {
        case "address":
        case "boolean":
        case "cell":
        case "null":
        case "number":
        case "string":
        case "slice":
            return val;
        case "map_value":
        case "struct_value": {
            throwErrorConstEval(
                `struct ${prettyPrint(val)} cannot be an argument to == operator`,
                val.loc,
            );
            break;
        }
    }
}

function ensureRepeatInt(val: Ast.Expression): Ast.Number {
    if (val.kind !== "number") {
        throwErrorConstEval(
            `integer expected, but got expression of kind '${val.kind}'`,
            val.loc,
        );
    }
    if (minRepeatStatement <= val.value && val.value <= maxRepeatStatement) {
        return val;
    } else {
        throwErrorConstEval(
            `repeat argument '${prettyPrint(val)}' must be a number between -2^256 (inclusive) and 2^31 - 1 (inclusive)`,
            val.loc,
        );
    }
}

export function ensureBoolean(val: Ast.Expression): Ast.Boolean {
    if (val.kind !== "boolean") {
        throwErrorConstEval(
            `boolean expected, but got expression of kind '${val.kind}'`,
            val.loc,
        );
    }
    return val;
}

export function ensureString(val: Ast.Expression): Ast.String {
    if (val.kind !== "string") {
        throwErrorConstEval(
            `string expected, but got expression of kind '${val.kind}'`,
            val.loc,
        );
    }
    return val;
}

function ensureFunArity(
    arity: number,
    args: readonly Ast.Expression[],
    source: SrcInfo,
) {
    if (args.length !== arity) {
        throwErrorConstEval(
            `function expects ${arity} argument(s), but got ${args.length}`,
            source,
        );
    }
}

function ensureMethodArity(
    arity: number,
    args: readonly Ast.Expression[],
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
    op: Ast.UnaryOperation,
    valOperand: Ast.Literal,
    source: SrcInfo,
    util: AstUtil,
): Ast.Literal {
    switch (op) {
        case "+":
            return ensureInt(valOperand);
        case "-": {
            const astNumber = ensureInt(valOperand);
            const result = -astNumber.value;
            return ensureInt(util.makeNumberLiteral(result, source));
        }
        case "~": {
            const astNumber = ensureInt(valOperand);
            const result = ~astNumber.value;
            return util.makeNumberLiteral(result, source);
        }
        case "!": {
            const astBoolean = ensureBoolean(valOperand);
            const result = !astBoolean.value;
            return util.makeBooleanLiteral(result, source);
        }
        case "!!":
            if (valOperand.kind === "null") {
                throwErrorConstEval(
                    "non-null value expected but got null",
                    valOperand.loc,
                );
            }
            return valOperand;
        default:
            throwInternalCompilerError("Unrecognized operand");
    }
}

export function evalBinaryOp(
    op: Ast.BinaryOperation,
    valLeft: Ast.Literal,
    valRightContinuation: () => Ast.Literal, // It needs to be a continuation, because some binary operators short-circuit
    source: SrcInfo,
    util: AstUtil,
): Ast.Literal {
    switch (op) {
        case "+": {
            const astLeft = ensureInt(valLeft);
            const astRight = ensureInt(valRightContinuation());
            const result = astLeft.value + astRight.value;
            return ensureInt(util.makeNumberLiteral(result, source));
        }
        case "-": {
            const astLeft = ensureInt(valLeft);
            const astRight = ensureInt(valRightContinuation());
            const result = astLeft.value - astRight.value;
            return ensureInt(util.makeNumberLiteral(result, source));
        }
        case "*": {
            const astLeft = ensureInt(valLeft);
            const astRight = ensureInt(valRightContinuation());
            const result = astLeft.value * astRight.value;
            return ensureInt(util.makeNumberLiteral(result, source));
        }
        case "/": {
            // The semantics of integer division for TVM (and by extension in Tact)
            // is a non-conventional one: by default it rounds towards negative infinity,
            // meaning, for instance, -1 / 5 = -1 and not zero, as in many mainstream languages.
            // Still, the following holds: a / b * b + a % b == a, for all b != 0.

            const astRight = ensureInt(valRightContinuation());
            if (astRight.value === 0n)
                throwErrorConstEval(
                    "divisor expression must be non-zero",
                    astRight.loc,
                );
            const astLeft = ensureInt(valLeft);
            const result = divFloor(astLeft.value, astRight.value);
            return ensureInt(util.makeNumberLiteral(result, source));
        }
        case "%": {
            // Same as for division, see the comment above
            // Example: -1 % 5 = 4
            const astRight = ensureInt(valRightContinuation());
            if (astRight.value === 0n)
                throwErrorConstEval(
                    "divisor expression must be non-zero",
                    astRight.loc,
                );
            const astLeft = ensureInt(valLeft);
            const result = modFloor(astLeft.value, astRight.value);
            return ensureInt(util.makeNumberLiteral(result, source));
        }
        case "&": {
            const astLeft = ensureInt(valLeft);
            const astRight = ensureInt(valRightContinuation());
            const result = astLeft.value & astRight.value;
            return util.makeNumberLiteral(result, source);
        }
        case "|": {
            const astLeft = ensureInt(valLeft);
            const astRight = ensureInt(valRightContinuation());
            const result = astLeft.value | astRight.value;
            return util.makeNumberLiteral(result, source);
        }
        case "^": {
            const astLeft = ensureInt(valLeft);
            const astRight = ensureInt(valRightContinuation());
            const result = astLeft.value ^ astRight.value;
            return util.makeNumberLiteral(result, source);
        }
        case "<<": {
            const astNum = ensureInt(valLeft);
            const astBits = ensureInt(valRightContinuation());
            if (0n > astBits.value || astBits.value > 256n) {
                throwErrorConstEval(
                    `the number of bits shifted ('${astBits.value}') must be within [0..256] range`,
                    astBits.loc,
                );
            }
            const result = astNum.value << astBits.value;
            try {
                return ensureInt(util.makeNumberLiteral(result, source));
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
            const astNum = ensureInt(valLeft);
            const astBits = ensureInt(valRightContinuation());
            if (0n > astBits.value || astBits.value > 256n) {
                throwErrorConstEval(
                    `the number of bits shifted ('${astBits.value}') must be within [0..256] range`,
                    astBits.loc,
                );
            }
            const result = astNum.value >> astBits.value;
            try {
                return ensureInt(util.makeNumberLiteral(result, source));
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
        case ">": {
            const astLeft = ensureInt(valLeft);
            const astRight = ensureInt(valRightContinuation());
            const result = astLeft.value > astRight.value;
            return util.makeBooleanLiteral(result, source);
        }
        case "<": {
            const astLeft = ensureInt(valLeft);
            const astRight = ensureInt(valRightContinuation());
            const result = astLeft.value < astRight.value;
            return util.makeBooleanLiteral(result, source);
        }
        case ">=": {
            const astLeft = ensureInt(valLeft);
            const astRight = ensureInt(valRightContinuation());
            const result = astLeft.value >= astRight.value;
            return util.makeBooleanLiteral(result, source);
        }
        case "<=": {
            const astLeft = ensureInt(valLeft);
            const astRight = ensureInt(valRightContinuation());
            const result = astLeft.value <= astRight.value;
            return util.makeBooleanLiteral(result, source);
        }
        case "==": {
            const valR = valRightContinuation();

            // the null comparisons account for optional types, e.g.
            // a const x: Int? = 42 can be compared to null
            if (
                valLeft.kind !== valR.kind &&
                valLeft.kind !== "null" &&
                valR.kind !== "null"
            ) {
                throwErrorConstEval(
                    "operands of `==` must have same type",
                    source,
                );
            }
            const valLeft_ = ensureArgumentForEquality(valLeft);
            const valR_ = ensureArgumentForEquality(valR);

            // Changed to equality testing (instead of ===) because cells, slices, address are equal by hashing
            const result = eqExpressions(valLeft_, valR_);
            return util.makeBooleanLiteral(result, source);
        }
        case "!=": {
            const valR = valRightContinuation();

            // Comparison to null should be checked as well
            // otherwise it would give an error
            if (
                valLeft.kind !== valR.kind &&
                valLeft.kind !== "null" &&
                valR.kind !== "null"
            ) {
                throwErrorConstEval(
                    "operands of `!=` must have same type",
                    source,
                );
            }
            const valLeft_ = ensureArgumentForEquality(valLeft);
            const valR_ = ensureArgumentForEquality(valR);

            // Changed to equality testing (instead of ===) because cells, slices are equal by hashing
            const result = !eqExpressions(valLeft_, valR_);
            return util.makeBooleanLiteral(result, source);
        }
        case "&&": {
            const astLeft = ensureBoolean(valLeft);
            const result =
                astLeft.value && ensureBoolean(valRightContinuation()).value;
            return util.makeBooleanLiteral(result, source);
        }
        case "||": {
            const astLeft = ensureBoolean(valLeft);
            const result =
                astLeft.value || ensureBoolean(valRightContinuation()).value;
            return util.makeBooleanLiteral(result, source);
        }
    }
}

class ReturnSignal extends Error {
    private value?: Ast.Literal;

    constructor(value?: Ast.Literal) {
        super();
        this.value = value;
    }

    public getValue(): Ast.Literal | undefined {
        return this.value;
    }
}

export type InterpreterConfig = {
    // Options that tune the interpreter's behavior.

    // Maximum number of iterations inside a loop before a time out is issued.
    // This option only applies to: do...until and while loops
    maxLoopIterations: bigint;
};

const WILDCARD_NAME: string = "_";

type Environment = {
    values: Map<string, Ast.Literal>;
    parent?: Environment;
};

class EnvironmentStack {
    private currentEnv: Environment;

    constructor() {
        this.currentEnv = { values: new Map() };
    }

    private findBindingMap(name: string): Map<string, Ast.Literal> | undefined {
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
    public setNewBinding(name: string, val: Ast.Literal) {
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
    public updateBinding(name: string, val: Ast.Literal) {
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
    public getBinding(name: string): Ast.Literal | undefined {
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

    /**
     * Executes code parameter in a fresh environment that is placed at the top
     * of the environment stack. The fresh environment is initialized
     * with the bindings in "initialBindings". Once code finishes
     * execution, the new environment is automatically popped from
     * the stack.
     *
     * This method is useful for starting a new local variables scope,
     * like in a function call.
     * @param code The code to execute in the fresh environment.
     * @param initialBindings The initial bindings to add to the fresh environment.
     */
    public executeInNewEnvironment<T>(
        code: () => T,
        initialBindings: { names: string[]; values: Ast.Literal[] } = {
            names: [],
            values: [],
        },
    ): T {
        const names = initialBindings.names;
        const values = initialBindings.values;

        const oldEnv = this.currentEnv;

        this.currentEnv = {
            values: new Map(),
            parent: oldEnv,
        };

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

export function parseAndEvalExpression(
    sourceCode: string,
    ast: FactoryAst = getAstFactory(),
    parser: Parser = getParser(ast),
    util: AstUtil = getAstUtil(ast),
): EvalResult {
    try {
        const ast = parser.parseExpression(sourceCode);
        const constEvalResult = evalConstantExpression(
            ast,
            new CompilerContext(),
            util,
        );
        return { kind: "ok", value: constEvalResult };
    } catch (error) {
        if (
            error instanceof TactCompilationError ||
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

type KeyExist = <R>(
    cb: <K extends DictionaryKeyTypes>(
        type: DictionaryKey<K>,
        parse: (value: Ast.Literal, keyExprLoc: SrcInfo) => K,
    ) => R,
) => R;

type ValueExist = <R>(
    cb: <V>(
        type: DictionaryValue<V>,
        parse: (value: Ast.Literal, valueExprLoc: SrcInfo) => V,
    ) => R,
) => R;

const expectNumber = (node: Ast.Literal, loc: SrcInfo): bigint => {
    if (node.kind !== "number") {
        return throwErrorConstEval("Unexpected expression type", loc);
    }
    return node.value;
};

const expectAddress = (node: Ast.Literal, loc: SrcInfo): Address => {
    if (node.kind !== "address") {
        return throwErrorConstEval("Unexpected expression type", loc);
    }
    return node.value;
};

const expectCell = (node: Ast.Literal, loc: SrcInfo): Cell => {
    if (node.kind !== "cell") {
        return throwErrorConstEval("Unexpected expression type", loc);
    }
    return node.value;
};

const expectBool = (node: Ast.Literal, loc: SrcInfo): boolean => {
    if (node.kind !== "boolean") {
        return throwErrorConstEval("Unexpected expression type", loc);
    }
    return node.value;
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

    /**
     * Stores all visited constants during the current computation.
     */
    private visitedConstants: Set<string> = new Set();

    /**
     * Stores all constants that were calculated during the computation of some constant,
     * and the functions that were called for this process.
     * Used only in case of circular dependencies to return a clear error.
     */
    private constantComputationPath: string[] = [];
    private config: InterpreterConfig;
    private util: AstUtil;

    constructor(
        util: AstUtil,
        context: CompilerContext = new CompilerContext(),
        config: InterpreterConfig = defaultInterpreterConfig,
    ) {
        this.envStack = new EnvironmentStack();
        this.context = context;
        this.config = config;
        this.util = util;
    }

    /**
     * This is the public access for expression interpretation.
     * @param ast Expression to interpret.
     */
    public interpretExpression(expr: Ast.Expression): Ast.Literal {
        return this.handleStackOverflow(expr.loc, () =>
            this.interpretExpressionInternal(expr),
        );
    }

    /**
     * This is the public access for statement interpretation.
     * @param stmt Statement to interpret.
     */
    public interpretStatement(stmt: Ast.Statement) {
        this.handleStackOverflow(stmt.loc, () => {
            this.interpretStatementInternal(stmt);
        });
    }

    /**
     * This is the public access for module item interpretation.
     * @param modItem Module item to interpret.
     */
    public interpretModuleItem(modItem: Ast.ModuleItem) {
        this.handleStackOverflow(modItem.loc, () => {
            this.interpretModuleItemInternal(modItem);
        });
    }

    private interpretModuleItemInternal(ast: Ast.ModuleItem) {
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

    private interpretConstantDef(ast: Ast.ConstantDef) {
        throwNonFatalErrorConstEval(
            "Constant definitions are currently not supported.",
            ast.loc,
        );
    }

    private interpretFunctionDef(ast: Ast.FunctionDef) {
        throwNonFatalErrorConstEval(
            "Function definitions are currently not supported.",
            ast.loc,
        );
    }

    private interpretStructDecl(ast: Ast.StructDecl) {
        throwNonFatalErrorConstEval(
            "Struct declarations are currently not supported.",
            ast.loc,
        );
    }

    private interpretMessageDecl(ast: Ast.MessageDecl) {
        throwNonFatalErrorConstEval(
            "Message declarations are currently not supported.",
            ast.loc,
        );
    }

    private interpretPrimitiveTypeDecl(ast: Ast.PrimitiveTypeDecl) {
        throwNonFatalErrorConstEval(
            "Primitive type declarations are currently not supported.",
            ast.loc,
        );
    }

    private interpretFunctionDecl(ast: Ast.NativeFunctionDecl) {
        throwNonFatalErrorConstEval(
            "Native function declarations are currently not supported.",
            ast.loc,
        );
    }

    private interpretContract(ast: Ast.Contract) {
        throwNonFatalErrorConstEval(
            "Contract declarations are currently not supported.",
            ast.loc,
        );
    }

    private interpretTrait(ast: Ast.Trait) {
        throwNonFatalErrorConstEval(
            "Trait declarations are currently not supported.",
            ast.loc,
        );
    }

    private interpretExpressionInternal(ast: Ast.Expression): Ast.Literal {
        switch (ast.kind) {
            case "id":
                return this.interpretName(ast);
            case "method_call":
                return this.interpretMethodCall(ast);
            case "init_of":
                return this.interpretInitOf(ast);
            case "code_of":
                return this.interpretCodeOf(ast);
            case "null":
                return this.interpretNull(ast);
            case "boolean":
                return this.interpretBoolean(ast);
            case "number":
                return this.interpretNumber(ast);
            case "string":
                return this.interpretString(ast);
            case "address":
                return this.interpretAddress(ast);
            case "cell":
                return this.interpretCell(ast);
            case "slice":
                return this.interpretSlice(ast);
            case "op_unary":
                return this.interpretUnaryOp(ast);
            case "op_binary":
                return this.interpretBinaryOp(ast);
            case "conditional":
                return this.interpretConditional(ast);
            case "struct_instance":
                return this.interpretStructInstance(ast);
            case "struct_value":
                return this.interpretStructValue(ast);
            case "field_access":
                return this.interpretFieldAccess(ast);
            case "static_call":
                return this.interpretStaticCall(ast);
            case "map_value":
                return this.interpretMapValue(ast);
            case "map_literal":
                return this.interpretMapLiteral(ast);
            case "set_literal":
                return throwInternalCompilerError(
                    "Set literals are not supported",
                );
        }
    }

    private interpretName(ast: Ast.Id): Ast.Literal {
        const name = idText(ast);

        if (hasStaticConstant(this.context, name)) {
            const constant = getStaticConstant(this.context, name);
            if (constant.value !== undefined) {
                return constant.value;
            }

            // Since we call `interpretExpression` on a constant value below, we don't want
            // infinite recursion due to circular dependencies. To prevent this, let's collect
            // all the constants we process in this iteration. That way, any circular dependencies
            // will result in a second occurrence here and thus an early (before stack overflow)
            // exception being thrown here.
            if (this.visitedConstants.has(name)) {
                throwErrorConstEval(
                    `cannot evaluate ${name} as it has circular dependencies: [${this.formatComputationPath(name)}]`,
                    ast.loc,
                );
            }
            this.visitedConstants.add(name);

            const astNode = constant.ast;
            if (astNode.kind === "constant_def") {
                constant.value = this.inComputationPath(name, () =>
                    this.interpretExpressionInternal(astNode.initializer),
                );
                return constant.value;
            }

            throwErrorConstEval(
                `cannot evaluate declared constant ${idTextErr(ast)} as it does not have a body`,
                ast.loc,
            );
        }
        const variableBinding = this.envStack.getBinding(name);
        if (variableBinding !== undefined) {
            return variableBinding;
        }
        throwNonFatalErrorConstEval("cannot evaluate a variable", ast.loc);
    }

    private interpretMethodCall(ast: Ast.MethodCall): Ast.Literal {
        switch (idText(ast.method)) {
            case "asComment": {
                ensureMethodArity(0, ast.args, ast.loc);
                const comment = ensureString(
                    this.interpretExpressionInternal(ast.self),
                ).value;
                return this.util.makeCellLiteral(
                    beginCell()
                        .storeUint(0, 32)
                        .storeStringTail(comment)
                        .endCell(),
                    ast.loc,
                );
            }
            default:
                throwNonFatalErrorConstEval(
                    `calls of ${idTextErr(ast.method)} are not supported at this moment`,
                    ast.loc,
                );
        }
    }

    private interpretInitOf(ast: Ast.InitOf): Ast.Literal {
        throwNonFatalErrorConstEval(
            "initOf is not supported at this moment",
            ast.loc,
        );
    }

    private interpretCodeOf(ast: Ast.CodeOf): Ast.Literal {
        throwNonFatalErrorConstEval(
            "codeOf is not supported at this moment",
            ast.loc,
        );
    }

    private interpretNull(ast: Ast.Null): Ast.Null {
        return ast;
    }

    private interpretBoolean(ast: Ast.Boolean): Ast.Boolean {
        return ast;
    }

    private interpretNumber(ast: Ast.Number): Ast.Number {
        return ensureInt(ast);
    }

    private interpretString(ast: Ast.String): Ast.String {
        return ensureString(ast);
    }

    private interpretAddress(ast: Ast.Address): Ast.Address {
        return ast;
    }

    private interpretCell(ast: Ast.Cell): Ast.Cell {
        return ast;
    }

    private interpretSlice(ast: Ast.Slice): Ast.Slice {
        return ast;
    }

    private interpretUnaryOp(ast: Ast.OpUnary): Ast.Literal {
        // Tact grammar does not have negative integer literals,
        // so in order to avoid errors for `-115792089237316195423570985008687907853269984665640564039457584007913129639936`
        // which is `-(2**256)` we need to have a special case for it

        if (ast.operand.kind === "number" && ast.op === "-") {
            // emulating negative integer literals
            return ensureInt(
                this.util.makeNumberLiteral(-ast.operand.value, ast.loc),
            );
        }

        const valOperand = this.interpretExpressionInternal(ast.operand);

        return evalUnaryOp(ast.op, valOperand, ast.loc, this.util);
    }

    private interpretBinaryOp(ast: Ast.OpBinary): Ast.Literal {
        const valLeft = this.interpretExpressionInternal(ast.left);
        const valRightContinuation = () =>
            this.interpretExpressionInternal(ast.right);

        return evalBinaryOp(
            ast.op,
            valLeft,
            valRightContinuation,
            ast.loc,
            this.util,
        );
    }

    private interpretConditional(ast: Ast.Conditional): Ast.Literal {
        // here we rely on the typechecker that both branches have the same type
        const valCond = ensureBoolean(
            this.interpretExpressionInternal(ast.condition),
        );
        if (valCond.value) {
            return this.interpretExpressionInternal(ast.thenBranch);
        } else {
            return this.interpretExpressionInternal(ast.elseBranch);
        }
    }

    private interpretStructInstance(ast: Ast.StructInstance): Ast.StructValue {
        const structTy = getType(this.context, ast.type);

        // initialize the resulting struct value with
        // the default values for fields with initializers
        // or null for uninitialized optional fields
        const resultMap: Map<string, Ast.Literal> = new Map();

        for (const field of structTy.fields) {
            const fieldInit = field.ast.initializer;
            if (fieldInit) {
                const defaultValue =
                    field.default ??
                    evalConstantExpression(fieldInit, this.context, this.util);

                if (typeof defaultValue !== "undefined") {
                    resultMap.set(field.name, defaultValue);
                }
            } else {
                if (field.type.kind === "ref" && field.type.optional) {
                    resultMap.set(
                        field.name,
                        this.util.makeNullLiteral(ast.loc),
                    );
                }
            }
        }

        // this will override default fields set above
        for (const fieldWithInit of ast.args) {
            const v = this.interpretExpressionInternal(
                fieldWithInit.initializer,
            );
            resultMap.set(idText(fieldWithInit.field), v);
        }

        // Create the field entries for the StructValue
        // The previous loop ensures that the map resultMap cannot return
        // undefined for each of the fields in ast.args
        const structValueFields: Ast.StructFieldValue[] = [];
        for (const [fieldName, fieldValue] of resultMap) {
            // Find the source code declaration, if existent
            const sourceField = ast.args.find(
                (f) => idText(f.field) === fieldName,
            );
            if (typeof sourceField !== "undefined") {
                structValueFields.push(
                    this.util.makeStructFieldValue(
                        fieldName,
                        fieldValue,
                        sourceField.loc,
                    ),
                );
            } else {
                // Use as source code location the entire struct
                structValueFields.push(
                    this.util.makeStructFieldValue(
                        fieldName,
                        fieldValue,
                        ast.loc,
                    ),
                );
            }
        }

        return this.util.makeStructValue(structValueFields, ast.type, ast.loc);
    }

    private interpretStructValue(ast: Ast.StructValue): Ast.StructValue {
        // Struct values are already simplified to their simplest form
        return ast;
    }
    private interpretMapValue(ast: Ast.MapValue): Ast.MapValue {
        return ast;
    }

    private interpretMapLiteral(ast: Ast.MapLiteral): Ast.MapValue {
        const keyTy = getType(this.context, ast.type.keyType);
        const valTy = getType(this.context, ast.type.valueType);
        const res = mapSerializers.abiMatcher(
            getMapAbi(
                {
                    kind: "map",
                    key: keyTy.name,
                    keyAs:
                        ast.type.keyStorageType !== undefined
                            ? idText(ast.type.keyStorageType)
                            : null,
                    value: valTy.name,
                    valueAs:
                        ast.type.valueStorageType !== undefined
                            ? idText(ast.type.valueStorageType)
                            : null,
                },
                ast.loc,
            ),
        );
        if (res === null) {
            throwInternalCompilerError("Wrong map ABI");
        }
        const keyExist = this.getKeyParser(res.key);
        const valueExist = this.getValueParser(res.value);
        const bocHex = keyExist((keyType, parseKey) => {
            return valueExist((valueType, parseValue) => {
                if (ast.fields.length === 0) {
                    return undefined;
                }
                let dict = Dictionary.empty(keyType, valueType);
                for (const { key: keyExpr, value: valueExpr } of ast.fields) {
                    const keyValue = this.interpretExpressionInternal(keyExpr);
                    if (keyValue.kind === "number") {
                        if (res.key.kind === "int" || res.key.kind === "uint") {
                            ensureMapIntKeyOrValRange(keyValue, res.key);
                        }
                    }
                    const dictKeyValue = parseKey(keyValue, keyExpr.loc);
                    const valValue =
                        this.interpretExpressionInternal(valueExpr);
                    if (valValue.kind === "number") {
                        if (
                            res.value.kind === "int" ||
                            res.value.kind === "uint" ||
                            res.value.kind === "varint" ||
                            res.value.kind === "varuint"
                        ) {
                            ensureMapIntKeyOrValRange(valValue, res.value);
                        }
                    }
                    const dictValValue = parseValue(valValue, valueExpr.loc);
                    dict = dict.set(dictKeyValue, dictValValue);
                }
                return beginCell()
                    .storeDictDirect(dict)
                    .endCell()
                    .toBoc()
                    .toString("hex");
            });
        });
        return this.util.makeMapValue(bocHex, ast.type, ast.loc);
    }

    getKeyParser(src: MapSerializerDescrKey): KeyExist {
        switch (src.kind) {
            case "int": {
                return (cb) =>
                    cb(Dictionary.Keys.BigInt(src.bits), expectNumber);
            }
            case "uint": {
                return (cb) =>
                    cb(Dictionary.Keys.BigUint(src.bits), expectNumber);
            }
            case "address": {
                return (cb) => cb(Dictionary.Keys.Address(), expectAddress);
            }
        }
    }
    getValueParser(src: MapSerializerDescrValue): ValueExist {
        switch (src.kind) {
            case "int": {
                return (cb) =>
                    cb(Dictionary.Values.BigInt(src.bits), expectNumber);
            }
            case "uint": {
                return (cb) =>
                    cb(Dictionary.Values.BigUint(src.bits), expectNumber);
            }
            case "varint": {
                return (cb) =>
                    cb(Dictionary.Values.BigVarInt(src.length), expectNumber);
            }
            case "varuint": {
                return (cb) =>
                    cb(Dictionary.Values.BigVarUint(src.length), expectNumber);
            }
            case "address": {
                return (cb) => cb(Dictionary.Values.Address(), expectAddress);
            }
            case "cell": {
                return (cb) => cb(Dictionary.Values.Cell(), expectCell);
            }
            case "boolean": {
                return (cb) => cb(Dictionary.Values.Bool(), expectBool);
            }
            case "struct": {
                return (cb) =>
                    cb(Dictionary.Values.Cell(), (_, loc) => {
                        throwNonFatalErrorConstEval(
                            "Cannot evaluate map with struct values",
                            loc,
                        );
                    });
            }
        }
    }

    private interpretFieldAccess(ast: Ast.FieldAccess): Ast.Literal {
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
                }

                const name = `self.${idText(ast.field)}`;

                // see comment in `interpretName`
                if (this.visitedConstants.has(name)) {
                    throwErrorConstEval(
                        `cannot evaluate ${name} as it has circular dependencies: [${this.formatComputationPath(name)}]`,
                        ast.loc,
                    );
                }
                this.visitedConstants.add(name);

                const astNode = foundContractConst.ast;
                if (astNode.kind === "constant_def") {
                    foundContractConst.value = this.inComputationPath(
                        name,
                        () => this.interpretExpression(astNode.initializer),
                    );
                    return foundContractConst.value;
                }

                throwErrorConstEval(
                    `cannot evaluate declared contract/trait constant ${idTextErr(ast.field)} as it does not have a body`,
                    ast.field.loc,
                );
            }
        }
        const valStruct = this.interpretExpressionInternal(ast.aggregate);
        if (valStruct.kind !== "struct_value") {
            throwErrorConstEval(
                `constant struct expected, but got ${prettyPrint(valStruct)}`,
                ast.aggregate.loc,
            );
        }
        const field = valStruct.args.find(
            (f) => idText(ast.field) === idText(f.field),
        );
        if (typeof field !== "undefined") {
            return field.initializer;
        } else {
            // this cannot happen in a well-typed program
            throwInternalCompilerError(
                `struct field ${idTextErr(ast.field)} is missing`,
                ast.aggregate.loc,
            );
        }
    }

    private interpretStaticCall(ast: Ast.StaticCall): Ast.Literal {
        switch (idText(ast.function)) {
            case "ton": {
                ensureFunArity(1, ast.args, ast.loc);
                const tons = ensureString(
                    this.interpretExpressionInternal(ast.args[0]!),
                );
                if (tons.value.trim().length === 0) {
                    throwCompilationError(
                        "ton() function requires a non-empty value",
                        tons.loc,
                    );
                }

                const value = this.parseTonBuiltinValue(tons);
                if (typeof value === "undefined") {
                    throwCompilationError(
                        "ton() function requires a valid number with no more than 10 digits after the decimal point",
                        tons.loc,
                    );
                }
                if (value < 0) {
                    throwCompilationError(
                        "ton() function requires a non-negative number",
                        tons.loc,
                    );
                }

                try {
                    return ensureInt(
                        this.util.makeNumberLiteral(value, ast.loc),
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
                    this.interpretExpressionInternal(ast.args[0]!),
                );
                const valExp = ensureInt(
                    this.interpretExpressionInternal(ast.args[1]!),
                );
                if (valExp.value < 0n) {
                    throwErrorConstEval(
                        `${idTextErr(ast.function)} builtin called with negative exponent ${prettyPrint(valExp)}`,
                        ast.loc,
                    );
                }
                try {
                    const result = valBase.value ** valExp.value;
                    return ensureInt(
                        this.util.makeNumberLiteral(result, ast.loc),
                    );
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
                    this.interpretExpressionInternal(ast.args[0]!),
                );
                if (valExponent.value < 0n) {
                    throwErrorConstEval(
                        `${idTextErr(ast.function)} builtin called with negative exponent ${prettyPrint(valExponent)}`,
                        ast.loc,
                    );
                }
                try {
                    const result = 2n ** valExponent.value;
                    return ensureInt(
                        this.util.makeNumberLiteral(result, ast.loc),
                    );
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
                const expr = this.interpretExpressionInternal(ast.args[0]!);
                if (expr.kind === "slice") {
                    throwNonFatalErrorConstEval(
                        "slice argument is currently not supported",
                        ast.loc,
                    );
                }
                const str = ensureString(expr);
                return this.util.makeNumberLiteral(
                    sha256(str.value).value,
                    ast.loc,
                );
            }
            case "emptyMap": {
                ensureFunArity(0, ast.args, ast.loc);
                return this.util.makeNullLiteral(ast.loc);
            }
            case "cell":
                {
                    ensureFunArity(1, ast.args, ast.loc);
                    const str = ensureString(
                        this.interpretExpressionInternal(ast.args[0]!),
                    );
                    try {
                        return this.util.makeCellLiteral(
                            Cell.fromBase64(str.value),
                            ast.loc,
                        );
                    } catch (_) {
                        throwErrorConstEval(
                            `invalid base64 encoding for a cell: ${prettyPrint(str)}`,
                            ast.loc,
                        );
                    }
                }
                break;
            case "slice":
                {
                    ensureFunArity(1, ast.args, ast.loc);
                    const str = ensureString(
                        this.interpretExpressionInternal(ast.args[0]!),
                    );
                    try {
                        return this.util.makeSliceLiteral(
                            Cell.fromBase64(str.value).asSlice(),
                            ast.loc,
                        );
                    } catch (_) {
                        throwErrorConstEval(
                            `invalid base64 encoding for a cell: ${prettyPrint(str)}`,
                            ast.loc,
                        );
                    }
                }
                break;
            case "rawSlice":
                {
                    ensureFunArity(1, ast.args, ast.loc);
                    const str = ensureString(
                        this.interpretExpressionInternal(ast.args[0]!),
                    );

                    if (!/^[0-9a-fA-F]*_?$/.test(str.value)) {
                        throwErrorConstEval(
                            `invalid hex string: ${prettyPrint(str)}`,
                            ast.loc,
                        );
                    }

                    // Remove underscores from the hex string
                    const hex = str.value.replace("_", "");
                    const paddedHex = hex.length % 2 === 0 ? hex : "0" + hex;
                    const buffer = Buffer.from(paddedHex, "hex");

                    // Initialize the BitString
                    let bits = new BitString(
                        buffer,
                        hex.length % 2 === 0 ? 0 : 4,
                        hex.length * 4,
                    );

                    // Handle the case where the string ends with an underscore
                    if (str.value.endsWith("_")) {
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
                    return this.util.makeSliceLiteral(
                        beginCell().storeBits(bits).endCell().asSlice(),
                        ast.loc,
                    );
                }
                break;
            case "ascii":
                {
                    ensureFunArity(1, ast.args, ast.loc);
                    const str = ensureString(
                        this.interpretExpressionInternal(ast.args[0]!),
                    );
                    const hex = Buffer.from(str.value).toString("hex");
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
                    return this.util.makeNumberLiteral(
                        BigInt("0x" + hex),
                        ast.loc,
                    );
                }
                break;
            case "crc32":
                {
                    ensureFunArity(1, ast.args, ast.loc);
                    const str = ensureString(
                        this.interpretExpressionInternal(ast.args[0]!),
                    );
                    return this.util.makeNumberLiteral(
                        BigInt(crc32(str.value) >>> 0),
                        ast.loc,
                    ); // >>> 0 converts to unsigned
                }
                break;
            case "address":
                {
                    ensureFunArity(1, ast.args, ast.loc);
                    const str = ensureString(
                        this.interpretExpressionInternal(ast.args[0]!),
                    );
                    try {
                        const address = Address.parse(str.value);
                        if (
                            address.workChain !== 0 &&
                            address.workChain !== -1
                        ) {
                            throwErrorConstEval(
                                `${prettyPrint(str)} is invalid address`,
                                ast.loc,
                            );
                        }
                        return this.util.makeAddressLiteral(address, ast.loc);
                    } catch (_) {
                        throwErrorConstEval(
                            `invalid address encoding: ${prettyPrint(str)}`,
                            ast.loc,
                        );
                    }
                }
                break;
            case "newAddress": {
                ensureFunArity(2, ast.args, ast.loc);
                const wc = ensureInt(
                    this.interpretExpressionInternal(ast.args[0]!),
                ).value;
                const addr = Buffer.from(
                    ensureInt(this.interpretExpressionInternal(ast.args[1]!))
                        .value.toString(16)
                        .padStart(64, "0"),
                    "hex",
                );
                if (wc !== 0n && wc !== -1n) {
                    throwErrorConstEval(
                        `expected workchain of an address to be equal 0 or -1, received: ${wc}`,
                        ast.loc,
                    );
                }
                return this.util.makeAddressLiteral(
                    new Address(Number(wc), addr),
                    ast.loc,
                );
            }
            default:
                if (hasStaticFunction(this.context, idText(ast.function))) {
                    const functionDescription = getStaticFunction(
                        this.context,
                        idText(ast.function),
                    );
                    const functionNode = functionDescription.ast;
                    switch (functionNode.kind) {
                        case "function_def": {
                            // Currently, no attribute is supported
                            if (functionNode.attributes.length > 0) {
                                throwNonFatalErrorConstEval(
                                    "calls to functions with attributes are currently not supported",
                                    ast.loc,
                                );
                            }
                            return this.inComputationPath(
                                `${functionDescription.name}()`,
                                () =>
                                    this.evalStaticFunction(
                                        functionNode,
                                        ast.args,
                                        functionDescription.returns,
                                    ),
                            );
                        }
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

    private parseTonBuiltinValue(tons: Ast.String): bigint | undefined {
        try {
            const value = toNano(tons.value);
            return BigInt(value.toString(10));
        } catch {
            return undefined;
        }
    }

    private evalStaticFunction(
        functionCode: Ast.FunctionDef,
        args: readonly Ast.Expression[],
        returns: TypeRef,
    ): Ast.Literal {
        // Evaluate the arguments in the current environment
        const argValues = args.map(this.interpretExpressionInternal, this);
        // Extract the parameter names
        const paramNames = functionCode.params.flatMap((param) =>
            param.name.kind === "id" ? [idText(param.name)] : [],
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
                        this.interpretStatementInternal,
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
                    return this.util.makeNullLiteral(dummySrcInfo);
                }
            },
            { names: paramNames, values: argValues },
        );
    }

    private interpretStatementInternal(ast: Ast.Statement) {
        switch (ast.kind) {
            case "statement_let":
                this.interpretLetStatement(ast);
                break;
            case "statement_destruct":
                this.interpretDestructStatement(ast);
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
            case "statement_until":
                this.interpretUntilStatement(ast);
                break;
            case "statement_while":
                this.interpretWhileStatement(ast);
                break;
            case "statement_block":
                this.interpretBlockStatement(ast);
                break;
        }
    }

    private interpretLetStatement(ast: Ast.StatementLet) {
        if (ast.name.kind === "wildcard") {
            this.interpretExpressionInternal(ast.expression);
            return;
        }
        const id = idText(ast.name);
        if (hasStaticConstant(this.context, id)) {
            // Attempt of shadowing a constant in a let declaration
            throwInternalCompilerError(
                `declaration of ${id} shadows a constant with the same name`,
                ast.loc,
            );
        }
        const val = this.interpretExpressionInternal(ast.expression);
        this.envStack.setNewBinding(id, val);
    }

    private interpretDestructStatement(ast: Ast.StatementDestruct) {
        for (const [_, name] of ast.identifiers.values()) {
            if (name.kind !== "id") {
                continue;
            }
            const id = idText(name);
            if (hasStaticConstant(this.context, id)) {
                // Attempt of shadowing a constant in a destructuring declaration
                throwInternalCompilerError(
                    `declaration of ${id} shadows a constant with the same name`,
                    ast.loc,
                );
            }
        }
        const val = this.interpretExpressionInternal(ast.expression);
        if (val.kind !== "struct_value") {
            throwErrorConstEval(
                `destructuring assignment expected a struct, but got ${prettyPrint(
                    val,
                )}`,
                ast.expression.loc,
            );
        }

        // Keep a map of the fields in val for lookup
        const valAsMap: Map<string, Ast.Literal> = new Map();
        val.args.forEach((f) => valAsMap.set(idText(f.field), f.initializer));

        for (const [field, name] of ast.identifiers.values()) {
            if (name.kind === "wildcard") {
                continue;
            }
            const v = valAsMap.get(idText(field));
            if (typeof v === "undefined") {
                throwErrorConstEval(
                    `destructuring assignment expected field ${idTextErr(
                        field,
                    )}`,
                    ast.loc,
                );
            }
            this.envStack.setNewBinding(idText(name), v);
        }
    }

    private interpretAssignStatement(ast: Ast.StatementAssign) {
        if (ast.path.kind === "id") {
            const val = this.interpretExpressionInternal(ast.expression);
            this.envStack.updateBinding(idText(ast.path), val);
        } else {
            throwNonFatalErrorConstEval(
                "only identifiers are currently supported as path expressions",
                ast.path.loc,
            );
        }
    }

    private interpretAugmentedAssignStatement(
        ast: Ast.StatementAugmentedAssign,
    ) {
        if (ast.path.kind === "id") {
            const updateVal = () =>
                this.interpretExpressionInternal(ast.expression);
            const currentPathValue = this.envStack.getBinding(idText(ast.path));
            if (currentPathValue === undefined) {
                throwNonFatalErrorConstEval(
                    "undeclared identifier",
                    ast.path.loc,
                );
            }
            const newVal = evalBinaryOp(
                binaryOperationFromAugmentedAssignOperation(ast.op),
                currentPathValue,
                updateVal,
                ast.loc,
                this.util,
            );
            this.envStack.updateBinding(idText(ast.path), newVal);
        } else {
            throwNonFatalErrorConstEval(
                "only identifiers are currently supported as path expressions",
                ast.path.loc,
            );
        }
    }

    private interpretConditionStatement(ast: Ast.StatementCondition) {
        const condition = ensureBoolean(
            this.interpretExpressionInternal(ast.condition),
        );
        if (condition.value) {
            this.envStack.executeInNewEnvironment(() => {
                ast.trueStatements.forEach(
                    this.interpretStatementInternal,
                    this,
                );
            });
        } else if (ast.falseStatements !== undefined) {
            this.envStack.executeInNewEnvironment(() => {
                ast.falseStatements!.forEach(
                    this.interpretStatementInternal,
                    this,
                );
            });
        }
    }

    private interpretExpressionStatement(ast: Ast.StatementExpression) {
        this.interpretExpressionInternal(ast.expression);
    }

    private interpretForEachStatement(ast: Ast.StatementForEach) {
        throwNonFatalErrorConstEval("foreach currently not supported", ast.loc);
    }

    private interpretRepeatStatement(ast: Ast.StatementRepeat) {
        const iterations = ensureRepeatInt(
            this.interpretExpressionInternal(ast.iterations),
        );
        if (iterations.value > 0) {
            // We can create a single environment for all the iterations in the loop
            // (instead of a fresh environment for each iteration)
            // because the typechecker ensures that variables do not leak outside
            // the loop. Also, the language requires that all declared variables inside the
            // loop be initialized, which means that we can overwrite its value in the environment
            // in each iteration.
            this.envStack.executeInNewEnvironment(() => {
                for (let i = 1; i <= iterations.value; i++) {
                    ast.statements.forEach(
                        this.interpretStatementInternal,
                        this,
                    );
                }
            });
        }
    }

    private interpretReturnStatement(ast: Ast.StatementReturn) {
        if (ast.expression !== undefined) {
            const val = this.interpretExpressionInternal(ast.expression);
            throw new ReturnSignal(val);
        } else {
            throw new ReturnSignal();
        }
    }

    private interpretTryStatement(ast: Ast.StatementTry) {
        throwNonFatalErrorConstEval(
            "try statements currently not supported",
            ast.loc,
        );
    }

    private interpretUntilStatement(ast: Ast.StatementUntil) {
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
                ast.statements.forEach(this.interpretStatementInternal, this);

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
                    this.interpretExpressionInternal(ast.condition),
                );
            } while (!condition.value);
        });
    }

    private interpretWhileStatement(ast: Ast.StatementWhile) {
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
                    this.interpretExpressionInternal(ast.condition),
                );
                if (condition.value) {
                    ast.statements.forEach(
                        this.interpretStatementInternal,
                        this,
                    );

                    iterCount++;
                    if (iterCount >= this.config.maxLoopIterations) {
                        throwNonFatalErrorConstEval(
                            "loop timeout reached",
                            ast.loc,
                        );
                    }
                }
            } while (condition.value);
        });
    }

    private interpretBlockStatement(ast: Ast.StatementBlock) {
        this.envStack.executeInNewEnvironment(() => {
            ast.statements.forEach(this.interpretStatementInternal, this);
        });
    }

    private inComputationPath<T>(path: string, cb: () => T) {
        this.constantComputationPath.push(path);
        const res = cb();
        this.constantComputationPath.pop();
        return res;
    }

    private formatComputationPath(name: string): string {
        const start = this.constantComputationPath.indexOf(name);
        const path =
            start !== -1
                ? this.constantComputationPath.slice(start)
                : this.constantComputationPath;

        const shortPath =
            path.length > 10
                ? [...path.slice(0, 5), "...", ...path.slice(path.length - 4)]
                : path;

        return `${shortPath.join(" -> ")} -> ${name}`;
    }

    private handleStackOverflow<T>(loc: SrcInfo, code: () => T): T {
        try {
            return code();
        } catch (e) {
            const finalErrorMessage =
                "execution stack reached maximum allowed depth";
            if (e instanceof RangeError) {
                if (e.message.includes("stack size exceeded")) {
                    // Chrome, Safari, Edge, node.js
                    throwNonFatalErrorConstEval(finalErrorMessage, loc);
                }
            }
            if (e instanceof Error) {
                if (e.message.includes("too much recursion")) {
                    // Firefox
                    throwNonFatalErrorConstEval(finalErrorMessage, loc);
                }
            }

            throw e;
        }
    }
}
