import { Address, Cell, Slice } from "@ton/core";
import { throwInternalCompilerError } from "../error/errors";
import { dummySrcInfo, SrcInfo } from "../grammar/src-info";

export type AstModule = {
    kind: "module";
    imports: AstImport[];
    items: AstModuleItem[];
    id: number;
};

export type AstImport = {
    kind: "import";
    path: AstString;
    id: number;
    loc: SrcInfo;
};

export type AstModuleItem =
    | AstPrimitiveTypeDecl
    | AstFunctionDef
    | AstAsmFunctionDef
    | AstNativeFunctionDecl
    | AstConstantDef
    | AstStructDecl
    | AstMessageDecl
    | AstContract
    | AstTrait;

export type AstTypeDecl =
    | AstPrimitiveTypeDecl
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
    attributes: AstFunctionAttribute[];
    name: AstId;
    return: AstType | null;
    params: AstTypedParameter[];
    statements: AstStatement[];
    id: number;
    loc: SrcInfo;
};

export type AstAsmFunctionDef = {
    kind: "asm_function_def";
    shuffle: AstAsmShuffle;
    attributes: AstFunctionAttribute[];
    name: AstId;
    return: AstType | null;
    params: AstTypedParameter[];
    instructions: AstAsmInstruction[];
    id: number;
    loc: SrcInfo;
};

export type AstAsmInstruction = string;
export type AstAsmShuffle = {
    args: AstId[];
    ret: AstNumber[];
};

export type AstFunctionDecl = {
    kind: "function_decl";
    attributes: AstFunctionAttribute[];
    name: AstId;
    return: AstType | null;
    params: AstTypedParameter[];
    id: number;
    loc: SrcInfo;
};

export type AstNativeFunctionDecl = {
    kind: "native_function_decl";
    attributes: AstFunctionAttribute[];
    name: AstId;
    nativeName: AstFuncId;
    params: AstTypedParameter[];
    return: AstType | null;
    id: number;
    loc: SrcInfo;
};

export type AstConstantDef = {
    kind: "constant_def";
    attributes: AstConstantAttribute[];
    name: AstId;
    type: AstType;
    initializer: AstExpression;
    id: number;
    loc: SrcInfo;
};

export type AstConstantDecl = {
    kind: "constant_decl";
    attributes: AstConstantAttribute[];
    name: AstId;
    type: AstType;
    id: number;
    loc: SrcInfo;
};

export type AstStructDecl = {
    kind: "struct_decl";
    name: AstId;
    fields: AstFieldDecl[];
    id: number;
    loc: SrcInfo;
};

export type AstMessageDecl = {
    kind: "message_decl";
    name: AstId;
    opcode: AstExpression | null;
    fields: AstFieldDecl[];
    id: number;
    loc: SrcInfo;
};

export type AstContract = {
    kind: "contract";
    name: AstId;
    traits: AstId[];
    attributes: AstContractAttribute[];
    declarations: AstContractDeclaration[];
    id: number;
    loc: SrcInfo;
};

export type AstTrait = {
    kind: "trait";
    name: AstId;
    traits: AstId[];
    attributes: AstContractAttribute[];
    declarations: AstTraitDeclaration[];
    id: number;
    loc: SrcInfo;
};

export type AstContractDeclaration =
    | AstFieldDecl
    | AstFunctionDef
    | AstAsmFunctionDef
    | AstContractInit
    | AstReceiver
    | AstConstantDef;

export type AstTraitDeclaration =
    | AstFieldDecl
    | AstFunctionDef
    | AstAsmFunctionDef
    | AstFunctionDecl
    | AstReceiver
    | AstConstantDef
    | AstConstantDecl;

export type AstFieldDecl = {
    kind: "field_decl";
    name: AstId;
    type: AstType;
    initializer: AstExpression | null;
    as: AstId | null;
    id: number;
    loc: SrcInfo;
};

export type AstReceiver = {
    kind: "receiver";
    selector: AstReceiverKind;
    statements: AstStatement[];
    id: number;
    loc: SrcInfo;
};

export type AstContractInit = {
    kind: "contract_init";
    params: AstTypedParameter[];
    statements: AstStatement[];
    id: number;
    loc: SrcInfo;
};

//
// Statements
//

