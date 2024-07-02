import { dummySrcInfo, SrcInfo } from "./grammar";

export type AstModule = {
    kind: "module";
    imports: AstImport[];
    items: AstModuleItem[];
    id: number;
};

export type AstImport = {
    kind: "import";
    path: ASTString;
    id: number;
    loc: SrcInfo;
};

export type AstModuleItem =
    | AstPrimitiveTypeDecl
    | AstFunctionDef
    | AstNativeFunctionDecl
    | AstConstantDef
    | AstStructDecl
    | AstMessageDecl
    | AstContract
    | AstTrait;

export type AstPrimitiveTypeDecl = {
    kind: "primitive_type_decl";
    name: AstId;
    id: number;
    loc: SrcInfo;
};

export type AstFunctionDef = {
    kind: "function_def";
    attributes: ASTFunctionAttribute[];
    name: AstId;
    return: ASTTypeRef | null;
    params: AstTypedParameter[];
    statements: ASTStatement[];
    id: number;
    loc: SrcInfo;
};

export type AstFunctionDecl = {
    kind: "function_decl";
    attributes: ASTFunctionAttribute[];
    name: AstId;
    return: ASTTypeRef | null;
    params: AstTypedParameter[];
    id: number;
    loc: SrcInfo;
};

export type AstNativeFunctionDecl = {
    kind: "native_function_decl";
    attributes: ASTFunctionAttribute[];
    name: AstId;
    nativeName: AstFuncId;
    params: AstTypedParameter[];
    return: ASTTypeRef | null;
    id: number;
    loc: SrcInfo;
};

export type AstConstantDef = {
    kind: "constant_def";
    attributes: ASTConstantAttribute[];
    name: AstId;
    type: ASTTypeRef;
    initializer: ASTExpression;
    id: number;
    loc: SrcInfo;
};

export type AstConstantDecl = {
    kind: "constant_decl";
    attributes: ASTConstantAttribute[];
    name: AstId;
    type: ASTTypeRef;
    id: number;
    loc: SrcInfo;
};

export type AstStructDecl = {
    kind: "struct_decl";
    name: AstId;
    fields: ASTField[];
    id: number;
    loc: SrcInfo;
};

export type AstMessageDecl = {
    kind: "message_decl";
    name: AstId;
    opcode: number | null;
    fields: ASTField[];
    id: number;
    loc: SrcInfo;
};

export type AstContract = {
    kind: "contract";
    name: AstId;
    traits: AstId[];
    attributes: ASTContractAttribute[];
    declarations: ASTContractDeclaration[];
    id: number;
    loc: SrcInfo;
};

export type AstTrait = {
    kind: "trait";
    name: AstId;
    traits: AstId[];
    attributes: ASTContractAttribute[];
    declarations: ASTTraitDeclaration[];
    id: number;
    loc: SrcInfo;
};

export type AstId = {
    kind: "id";
    text: string;
    id: number;
    loc: SrcInfo;
};

export type AstFuncId = {
    kind: "func_id";
    text: string;
    id: number;
    loc: SrcInfo;
};

export function idText(ident: AstFuncId): string;
export function idText(ident: AstId): string;
export function idText(ident: AstId | AstFuncId): string {
    return ident.text;
}

export function isInt(ident: AstId): boolean {
    return ident.text === "Int";
}

export function isBool(ident: AstId): boolean {
    return ident.text === "Bool";
}

export function isCell(ident: AstId): boolean {
    return ident.text === "Cell";
}

export function isSlice(ident: AstId): boolean {
    return ident.text === "Slice";
}

export function isBuilder(ident: AstId): boolean {
    return ident.text === "Builder";
}

export function isAddress(ident: AstId): boolean {
    return ident.text === "Address";
}

export function isString(ident: AstId): boolean {
    return ident.text === "String";
}

export function isStringBuilder(ident: AstId): boolean {
    return ident.text === "StringBuilder";
}

export function isSelfId(ident: AstId): boolean {
    return ident.text === "self";
}

export function isWildcard(ident: AstId): boolean {
    return ident.text === "_";
}

export function isRequire(ident: AstId): boolean {
    return ident.text === "require";
}

export function eqNames(left: string, right: string): boolean;
export function eqNames(left: string, right: AstId): boolean;
export function eqNames(left: AstId, right: string): boolean;
export function eqNames(left: AstId, right: AstId): boolean;
export function eqNames(left: AstId | string, right: AstId | string): boolean {
    if (typeof left === "string") {
        if (typeof right === "string") {
            return left === right;
        }
        return left === right.text;
    } else {
        if (typeof right === "string") {
            return left.text === right;
        }
        return left.text === right.text;
    }
}

export const selfId: AstId = {
    kind: "id",
    text: "self",
    id: 0,
    loc: dummySrcInfo,
};

