import { Interval as RawInterval, Node as RawNode } from "ohm-js";
import { TypeOrigin } from "../types/types";

export class ASTRef {
    static merge(...refs: ASTRef[]) {
        if (refs.length === 0) {
            throw Error("Cannot merge 0 refs");
        }
        let r = refs[0].#interval;
        const file = refs[0].#file;
        for (let i = 1; i < refs.length; i++) {
            r = r.coverageWith(r, refs[i].#interval);
        }
        return new ASTRef(r, file);
    }

    readonly #interval: RawInterval;
    readonly #file: string | null;

    constructor(interval: RawInterval, file: string | null) {
        this.#interval = interval;
        this.#file = file;
    }

    get file() {
        return this.#file;
    }

    get contents() {
        return this.#interval.contents;
    }

    get interval() {
        return this.#interval;
    }
}

export type ASTPrimitive = {
    kind: "primitive";
    origin: TypeOrigin;
    id: number;
    name: string;
    ref: ASTRef;
};

//
// Values
//

export type ASTNumber = {
    kind: "number";
    id: number;
    value: bigint;
    ref: ASTRef;
};

export type ASTId = {
    kind: "id";
    id: number;
    value: string;
    ref: ASTRef;
};

export type ASTBoolean = {
    kind: "boolean";
    id: number;
    value: boolean;
    ref: ASTRef;
};

export type ASTString = {
    kind: "string";
    id: number;
    value: string;
    ref: ASTRef;
};

export type ASTNull = {
    kind: "null";
    id: number;
    ref: ASTRef;
};

export type ASTLvalueRef = {
    kind: "lvalue_ref";
    id: number;
    name: string;
    ref: ASTRef;
};

//
// Types
//

export type ASTTypeRefSimple = {
    kind: "type_ref_simple";
    id: number;
    name: string;
    optional: boolean;
    ref: ASTRef;
};

export type ASTTypeRefMap = {
    kind: "type_ref_map";
    id: number;
    key: string;
    keyAs: string | null;
    value: string;
    valueAs: string | null;
    ref: ASTRef;
};

export type ASTTypeRefBounced = {
    kind: "type_ref_bounced";
    id: number;
    name: string;
    ref: ASTRef;
};

export type ASTTypeRef = ASTTypeRefSimple | ASTTypeRefMap | ASTTypeRefBounced;

//
// Expressions
//

export type ASTBinaryOperation =
    | "+"
    | "-"
    | "*"
    | "/"
    | "!="
    | ">"
    | "<"
    | ">="
    | "<="
    | "=="
    | "&&"
    | "||"
    | "%"
    | "<<"
    | ">>"
    | "&"
    | "|"
    | "^";

export type ASTOpBinary = {
    kind: "op_binary";
    id: number;
    op: ASTBinaryOperation;
    left: ASTExpression;
    right: ASTExpression;
    ref: ASTRef;
};

export type ASTUnaryOperation = "+" | "-" | "!" | "!!" | "~";

export type ASTOpUnary = {
    kind: "op_unary";
    id: number;
    op: ASTUnaryOperation;
    right: ASTExpression;
    ref: ASTRef;
};

export type ASTOpField = {
    kind: "op_field";
    id: number;
    src: ASTExpression;
    name: string;
    ref: ASTRef;
};

export type ASTOpCall = {
    kind: "op_call";
    id: number;
    src: ASTExpression;
    name: string;
    args: ASTExpression[];
    ref: ASTRef;
};

export type ASTOpCallStatic = {
    kind: "op_static_call";
    id: number;
    name: string;
    args: ASTExpression[];
    ref: ASTRef;
};

export type ASTOpNew = {
    kind: "op_new";
    id: number;
    type: string;
    args: ASTNewParameter[];
    ref: ASTRef;
};

export type ASTNewParameter = {
    kind: "new_parameter";
    id: number;
    name: string;
    exp: ASTExpression;
    ref: ASTRef;
};

export type ASTInitOf = {
    kind: "init_of";
    id: number;
    name: string;
    args: ASTExpression[];
    ref: ASTRef;
};

export type ASTConditional = {
    kind: "conditional";
    id: number;
    condition: ASTExpression;
    thenBranch: ASTExpression;
    elseBranch: ASTExpression;
    ref: ASTRef;
};

//
// Program
//

export type ASTProgramEntry =
    | ASTStruct
    | ASTContract
    | ASTPrimitive
    | ASTFunction
    | ASTNativeFunction
    | ASTTrait
    | ASTProgramImport
    | ASTConstant;

export type ASTProgram = {
    kind: "program";
    id: number;
    entries: ASTProgramEntry[];
};

export type ASTProgramImport = {
    kind: "program_import";
    id: number;
    path: ASTString;
    ref: ASTRef;
};

export type ASTStruct = {
    kind: "def_struct";
    origin: TypeOrigin;
    id: number;
    name: string;
    message: boolean;
    prefix: number | null;
    fields: ASTField[];
    ref: ASTRef;
};

export type ASTTraitDeclaration =
    | ASTField
    | ASTFunction
    | ASTReceive
    | ASTConstant;

export type ASTTrait = {
    kind: "def_trait";
    origin: TypeOrigin;
    id: number;
    name: string;
    traits: ASTString[];
    attributes: ASTContractAttribute[];
    declarations: ASTTraitDeclaration[];
    ref: ASTRef;
};

export type ASTField = {
    kind: "def_field";
    id: number;
    name: string;
    type: ASTTypeRef;
    init: ASTExpression | null;
    as: string | null;
    ref: ASTRef;
};

export type ASTConstant = {
    kind: "def_constant";
    id: number;
    name: string;
    type: ASTTypeRef;
    value: ASTExpression | null;
    attributes: ASTConstantAttribute[];
    ref: ASTRef;
};

export type ASTConstantAttribute =
    | { type: "virtual"; ref: ASTRef }
    | { type: "overrides"; ref: ASTRef }
    | { type: "abstract"; ref: ASTRef };

export type ASTContractAttribute = {
    type: "interface";
    name: ASTString;
    ref: ASTRef;
};

export type ASTContractDeclaration =
    | ASTField
    | ASTFunction
    | ASTInitFunction
    | ASTReceive
    | ASTConstant;

export type ASTContract = {
    kind: "def_contract";
    origin: TypeOrigin;
    id: number;
    name: string;
    traits: ASTString[];
    attributes: ASTContractAttribute[];
    declarations: ASTContractDeclaration[];
    ref: ASTRef;
};

export type ASTArgument = {
    kind: "def_argument";
    id: number;
    name: string;
    type: ASTTypeRef;
    ref: ASTRef;
};

export type ASTFunctionAttribute =
    | { type: "get"; ref: ASTRef }
    | { type: "mutates"; ref: ASTRef }
    | { type: "extends"; ref: ASTRef }
    | { type: "virtual"; ref: ASTRef }
    | { type: "abstract"; ref: ASTRef }
    | { type: "overrides"; ref: ASTRef }
    | { type: "inline"; ref: ASTRef };

export type ASTFunction = {
    kind: "def_function";
    origin: TypeOrigin;
    id: number;
    attributes: ASTFunctionAttribute[];
    name: string;
    return: ASTTypeRef | null;
    args: ASTArgument[];
    statements: ASTStatement[] | null;
    ref: ASTRef;
};

export type ASTReceiveType =
    | {
          kind: "internal-simple";
          arg: ASTArgument;
      }
    | {
          kind: "internal-fallback";
      }
    | {
          kind: "internal-comment";
          comment: ASTString;
      }
    | {
          kind: "bounce";
          arg: ASTArgument;
      }
    | {
          kind: "external-simple";
          arg: ASTArgument;
      }
    | {
          kind: "external-fallback";
      }
    | {
          kind: "external-comment";
          comment: ASTString;
      };

export type ASTReceive = {
    kind: "def_receive";
    id: number;
    selector: ASTReceiveType;
    statements: ASTStatement[];
    ref: ASTRef;
};

export type ASTNativeFunction = {
    kind: "def_native_function";
    origin: TypeOrigin;
    id: number;
    attributes: ASTFunctionAttribute[];
    name: string;
    nativeName: string;
    return: ASTTypeRef | null;
    args: ASTArgument[];
    ref: ASTRef;
};

export type ASTInitFunction = {
    kind: "def_init_function";
    id: number;
    args: ASTArgument[];
    statements: ASTStatement[];
    ref: ASTRef;
};

//
// Statements
//

export type ASTStatementLet = {
    kind: "statement_let";
    id: number;
    name: string;
    type: ASTTypeRef | null;
    expression: ASTExpression;
    ref: ASTRef;
};

export type ASTStatementReturn = {
    kind: "statement_return";
    id: number;
    expression: ASTExpression | null;
    ref: ASTRef;
};

export type ASTStatementExpression = {
    kind: "statement_expression";
    id: number;
    expression: ASTExpression;
    ref: ASTRef;
};

export type ASTStatementAssign = {
    kind: "statement_assign";
    id: number;
    path: ASTLvalueRef[];
    expression: ASTExpression;
    ref: ASTRef;
};

export type ASTAugmentedAssignOperation =
    | "+"
    | "-"
    | "*"
    | "/"
    | "%"
    | "|"
    | "&"
    | "^";

export type ASTStatementAugmentedAssign = {
    kind: "statement_augmentedassign";
    id: number;
    op: ASTAugmentedAssignOperation;
    path: ASTLvalueRef[];
    expression: ASTExpression;
    ref: ASTRef;
};

export type ASTCondition = {
    kind: "statement_condition";
    id: number;
    expression: ASTExpression;
    trueStatements: ASTStatement[];
    falseStatements: ASTStatement[] | null;
    elseif: ASTCondition | null;
    ref: ASTRef;
};

export type ASTStatementWhile = {
    kind: "statement_while";
    id: number;
    condition: ASTExpression;
    statements: ASTStatement[];
    ref: ASTRef;
};

export type ASTStatementUntil = {
    kind: "statement_until";
    id: number;
    condition: ASTExpression;
    statements: ASTStatement[];
    ref: ASTRef;
};

export type ASTStatementRepeat = {
    kind: "statement_repeat";
    id: number;
    iterations: ASTExpression;
    statements: ASTStatement[];
    ref: ASTRef;
};

export type ASTStatementTry = {
    kind: "statement_try";
    id: number;
    statements: ASTStatement[];
    ref: ASTRef;
};

export type ASTStatementTryCatch = {
    kind: "statement_try_catch";
    id: number;
    statements: ASTStatement[];
    catchName: string;
    catchStatements: ASTStatement[];
    ref: ASTRef;
};

export type ASTStatementForEach = {
    kind: "statement_foreach";
    id: number;
    keyName: string;
    valueName: string;
    map: ASTLvalueRef[];
    statements: ASTStatement[];
    ref: ASTRef;
};

//
// Unions
//

export type ASTStatement =
    | ASTStatementLet
    | ASTStatementReturn
    | ASTStatementExpression
    | ASTStatementAssign
    | ASTStatementAugmentedAssign
    | ASTCondition
    | ASTStatementWhile
    | ASTStatementUntil
    | ASTStatementRepeat
    | ASTStatementTry
    | ASTStatementTryCatch
    | ASTStatementForEach;
export type ASTNode =
    | ASTExpression
    | ASTStruct
    | ASTField
    | ASTContract
    | ASTArgument
    | ASTFunction
    | ASTOpCall
    | ASTStatementLet
    | ASTStatementReturn
    | ASTProgram
    | ASTPrimitive
    | ASTOpCallStatic
    | ASTStatementExpression
    | ASTNativeFunction
    | ASTStatementAssign
    | ASTStatementAugmentedAssign
    | ASTOpNew
    | ASTNewParameter
    | ASTTypeRef
    | ASTNull
    | ASTCondition
    | ASTInitFunction
    | ASTStatementWhile
    | ASTStatementUntil
    | ASTStatementRepeat
    | ASTStatementTry
    | ASTStatementTryCatch
    | ASTStatementForEach
    | ASTReceive
    | ASTLvalueRef
    | ASTString
    | ASTTrait
    | ASTProgramImport
    | ASTInitOf
    | ASTConstant;
export type ASTExpression =
    | ASTOpBinary
    | ASTOpUnary
    | ASTOpField
    | ASTNumber
    | ASTId
    | ASTBoolean
    | ASTOpCall
    | ASTOpCallStatic
    | ASTOpNew
    | ASTNull
    | ASTLvalueRef
    | ASTInitOf
    | ASTString
    | ASTConditional;
export type ASTType = ASTPrimitive | ASTStruct | ASTContract | ASTTrait;

// eslint-disable-next-line @typescript-eslint/no-explicit-any
type DistributiveOmit<T, K extends keyof any> = T extends any
    ? Omit<T, K>
    : never;
let nextId = 1;
export function createNode(src: DistributiveOmit<ASTNode, "id">): ASTNode {
    return Object.freeze(Object.assign({ id: nextId++ }, src));
}
export function cloneASTNode<T extends ASTNode>(src: T): T {
    return { ...src, id: nextId++ };
}

export function __DANGER_resetNodeId() {
    nextId = 1;
}

let currentFile: string | null = null;

export function inFile<T>(path: string, callback: () => T) {
    currentFile = path;
    const r = callback();
    currentFile = null;
    return r;
}

export function createRef(s: RawNode, ...extra: RawNode[]): ASTRef {
    let i = s.source;
    if (extra.length > 0) {
        i = i.coverageWith(...extra.map((e) => e.source));
    }
    return new ASTRef(i, currentFile);
}

export function traverse(node: ASTNode, callback: (node: ASTNode) => void) {
    callback(node);

    //
    // Program
    //

    if (node.kind === "program") {
        for (const e of node.entries) {
            traverse(e, callback);
        }
    }
    if (node.kind === "def_contract") {
        for (const e of node.declarations) {
            traverse(e, callback);
        }
    }
    if (node.kind === "def_struct") {
        for (const e of node.fields) {
            traverse(e, callback);
        }
    }
    if (node.kind === "def_trait") {
        for (const e of node.declarations) {
            traverse(e, callback);
        }
    }

    //
    // Functions
    //

    if (node.kind === "def_function") {
        for (const e of node.args) {
            traverse(e, callback);
        }
        if (node.statements) {
            for (const e of node.statements) {
                traverse(e, callback);
            }
        }
    }
    if (node.kind === "def_init_function") {
        for (const e of node.args) {
            traverse(e, callback);
        }
        for (const e of node.statements) {
            traverse(e, callback);
        }
    }
    if (node.kind === "def_receive") {
        for (const e of node.statements) {
            traverse(e, callback);
        }
    }
    if (node.kind === "def_native_function") {
        for (const e of node.args) {
            traverse(e, callback);
        }
    }
    if (node.kind === "def_field") {
        if (node.init) {
            traverse(node.init, callback);
        }
    }
    if (node.kind === "def_constant") {
        if (node.value) {
            traverse(node.value, callback);
        }
    }

    //
    // Statements
    //

    if (node.kind === "statement_let") {
        traverse(node.expression, callback);
    }
    if (node.kind === "statement_return") {
        if (node.expression) {
            traverse(node.expression, callback);
        }
    }
    if (node.kind === "statement_expression") {
        traverse(node.expression, callback);
    }
    if (node.kind === "statement_assign") {
        for (const e of node.path) {
            traverse(e, callback);
        }
        traverse(node.expression, callback);
    }
    if (node.kind === "statement_augmentedassign") {
        for (const e of node.path) {
            traverse(e, callback);
        }
        traverse(node.expression, callback);
    }
    if (node.kind === "statement_condition") {
        traverse(node.expression, callback);
        for (const e of node.trueStatements) {
            traverse(e, callback);
        }
        if (node.falseStatements) {
            for (const e of node.falseStatements) {
                traverse(e, callback);
            }
        }
        if (node.elseif) {
            traverse(node.elseif, callback);
        }
    }
    if (node.kind === "statement_while") {
        traverse(node.condition, callback);
        for (const e of node.statements) {
            traverse(e, callback);
        }
    }
    if (node.kind === "statement_until") {
        traverse(node.condition, callback);
        for (const e of node.statements) {
            traverse(e, callback);
        }
    }
    if (node.kind === "statement_repeat") {
        traverse(node.iterations, callback);
        for (const e of node.statements) {
            traverse(e, callback);
        }
    }
    if (node.kind === "statement_try") {
        for (const e of node.statements) {
            traverse(e, callback);
        }
    }
    if (node.kind === "statement_try_catch") {
        for (const e of node.statements) {
            traverse(e, callback);
        }
        for (const e of node.catchStatements) {
            traverse(e, callback);
        }
    }
    if (node.kind === "statement_foreach") {
        for (const e of node.statements) {
            traverse(e, callback);
        }
    }
    if (node.kind === "op_binary") {
        traverse(node.left, callback);
        traverse(node.right, callback);
    }
    if (node.kind === "op_unary") {
        traverse(node.right, callback);
    }
    if (node.kind === "op_field") {
        traverse(node.src, callback);
    }
    if (node.kind === "op_call") {
        traverse(node.src, callback);
        for (const e of node.args) {
            traverse(e, callback);
        }
    }
    if (node.kind === "op_static_call") {
        for (const e of node.args) {
            traverse(e, callback);
        }
    }
    if (node.kind === "op_new") {
        for (const e of node.args) {
            traverse(e, callback);
        }
    }
    if (node.kind === "new_parameter") {
        traverse(node.exp, callback);
    }
    if (node.kind === "conditional") {
        traverse(node.condition, callback);
        traverse(node.thenBranch, callback);
        traverse(node.elseBranch, callback);
    }
}