export type AstStatement =
    | AstStatementLet
    | AstStatementReturn
    | AstStatementExpression
    | AstStatementAssign
    | AstStatementAugmentedAssign
    | AstCondition
    | AstStatementWhile
    | AstStatementUntil
    | AstStatementRepeat
    | AstStatementTry
    | AstStatementTryCatch
    | AstStatementForEach
    | AstStatementDestruct
    | AstStatementBlock;

export type AstStatementLet = {
    kind: "statement_let";
    name: AstId;
    type: AstType | null;
    expression: AstExpression;
    id: number;
    loc: SrcInfo;
};

export type AstStatementReturn = {
    kind: "statement_return";
    expression: AstExpression | null;
    id: number;
    loc: SrcInfo;
};

export type AstStatementExpression = {
    kind: "statement_expression";
    expression: AstExpression;
    id: number;
    loc: SrcInfo;
};

export type AstStatementAssign = {
    kind: "statement_assign";
    path: AstExpression; // left-hand side of `=`
    expression: AstExpression;
    id: number;
    loc: SrcInfo;
};

export type AstAugmentedAssignOperation =
    | "+"
    | "-"
    | "*"
    | "/"
    | "&&"
    | "||"
    | "%"
    | "|"
    | "<<"
    | ">>"
    | "&"
    | "^";

export type AstStatementAugmentedAssign = {
    kind: "statement_augmentedassign";
    op: AstAugmentedAssignOperation;
    path: AstExpression;
    expression: AstExpression;
    id: number;
    loc: SrcInfo;
};

export type AstCondition = {
    kind: "statement_condition";
    condition: AstExpression;
    trueStatements: AstStatement[];
    falseStatements: AstStatement[] | null;
    elseif: AstCondition | null;
    id: number;
    loc: SrcInfo;
};

export type AstStatementWhile = {
    kind: "statement_while";
    condition: AstExpression;
    statements: AstStatement[];
    id: number;
    loc: SrcInfo;
};

export type AstStatementUntil = {
    kind: "statement_until";
    condition: AstExpression;
    statements: AstStatement[];
    id: number;
    loc: SrcInfo;
};

export type AstStatementRepeat = {
    kind: "statement_repeat";
    iterations: AstExpression;
    statements: AstStatement[];
    id: number;
    loc: SrcInfo;
};

export type AstStatementTry = {
    kind: "statement_try";
    statements: AstStatement[];
    id: number;
    loc: SrcInfo;
};

export type AstStatementTryCatch = {
    kind: "statement_try_catch";
    statements: AstStatement[];
    catchName: AstId;
    catchStatements: AstStatement[];
    id: number;
    loc: SrcInfo;
};

export type AstStatementForEach = {
    kind: "statement_foreach";
    keyName: AstId;
    valueName: AstId;
    map: AstExpression;
    statements: AstStatement[];
    id: number;
    loc: SrcInfo;
};

export type AstStatementDestruct = {
    kind: "statement_destruct";
    type: AstTypeId;
    /** field name -> [field id, local id] */
    identifiers: Map<string, [AstId, AstId]>;
    ignoreUnspecifiedFields: boolean;
    expression: AstExpression;
    id: number;
    loc: SrcInfo;
};

export type AstStatementBlock = {
    kind: "statement_block";
    statements: AstStatement[];
    id: number;
    loc: SrcInfo;
};

//
// Types
//

export type AstType =
    | AstTypeId
    | AstOptionalType
    | AstMapType
    | AstBouncedMessageType;

export type AstTypeId = {
    kind: "type_id";
    text: string;
    id: number;
    loc: SrcInfo;
};

export type AstOptionalType = {
    kind: "optional_type";
    typeArg: AstType;
    id: number;
    loc: SrcInfo;
};

export type AstMapType = {
    kind: "map_type";
    keyType: AstTypeId;
    keyStorageType: AstId | null;
    valueType: AstTypeId;
    valueStorageType: AstId | null;
    id: number;
    loc: SrcInfo;
};

export type AstBouncedMessageType = {
    kind: "bounced_message_type";
    messageType: AstTypeId;
    id: number;
    loc: SrcInfo;
};

//
// Expressions
//