export type ASTNumber = {
    kind: "number";
    id: number;
    value: bigint;
    loc: SrcInfo;
};

export type ASTBoolean = {
    kind: "boolean";
    id: number;
    value: boolean;
    loc: SrcInfo;
};

export type ASTString = {
    kind: "string";
    id: number;
    value: string;
    loc: SrcInfo;
};

export type ASTNull = {
    kind: "null";
    id: number;
    loc: SrcInfo;
};

//
// Types
//

export type ASTTypeRefSimple = {
    kind: "type_ref_simple";
    id: number;
    name: AstId;
    optional: boolean;
    loc: SrcInfo;
};

export type ASTTypeRefMap = {
    kind: "type_ref_map";
    id: number;
    key: AstId;
    keyAs: AstId | null;
    value: AstId;
    valueAs: AstId | null;
    loc: SrcInfo;
};

export type ASTTypeRefBounced = {
    kind: "type_ref_bounced";
    id: number;
    name: AstId;
    loc: SrcInfo;
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
    loc: SrcInfo;
};

export type ASTUnaryOperation = "+" | "-" | "!" | "!!" | "~";

export type ASTOpUnary = {
    kind: "op_unary";
    id: number;
    op: ASTUnaryOperation;
    right: ASTExpression;
    loc: SrcInfo;
};

export type ASTOpField = {
    kind: "op_field";
    id: number;
    src: ASTExpression;
    name: AstId;
    loc: SrcInfo;
};

export type ASTOpCall = {
    kind: "op_call";
    id: number;
    src: ASTExpression;
    name: AstId;
    args: ASTExpression[];
    loc: SrcInfo;
};

export type ASTOpCallStatic = {
    kind: "op_static_call";
    id: number;
    name: AstId;
    args: ASTExpression[];
    loc: SrcInfo;
};

export type ASTOpNew = {
    kind: "op_new";
    id: number;
    type: AstId;
    args: ASTNewParameter[];
    loc: SrcInfo;
};

export type ASTNewParameter = {
    kind: "new_parameter";
    id: number;
    name: AstId;
    exp: ASTExpression;
    loc: SrcInfo;
};

export type ASTInitOf = {
    kind: "init_of";
    id: number;
    name: AstId;
    args: ASTExpression[];
    loc: SrcInfo;
};

export type ASTConditional = {
    kind: "conditional";
    id: number;
    condition: ASTExpression;
    thenBranch: ASTExpression;
    elseBranch: ASTExpression;
    loc: SrcInfo;
};

export type ASTTraitDeclaration =
    | ASTField
    | AstFunctionDef
    | AstFunctionDecl
    | ASTReceive
    | AstConstantDef
    | AstConstantDecl;

export type ASTField = {
    kind: "def_field";
    id: number;
    name: AstId;
    type: ASTTypeRef;
    init: ASTExpression | null;
    as: AstId | null;
    loc: SrcInfo;
};

export type ASTConstantAttribute =
    | { type: "virtual"; loc: SrcInfo }
    | { type: "overrides"; loc: SrcInfo }
    | { type: "abstract"; loc: SrcInfo };

export type ASTContractAttribute = {
    type: "interface";
    name: ASTString;
    loc: SrcInfo;
};

export type ASTContractDeclaration =
    | ASTField
    | AstFunctionDef
    | ASTInitFunction
    | ASTReceive
    | AstConstantDef;

export type AstTypedParameter = {
    kind: "typed_parameter";
    id: number;
    name: AstId;
    type: ASTTypeRef;
    loc: SrcInfo;
};

export type ASTFunctionAttribute =
    | { type: "get"; loc: SrcInfo }
    | { type: "mutates"; loc: SrcInfo }
    | { type: "extends"; loc: SrcInfo }
    | { type: "virtual"; loc: SrcInfo }
    | { type: "abstract"; loc: SrcInfo }
    | { type: "overrides"; loc: SrcInfo }
    | { type: "inline"; loc: SrcInfo };

export type ASTReceiveType =
    | {
          kind: "internal-simple";
          param: AstTypedParameter;
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
          param: AstTypedParameter;
      }
    | {
          kind: "external-simple";
          param: AstTypedParameter;
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
    loc: SrcInfo;
};

export type ASTInitFunction = {
    kind: "def_init_function";
    id: number;
    params: AstTypedParameter[];
    statements: ASTStatement[];
    loc: SrcInfo;
};

//
// Statements
//

export type ASTStatementLet = {
    kind: "statement_let";
    id: number;
    name: AstId;
    type: ASTTypeRef | null;
    expression: ASTExpression;
    loc: SrcInfo;
};

export type ASTStatementReturn = {
    kind: "statement_return";
    id: number;
    expression: ASTExpression | null;
    loc: SrcInfo;
};

export type ASTStatementExpression = {
    kind: "statement_expression";
    id: number;
    expression: ASTExpression;
    loc: SrcInfo;
};

