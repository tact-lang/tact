import { Address, Cell, Slice } from "@ton/core";
import { SrcInfo } from "../grammar/src-info";
import { RelativePath } from "../imports/path";
import { Language } from "../imports/source";

export type AstModule = {
    kind: "module";
    imports: AstImport[];
    items: AstModuleItem[];
    id: number;
};

export type AstImport = {
    kind: "import";
    source: SourceReference;
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
    | AstStatementCondition
    | AstStatementWhile
    | AstStatementUntil
    | AstStatementRepeat
    | AstStatementTry
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

export type AstStatementCondition = {
    kind: "statement_condition";
    condition: AstExpression;
    trueStatements: AstStatement[];
    falseStatements: AstStatement[] | null;
    elseif: AstStatementCondition | null;
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
    catchBlock?: {
        catchName: AstId;
        catchStatements: AstStatement[];
    };
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

export type AstBoolean = {
    kind: "boolean";
    value: boolean;
    id: number;
    loc: SrcInfo;
};

// Reference to source file
export type SourceReference = {
    readonly path: RelativePath;
    readonly type: "stdlib" | "relative";
    readonly language: Language;
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

export type AstReceiverSimple = {
    kind: "simple";
    param: AstTypedParameter;
    id: number;
};

export type AstReceiverFallback = {
    kind: "fallback";
    id: number;
};

export type AstReceiverComment = {
    kind: "comment";
    comment: AstString;
    id: number;
};

export type AstReceiverSubKind =
    | AstReceiverSimple
    | AstReceiverFallback
    | AstReceiverComment;

export type AstReceiverInternal = {
    kind: "internal";
    subKind: AstReceiverSubKind;
    id: number;
    loc: SrcInfo;
};

export type AstReceiverExternal = {
    kind: "external";
    subKind: AstReceiverSubKind;
    id: number;
    loc: SrcInfo;
};

export type AstReceiverBounce = {
    kind: "bounce";
    param: AstTypedParameter;
    id: number;
    loc: SrcInfo;
};

export type AstReceiverKind =
    | AstReceiverInternal
    | AstReceiverExternal
    | AstReceiverBounce;

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
    | AstConstantDecl
    | AstReceiverKind
    | AstReceiverSubKind;