export type AstExpression =
    | AstOpBinary
    | AstOpUnary
    | AstConditional
    | AstMethodCall
    | AstFieldAccess
    | AstStaticCall
    | AstStructInstance
    | AstId
    | AstInitOf
    | AstString
    | AstLiteral;

export type AstLiteral =
    | AstNumber
    | AstBoolean
    | AstNull
    | AstSimplifiedString
    | AstAddress
    | AstCell
    | AstSlice
    | AstCommentValue
    | AstStructValue;

export type AstBinaryOperation =
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

export type AstOpBinary = {
    kind: "op_binary";
    op: AstBinaryOperation;
    left: AstExpression;
    right: AstExpression;
    id: number;
    loc: SrcInfo;
};

export type AstUnaryOperation = "+" | "-" | "!" | "!!" | "~";

export type AstOpUnary = {
    kind: "op_unary";
    op: AstUnaryOperation;
    operand: AstExpression;
    id: number;
    loc: SrcInfo;
};

export type AstFieldAccess = {
    kind: "field_access";
    aggregate: AstExpression; // contract, trait, struct, message
    field: AstId;
    id: number;
    loc: SrcInfo;
};

export type AstMethodCall = {
    kind: "method_call";
    self: AstExpression; // anything with a method
    method: AstId;
    args: AstExpression[];
    id: number;
    loc: SrcInfo;
};

// builtins or top-level (module) functions
export type AstStaticCall = {
    kind: "static_call";
    function: AstId;
    args: AstExpression[];
    id: number;
    loc: SrcInfo;
};

export type AstStructInstance = {
    kind: "struct_instance";
    type: AstId;
    args: AstStructFieldInitializer[];
    id: number;
    loc: SrcInfo;
};

export type AstStructFieldInitializer = {
    kind: "struct_field_initializer";
    field: AstId;
    initializer: AstExpression;
    id: number;
    loc: SrcInfo;
};

export type AstInitOf = {
    kind: "init_of";
    contract: AstId;
    args: AstExpression[];
    id: number;
    loc: SrcInfo;
};