export type ASTStatementAssign = {
    kind: "statement_assign";
    id: number;
    path: ASTExpression;
    expression: ASTExpression;
    loc: SrcInfo;
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
    path: ASTExpression;
    expression: ASTExpression;
    loc: SrcInfo;
};

export type ASTCondition = {
    kind: "statement_condition";
    id: number;
    expression: ASTExpression;
    trueStatements: ASTStatement[];
    falseStatements: ASTStatement[] | null;
    elseif: ASTCondition | null;
    loc: SrcInfo;
};

export type ASTStatementWhile = {
    kind: "statement_while";
    id: number;
    condition: ASTExpression;
    statements: ASTStatement[];
    loc: SrcInfo;
};

export type ASTStatementUntil = {
    kind: "statement_until";
    id: number;
    condition: ASTExpression;
    statements: ASTStatement[];
    loc: SrcInfo;
};

export type ASTStatementRepeat = {
    kind: "statement_repeat";
    id: number;
    iterations: ASTExpression;
    statements: ASTStatement[];
    loc: SrcInfo;
};

export type ASTStatementTry = {
    kind: "statement_try";
    id: number;
    statements: ASTStatement[];
    loc: SrcInfo;
};

export type ASTStatementTryCatch = {
    kind: "statement_try_catch";
    id: number;
    statements: ASTStatement[];
    catchName: AstId;
    catchStatements: ASTStatement[];
    loc: SrcInfo;
};

export type ASTStatementForEach = {
    kind: "statement_foreach";
    id: number;
    keyName: AstId;
    valueName: AstId;
    map: ASTExpression;
    statements: ASTStatement[];
    loc: SrcInfo;
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
    | AstFuncId
    | ASTExpression
    | ASTStatement
    | AstStructDecl
    | AstMessageDecl
    | ASTField
    | AstContract
    | AstTypedParameter
    | AstFunctionDef
    | AstFunctionDecl
    | ASTOpCall
    | AstModule
    | AstPrimitiveTypeDecl
    | ASTOpCallStatic
    | AstNativeFunctionDecl
    | ASTNewParameter
    | ASTTypeRef
    | ASTInitFunction
    | ASTReceive
    | AstTrait
    | AstImport
    | AstConstantDef
    | AstConstantDecl;
export type ASTExpression =
    | ASTOpBinary
    | ASTOpUnary
    | ASTOpField
    | ASTNumber
    | AstId
    | ASTBoolean
    | ASTOpCall
    | ASTOpCallStatic
    | ASTOpNew
    | ASTNull
    | ASTInitOf
    | ASTString
    | ASTConditional;
export type ASTType =
    | AstPrimitiveTypeDecl
    | AstStructDecl
    | AstMessageDecl
    | AstContract
    | AstTrait;

/**
 * Check if input expression is a 'path expression',
 * i.e. an identifier or a sequence of field accesses starting from an identifier.
 * @param path A path expression to check.
 * @returns An array of identifiers or null if the input expression is not a path expression.
 */
export function tryExtractPath(path: ASTExpression): AstId[] | null {
    switch (path.kind) {
        case "id":
            return [path];
        case "op_field": {
            const p = tryExtractPath(path.src);
            return p ? [...p, path.name] : null;
        }
        default:
            return null;
    }
}

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

export function traverse(node: ASTNode, callback: (node: ASTNode) => void) {
    callback(node);

    if (node.kind === "module") {
        for (const e of node.items) {
            traverse(e, callback);
        }
    }
    if (node.kind === "contract") {
        for (const e of node.declarations) {
            traverse(e, callback);
        }
    }
    if (node.kind === "struct_decl") {
        for (const e of node.fields) {
            traverse(e, callback);
        }
    }
    if (node.kind === "message_decl") {
        for (const e of node.fields) {
            traverse(e, callback);
        }
    }
    if (node.kind === "trait") {
        for (const e of node.declarations) {
            traverse(e, callback);
        }
    }

    //
    // Functions
    //

    if (node.kind === "function_def") {
        for (const e of node.params) {
            traverse(e, callback);
        }
        for (const e of node.statements) {
            traverse(e, callback);
        }
    }
    if (node.kind === "function_decl") {
        for (const e of node.params) {
            traverse(e, callback);
        }
    }
    if (node.kind === "def_init_function") {
        for (const e of node.params) {
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
    if (node.kind === "native_function_decl") {
        for (const e of node.params) {
            traverse(e, callback);
        }
    }
    if (node.kind === "def_field") {
        if (node.init) {
            traverse(node.init, callback);
        }
    }
    if (node.kind === "constant_def") {
        traverse(node.initializer, callback);
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
        traverse(node.path, callback);
        traverse(node.expression, callback);
    }
    if (node.kind === "statement_augmentedassign") {
        traverse(node.path, callback);
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
export { SrcInfo };