export type AstConditional = {
    kind: "conditional";
    condition: AstExpression;
    thenBranch: AstExpression;
    elseBranch: AstExpression;
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

export function idText(ident: AstId | AstFuncId | AstTypeId): string {
    return ident.text;
}

export function isInt(ident: AstTypeId): boolean {
    return ident.text === "Int";
}

export function isBool(ident: AstTypeId): boolean {
    return ident.text === "Bool";
}

export function isCell(ident: AstTypeId): boolean {
    return ident.text === "Cell";
}

export function isSlice(ident: AstTypeId): boolean {
    return ident.text === "Slice";
}

export function isBuilder(ident: AstTypeId): boolean {
    return ident.text === "Builder";
}

export function isAddress(ident: AstTypeId): boolean {
    return ident.text === "Address";
}

export function isString(ident: AstTypeId): boolean {
    return ident.text === "String";
}

export function isStringBuilder(ident: AstTypeId): boolean {
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

export function eqNames(
    left: AstId | AstTypeId | string,
    right: AstId | AstTypeId | string,
): boolean {
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

export function idOfText(text: string): AstId {
    return {
        kind: "id",
        text,
        id: 0,
        loc: dummySrcInfo,
    };
}

export const selfId: AstId = {
    kind: "id",
    text: "self",
    id: 0,
    loc: dummySrcInfo,
};

export type AstDestructMapping = {
    kind: "destruct_mapping";
    field: AstId;
    name: AstId;
    id: number;
    loc: SrcInfo;
};

export type AstDestructEnd = {
    kind: "destruct_end";
    ignoreUnspecifiedFields: boolean;
    id: number;
    loc: SrcInfo;
};

export type AstNumber = {
    kind: "number";
    base: AstNumberBase;
    value: bigint;
    id: number;
    loc: SrcInfo;
};

export type AstNumberBase = 2 | 8 | 10 | 16;

export function astNumToString(n: AstNumber): string {
    switch (n.base) {
        case 2:
            return `0b${n.value.toString(n.base)}`;
        case 8:
            return `0o${n.value.toString(n.base)}`;
        case 10:
            return n.value.toString(n.base);
        case 16:
            return `0x${n.value.toString(n.base)}`;
    }
}

export type AstBoolean = {
    kind: "boolean";
    value: boolean;
    id: number;
    loc: SrcInfo;
};

// An AstSimplifiedString is a string in which escaping characters, like '\\' has been simplified, e.g., '\\' simplified to '\'.
// An AstString is not a literal because it may contain escaping characters that have not been simplified, like '\\'.
// AstSimplifiedString is always produced by the interpreter, never directly by the parser. The parser produces AstStrings, which
// then get transformed into AstSimplifiedString by the interpreter.
export type AstSimplifiedString = {
    kind: "simplified_string";
    value: string;
    id: number;
    loc: SrcInfo;
};

/**
 * @deprecated AstSimplifiedString
 */
export type AstString = {
    kind: "string";
    value: string;
    id: number;
    loc: SrcInfo;
};

// `null` value is an inhabitant of several types:
// it can represent missing values in optional types,
// or empty map of any key and value types
export type AstNull = {
    kind: "null";
    id: number;
    loc: SrcInfo;
};

export type AstAddress = {
    kind: "address";
    value: Address;
    id: number;
    loc: SrcInfo;
};

export type AstCell = {
    kind: "cell";
    value: Cell;
    id: number;
    loc: SrcInfo;
};

export type AstSlice = {
    kind: "slice";
    value: Slice;
    id: number;
    loc: SrcInfo;
};

export type AstCommentValue = {
    kind: "comment_value";
    value: string;
    id: number;
    loc: SrcInfo;
};

export type AstStructValue = {
    kind: "struct_value";
    type: AstId;
    args: AstStructFieldValue[];
    id: number;
    loc: SrcInfo;
};

export type AstStructFieldValue = {
    kind: "struct_field_value";
    field: AstId;
    initializer: AstLiteral;
    id: number;
    loc: SrcInfo;
};

export type AstConstantAttributeName = "virtual" | "override" | "abstract";

export type AstConstantAttribute = {
    type: AstConstantAttributeName;
    loc: SrcInfo;
};

export type AstContractAttribute = {
    type: "interface";
    name: AstString;
    loc: SrcInfo;
};

export type AstFunctionAttributeGet = {
    kind: "function_attribute";
    type: "get";
    methodId: AstExpression | null;
    loc: SrcInfo;
};

export type AstFunctionAttributeName =
    | "mutates"
    | "extends"
    | "virtual"
    | "abstract"
    | "override"
    | "inline";

export type AstFunctionAttributeRest = {
    kind: "function_attribute";
    type: AstFunctionAttributeName;
    loc: SrcInfo;
};

export type AstFunctionAttribute =
    | AstFunctionAttributeGet
    | AstFunctionAttributeRest;

export type AstTypedParameter = {
    kind: "typed_parameter";
    name: AstId;
    type: AstType;
    id: number;
    loc: SrcInfo;
};

export type AstReceiverKind =
    | {
          kind: "internal-simple";
          param: AstTypedParameter;
      }
    | {
          kind: "internal-fallback";
      }
    | {
          kind: "internal-comment";
          comment: AstString;
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
          comment: AstString;
      };

export type AstNode =
    | AstFuncId
    | AstDestructMapping
    | AstDestructEnd
    | AstExpression
    | AstStatement
    | AstTypeDecl
    | AstFieldDecl
    | AstTypedParameter
    | AstFunctionDef
    | AstFunctionAttribute
    | AstAsmFunctionDef
    | AstFunctionDecl
    | AstModule
    | AstNativeFunctionDecl
    | AstStructFieldInitializer
    | AstStructFieldValue
    | AstType
    | AstContractInit
    | AstReceiver
    | AstImport
    | AstConstantDef
    | AstConstantDecl;

/**
 * Check if input expression is a 'path expression',
 * i.e. an identifier or a sequence of field accesses starting from an identifier.
 * @param path A path expression to check.
 * @returns An array of identifiers or null if the input expression is not a path expression.
 */
export function tryExtractPath(path: AstExpression): AstId[] | null {
    switch (path.kind) {
        case "id":
            return [path];
        case "field_access": {
            const p = tryExtractPath(path.aggregate);
            return p ? [...p, path.field] : null;
        }
        default:
            return null;
    }
}

// eslint-disable-next-line @typescript-eslint/no-explicit-any
type DistributiveOmit<T, K extends keyof any> = T extends any
    ? Omit<T, K>
    : never;

export const getAstFactory = () => {
    let nextId = 1;
    function createNode(src: DistributiveOmit<AstNode, "id">): AstNode {
        return Object.freeze(Object.assign({ id: nextId++ }, src));
    }
    function cloneNode<T extends AstNode>(src: T): T {
        return { ...src, id: nextId++ };
    }
    return {
        createNode,
        cloneNode,
    };
};

export type FactoryAst = ReturnType<typeof getAstFactory>;

// Test equality of AstExpressions.
// Note this is syntactical equality of expressions.
// For example, two struct instances are equal if they have the same
// type and same fields in the same order.
export function eqExpressions(
    ast1: AstExpression,
    ast2: AstExpression,
): boolean {
    if (ast1.kind !== ast2.kind) {
        return false;
    }

    switch (ast1.kind) {
        case "null":
            return true;
        case "boolean":
            return ast1.value === (ast2 as AstBoolean).value;
        case "number":
            return ast1.value === (ast2 as AstNumber).value;
        case "string":
            return ast1.value === (ast2 as AstString).value;
        case "id":
            return eqNames(ast1, ast2 as AstId);
        case "address":
            return ast1.value.equals((ast2 as AstAddress).value);
        case "cell":
            return ast1.value.equals((ast2 as AstCell).value);
        case "slice":
            return ast1.value
                .asCell()
                .equals((ast2 as AstSlice).value.asCell());
        case "comment_value":
            return ast1.value === (ast2 as AstCommentValue).value;
        case "simplified_string":
            return ast1.value === (ast2 as AstSimplifiedString).value;
        case "struct_value":
            return (
                eqNames(ast1.type, (ast2 as AstStructValue).type) &&
                eqArrays(
                    ast1.args,
                    (ast2 as AstStructValue).args,
                    eqFieldValues,
                )
            );
        case "method_call":
            return (
                eqNames(ast1.method, (ast2 as AstMethodCall).method) &&
                eqExpressions(ast1.self, (ast2 as AstMethodCall).self) &&
                eqArrays(ast1.args, (ast2 as AstMethodCall).args, eqExpressions)
            );
        case "init_of":
            return (
                eqNames(ast1.contract, (ast2 as AstInitOf).contract) &&
                eqArrays(ast1.args, (ast2 as AstInitOf).args, eqExpressions)
            );
        case "op_unary":
            return (
                ast1.op === (ast2 as AstOpUnary).op &&
                eqExpressions(ast1.operand, (ast2 as AstOpUnary).operand)
            );
        case "op_binary":
            return (
                ast1.op === (ast2 as AstOpBinary).op &&
                eqExpressions(ast1.left, (ast2 as AstOpBinary).left) &&
                eqExpressions(ast1.right, (ast2 as AstOpBinary).right)
            );
        case "conditional":
            return (
                eqExpressions(
                    ast1.condition,
                    (ast2 as AstConditional).condition,
                ) &&
                eqExpressions(
                    ast1.thenBranch,
                    (ast2 as AstConditional).thenBranch,
                ) &&
                eqExpressions(
                    ast1.elseBranch,
                    (ast2 as AstConditional).elseBranch,
                )
            );
        case "struct_instance":
            return (
                eqNames(ast1.type, (ast2 as AstStructInstance).type) &&
                eqArrays(
                    ast1.args,
                    (ast2 as AstStructInstance).args,
                    eqFieldInitializers,
                )
            );
        case "field_access":
            return (
                eqNames(ast1.field, (ast2 as AstFieldAccess).field) &&
                eqExpressions(
                    ast1.aggregate,
                    (ast2 as AstFieldAccess).aggregate,
                )
            );
        case "static_call":
            return (
                eqNames(ast1.function, (ast2 as AstStaticCall).function) &&
                eqArrays(ast1.args, (ast2 as AstStaticCall).args, eqExpressions)
            );
        default:
            throwInternalCompilerError("Unrecognized expression kind");
    }
}

function eqFieldInitializers(
    arg1: AstStructFieldInitializer,
    arg2: AstStructFieldInitializer,
): boolean {
    return (
        eqNames(arg1.field, arg2.field) &&
        eqExpressions(arg1.initializer, arg2.initializer)
    );
}

function eqFieldValues(
    arg1: AstStructFieldValue,
    arg2: AstStructFieldValue,
): boolean {
    return (
        eqNames(arg1.field, arg2.field) &&
        eqExpressions(arg1.initializer, arg2.initializer)
    );
}

function eqArrays<T>(
    arr1: T[],
    arr2: T[],
    eqElements: (elem1: T, elem2: T) => boolean,
): boolean {
    if (arr1.length !== arr2.length) {
        return false;
    }

    for (let i = 0; i < arr1.length; i++) {
        if (!eqElements(arr1[i]!, arr2[i]!)) {
            return false;
        }
    }

    return true;
}

/* 
Functions that return guard types like "ast is AstLiteral" are unsafe to use in production code. 
But there is a way to make them safe by introducing an intermediate function, like 
the "checkLiteral" function defined below after "isLiteral". In principle, it is possible to use "checkLiteral" 
directly in the code (which avoids the guard type altogether), but it produces code that reduces readability significantly.

The pattern shown with "isLiteral" and "checkLiteral" can be generalized to other functions that produce a guard type 
based on a decision of several cases. 
For example, if we have the following function, where we assume that B is a subtype of A:

function isB(d: A): d is B {
  if (cond1(d)) {        // It is assumed that cond1(d) determines d to be of type B inside the if
     return true;  
  } else if (cond2(d)) { // It is assumed that cond2(d) determines d to be of type A but not of type B inside the if
     return false;
  } else if (cond3(d)) { // It is assumed that cond3(d) determines d to be of type B inside the if
     return true;
  } else {               // It is assumed that d is of type A but not of type B inside the else
     return false;
  }
}

We can introduce a "checkB" function as follows:

function checkB<T>(d: A, t: (arg: B) => T, f: (arg: Exclude<A,B>) => T): T {
  if (cond1(d)) {  
     return t(d);  
  } else if (cond2(d)) {
     return f(d);
  } else if (cond3(d)) {
     return t(d);
  } else {
     return f(d);
  }
}

Here, all the "true" cases return t(d) and all the "false" cases return f(d). The names of the functions t and f help remember 
that they correspond to the true and false cases, respectively. Observe that cond1(d) and cond3(d) determine the type of 
d to be B, which means we can pass d to the t function. For the false cases, the type of d is determined to be 
A but not B, which means we can pass d to function f, because f's argument type Exclude<A,B> states
that the argument must be of type A but not of type B, i.e., of type "A - B" if we see the types as sets. 

checkB is safe because the compiler will complain if, for example, we use t(d) in the else case:

function checkB<T>(d: A, t: (arg: B) => T, f: (arg: Exclude<A,B>) => T): T {
  if (cond1(d)) {  
     return t(d);  
  } else if (cond2(d)) {
     return f(d);
  } else if (cond3(d)) {
     return t(d);
  } else {
     return t(d);   // Compiler will signal an error that d is not assignable to type B
  }
}

Contrary to the original function, where the compiler remains silent if we incorrectly return true in the else:

function isB(d: A): d is B {
  if (cond1(d)) {
     return true;  
  } else if (cond2(d)) {
     return false;
  } else if (cond3(d)) { 
     return true;
  } else {              
     return true;   // Wrong, but compiler remains silent
  }
}

After we have our "checkB" function, we can define the "isB" function simply as:

function isB(d: A): d is B {
  return checkB(d, () => true, () => false);
}
*/

export function isLiteral(ast: AstExpression): ast is AstLiteral {
    return checkLiteral(
        ast,
        () => true,
        () => false,
    );
}

export function checkLiteral<T>(
    ast: AstExpression,
    t: (node: AstLiteral) => T,
    f: (node: Exclude<AstExpression, AstLiteral>) => T,
): T {
    switch (ast.kind) {
        case "null":
        case "boolean":
        case "number":
        case "address":
        case "cell":
        case "slice":
        case "comment_value":
        case "simplified_string":
        case "struct_value":
            return t(ast);

        case "struct_instance":
        case "string":
        case "id":
        case "method_call":
        case "init_of":
        case "op_unary":
        case "op_binary":
        case "conditional":
        case "field_access":
        case "static_call":
            return f(ast);

        default:
            throwInternalCompilerError("Unrecognized expression kind");
    }
}
