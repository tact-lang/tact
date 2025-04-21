import type * as TonCore from "@ton/core";
import type { SrcInfo } from "@/grammar/src-info";
import type { RelativePath } from "@/imports/path";
import type { Language } from "@/imports/source";

export type Module = {
    readonly kind: "module";
    readonly imports: readonly Import[];
    readonly items: readonly ModuleItem[];
    readonly id: number;
};

export type Import = {
    readonly kind: "import";
    readonly importPath: ImportPath;
    readonly id: number;
    readonly loc: SrcInfo;
};

export type ModuleItem =
    | PrimitiveTypeDecl
    | FunctionDef
    | AsmFunctionDef
    | NativeFunctionDecl
    | ConstantDef
    | StructDecl
    | MessageDecl
    | Contract
    | Trait;

export type TypeDecl =
    | PrimitiveTypeDecl
    | StructDecl
    | MessageDecl
    | Contract
    | Trait;

export type PrimitiveTypeDecl = {
    readonly kind: "primitive_type_decl";
    readonly name: Id;
    readonly id: number;
    readonly loc: SrcInfo;
};

export type FunctionDef = {
    readonly kind: "function_def";
    readonly attributes: readonly FunctionAttribute[];
    readonly name: Id;
    readonly return: Type | undefined;
    readonly params: readonly TypedParameter[];
    readonly statements: readonly Statement[];
    readonly id: number;
    readonly loc: SrcInfo;
};

export type AsmFunctionDef = {
    readonly kind: "asm_function_def";
    readonly shuffle: AsmShuffle;
    readonly attributes: readonly FunctionAttribute[];
    readonly name: Id;
    readonly return: Type | undefined;
    readonly params: readonly TypedParameter[];
    readonly instructions: readonly AsmInstruction[];
    readonly id: number;
    readonly loc: SrcInfo;
};

export type AsmInstruction = string;
export type AsmShuffle = {
    readonly args: readonly Id[];
    readonly ret: readonly Number[];
};

export type FunctionDecl = {
    readonly kind: "function_decl";
    readonly attributes: readonly FunctionAttribute[];
    readonly name: Id;
    readonly return: Type | undefined;
    readonly params: readonly TypedParameter[];
    readonly id: number;
    readonly loc: SrcInfo;
};

export type NativeFunctionDecl = {
    readonly kind: "native_function_decl";
    readonly attributes: readonly FunctionAttribute[];
    readonly name: Id;
    readonly nativeName: FuncId;
    readonly params: readonly TypedParameter[];
    readonly return: Type | undefined;
    readonly id: number;
    readonly loc: SrcInfo;
};

export type ConstantDef = {
    readonly kind: "constant_def";
    readonly attributes: readonly ConstantAttribute[];
    readonly name: Id;
    readonly type: Type;
    readonly initializer: Expression;
    readonly id: number;
    readonly loc: SrcInfo;
};

export type ConstantDecl = {
    readonly kind: "constant_decl";
    readonly attributes: readonly ConstantAttribute[];
    readonly name: Id;
    readonly type: Type;
    readonly id: number;
    readonly loc: SrcInfo;
};

export type StructDecl = {
    readonly kind: "struct_decl";
    readonly name: Id;
    readonly fields: readonly FieldDecl[];
    readonly id: number;
    readonly loc: SrcInfo;
};

export type MessageDecl = {
    readonly kind: "message_decl";
    readonly name: Id;
    readonly opcode: Expression | undefined;
    readonly fields: readonly FieldDecl[];
    readonly id: number;
    readonly loc: SrcInfo;
};

export type Contract = {
    readonly kind: "contract";
    readonly name: Id;
    readonly traits: readonly Id[];
    readonly attributes: readonly ContractAttribute[];
    readonly params: undefined | readonly FieldDecl[];
    readonly declarations: readonly ContractDeclaration[];
    readonly id: number;
    readonly loc: SrcInfo;
};

export type Trait = {
    readonly kind: "trait";
    readonly name: Id;
    readonly traits: readonly Id[];
    readonly attributes: readonly ContractAttribute[];
    readonly declarations: readonly TraitDeclaration[];
    readonly id: number;
    readonly loc: SrcInfo;
};

export type ContractDeclaration =
    | FieldDecl
    | FunctionDef
    | AsmFunctionDef
    | ContractInit
    | Receiver
    | ConstantDef;

export type TraitDeclaration =
    | FieldDecl
    | FunctionDef
    | AsmFunctionDef
    | FunctionDecl
    | Receiver
    | ConstantDef
    | ConstantDecl;

export type FieldDecl = {
    readonly kind: "field_decl";
    readonly name: Id;
    readonly type: Type;
    readonly initializer: Expression | undefined;
    readonly as: Id | undefined;
    readonly id: number;
    readonly loc: SrcInfo;
};

export type Receiver = {
    readonly kind: "receiver";
    readonly selector: ReceiverKind;
    readonly statements: readonly Statement[];
    readonly id: number;
    readonly loc: SrcInfo;
};

export type ContractInit = {
    readonly kind: "contract_init";
    readonly params: readonly TypedParameter[];
    readonly statements: readonly Statement[];
    readonly id: number;
    readonly loc: SrcInfo;
};

//
// Statements
//

export type Statement =
    | StatementLet
    | StatementReturn
    | StatementExpression
    | StatementAssign
    | StatementAugmentedAssign
    | StatementCondition
    | StatementWhile
    | StatementUntil
    | StatementRepeat
    | StatementTry
    | StatementForEach
    | StatementDestruct
    | StatementBlock;

export type StatementLet = {
    readonly kind: "statement_let";
    readonly name: OptionalId;
    readonly type: Type | undefined;
    readonly expression: Expression;
    readonly id: number;
    readonly loc: SrcInfo;
};

export type StatementReturn = {
    readonly kind: "statement_return";
    readonly expression: Expression | undefined;
    readonly id: number;
    readonly loc: SrcInfo;
};

export type StatementExpression = {
    readonly kind: "statement_expression";
    readonly expression: Expression;
    readonly id: number;
    readonly loc: SrcInfo;
};

export type StatementAssign = {
    readonly kind: "statement_assign";
    readonly path: Expression; // left-hand side of `=`
    readonly expression: Expression;
    readonly id: number;
    readonly loc: SrcInfo;
};

export type AugmentedAssignOperation =
    | "+="
    | "-="
    | "*="
    | "/="
    | "&&="
    | "||="
    | "%="
    | "|="
    | "<<="
    | ">>="
    | "&="
    | "^=";

export type StatementAugmentedAssign = {
    readonly kind: "statement_augmentedassign";
    readonly op: AugmentedAssignOperation;
    readonly path: Expression;
    readonly expression: Expression;
    readonly id: number;
    readonly loc: SrcInfo;
};

export type StatementCondition = {
    readonly kind: "statement_condition";
    readonly condition: Expression;
    readonly trueStatements: readonly Statement[];
    readonly falseStatements: readonly Statement[] | undefined;
    readonly id: number;
    readonly loc: SrcInfo;
};

export type StatementWhile = {
    readonly kind: "statement_while";
    readonly condition: Expression;
    readonly statements: readonly Statement[];
    readonly id: number;
    readonly loc: SrcInfo;
};

export type StatementUntil = {
    readonly kind: "statement_until";
    readonly condition: Expression;
    readonly statements: readonly Statement[];
    readonly id: number;
    readonly loc: SrcInfo;
};

export type StatementRepeat = {
    readonly kind: "statement_repeat";
    readonly iterations: Expression;
    readonly statements: readonly Statement[];
    readonly id: number;
    readonly loc: SrcInfo;
};

export type StatementTry = {
    readonly kind: "statement_try";
    readonly statements: readonly Statement[];
    readonly catchBlock: CatchBlock | undefined;
    readonly id: number;
    readonly loc: SrcInfo;
};

export type CatchBlock = {
    readonly catchName: OptionalId;
    readonly catchStatements: readonly Statement[];
};

export type StatementForEach = {
    readonly kind: "statement_foreach";
    readonly keyName: OptionalId;
    readonly valueName: OptionalId;
    readonly map: Expression;
    readonly statements: readonly Statement[];
    readonly id: number;
    readonly loc: SrcInfo;
};

export type StatementDestruct = {
    readonly kind: "statement_destruct";
    readonly type: TypeId;
    /** field name -> [field id, local id] */
    readonly identifiers: ReadonlyMap<string, readonly [Id, OptionalId]>;
    readonly ignoreUnspecifiedFields: boolean;
    readonly expression: Expression;
    readonly id: number;
    readonly loc: SrcInfo;
};

export type StatementBlock = {
    readonly kind: "statement_block";
    readonly statements: readonly Statement[];
    readonly id: number;
    readonly loc: SrcInfo;
};

//
// Types
//

export type Type = TypeId | OptionalType | MapType | BouncedMessageType;

export type TypeId = {
    readonly kind: "type_id";
    readonly text: string;
    readonly id: number;
    readonly loc: SrcInfo;
};

export type OptionalType = {
    readonly kind: "optional_type";
    readonly typeArg: Type;
    readonly id: number;
    readonly loc: SrcInfo;
};

export type MapType = {
    readonly kind: "map_type";
    readonly keyType: TypeId;
    readonly keyStorageType: Id | undefined;
    readonly valueType: TypeId;
    readonly valueStorageType: Id | undefined;
    readonly id: number;
    readonly loc: SrcInfo;
};

export type BouncedMessageType = {
    readonly kind: "bounced_message_type";
    readonly messageType: TypeId;
    readonly id: number;
    readonly loc: SrcInfo;
};

//
// Expressions
//

export type Expression =
    | OpBinary
    | OpUnary
    | Conditional
    | MethodCall
    | FieldAccess
    | StaticCall
    | StructInstance
    | Id
    | InitOf
    | CodeOf
    | MapLiteral
    | SetLiteral
    | Literal;

export type Literal =
    | Number
    | Boolean
    | Null
    | String
    | Address
    | Cell
    | Slice
    | MapValue
    | StructValue;

export type BinaryOperation =
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

export type OpBinary = {
    readonly kind: "op_binary";
    readonly op: BinaryOperation;
    readonly left: Expression;
    readonly right: Expression;
    readonly id: number;
    readonly loc: SrcInfo;
};

export type UnaryOperation = "+" | "-" | "!" | "!!" | "~";

export type OpUnary = {
    readonly kind: "op_unary";
    readonly op: UnaryOperation;
    readonly operand: Expression;
    readonly id: number;
    readonly loc: SrcInfo;
};

export type FieldAccess = {
    readonly kind: "field_access";
    readonly aggregate: Expression; // contract, trait, struct, message
    readonly field: Id;
    readonly id: number;
    readonly loc: SrcInfo;
};

export type MethodCall = {
    readonly kind: "method_call";
    readonly self: Expression; // anything with a method
    readonly method: Id;
    readonly args: readonly Expression[];
    readonly id: number;
    readonly loc: SrcInfo;
};

// builtins or top-level (module) functions
export type StaticCall = {
    readonly kind: "static_call";
    readonly function: Id;
    readonly args: readonly Expression[];
    readonly id: number;
    readonly loc: SrcInfo;
};

export type StructInstance = {
    readonly kind: "struct_instance";
    readonly type: Id;
    readonly args: readonly StructFieldInitializer[];
    readonly id: number;
    readonly loc: SrcInfo;
};

export type MapLiteral = {
    readonly kind: "map_literal";
    readonly type: MapType;
    readonly fields: readonly MapField[];
    readonly id: number;
    readonly loc: SrcInfo;
};

export type MapField = {
    readonly key: Expression;
    readonly value: Expression;
};

export type SetLiteral = {
    readonly kind: "set_literal";
    readonly valueType: TypeId;
    readonly valueStorageType: Id | undefined;
    readonly fields: readonly Expression[];
    readonly id: number;
    readonly loc: SrcInfo;
};

export type StructFieldInitializer = {
    readonly kind: "struct_field_initializer";
    readonly field: Id;
    readonly initializer: Expression;
    readonly id: number;
    readonly loc: SrcInfo;
};

export type InitOf = {
    readonly kind: "init_of";
    readonly contract: Id;
    readonly args: readonly Expression[];
    readonly id: number;
    readonly loc: SrcInfo;
};

export type CodeOf = {
    readonly kind: "code_of";
    readonly contract: Id;
    readonly id: number;
    readonly loc: SrcInfo;
};

export type Conditional = {
    readonly kind: "conditional";
    readonly condition: Expression;
    readonly thenBranch: Expression;
    readonly elseBranch: Expression;
    readonly id: number;
    readonly loc: SrcInfo;
};

export type OptionalId = Id | Wildcard;

export type Id = {
    readonly kind: "id";
    readonly text: string;
    readonly id: number;
    readonly loc: SrcInfo;
};

export type Wildcard = {
    readonly kind: "wildcard";
    readonly id: number;
    readonly loc: SrcInfo;
};

export type FuncId = {
    readonly kind: "func_id";
    readonly text: string;
    readonly id: number;
    readonly loc: SrcInfo;
};

export type DestructMapping = {
    readonly kind: "destruct_mapping";
    readonly field: Id;
    readonly name: Id;
    readonly id: number;
    readonly loc: SrcInfo;
};

export type DestructEnd = {
    readonly kind: "destruct_end";
    readonly ignoreUnspecifiedFields: boolean;
    readonly id: number;
    readonly loc: SrcInfo;
};

export type Number = {
    readonly kind: "number";
    readonly base: NumberBase;
    readonly value: bigint;
    readonly id: number;
    readonly loc: SrcInfo;
};

export type NumberBase = 2 | 8 | 10 | 16;

export type Boolean = {
    readonly kind: "boolean";
    readonly value: boolean;
    readonly id: number;
    readonly loc: SrcInfo;
};

// Reference to source file
export type ImportPath = {
    readonly path: RelativePath;
    readonly type: ImportType;
    readonly language: Language;
};

// This is different from ItemOrigin, because relative import
// from standard library is still import with origin: "stdlib"
export type ImportType = "stdlib" | "relative";

// A String is a string in which escaping characters, like '\\' has been simplified, e.g., '\\' simplified to '\'.
export type String = {
    readonly kind: "string";
    readonly value: string;
    readonly id: number;
    readonly loc: SrcInfo;
};

// `null` value is an inhabitant of several types:
// it can represent missing values in optional types,
// or empty map of any key and value types
export type Null = {
    readonly kind: "null";
    readonly id: number;
    readonly loc: SrcInfo;
};

export type Address = {
    readonly kind: "address";
    readonly value: TonCore.Address;
    readonly id: number;
    readonly loc: SrcInfo;
};

export type Cell = {
    readonly kind: "cell";
    readonly value: TonCore.Cell;
    readonly id: number;
    readonly loc: SrcInfo;
};

export type Slice = {
    readonly kind: "slice";
    readonly value: TonCore.Slice;
    readonly id: number;
    readonly loc: SrcInfo;
};

export type MapValue = {
    readonly kind: "map_value";
    readonly bocHex: string;
    readonly type: MapType;
    readonly id: number;
    readonly loc: SrcInfo;
}

export type StructValue = {
    readonly kind: "struct_value";
    readonly type: Id;
    readonly args: readonly StructFieldValue[];
    readonly id: number;
    readonly loc: SrcInfo;
};

export type StructFieldValue = {
    readonly kind: "struct_field_value";
    readonly field: Id;
    readonly initializer: Literal;
    readonly id: number;
    readonly loc: SrcInfo;
};

export type ConstantAttributeName = "virtual" | "override" | "abstract";

export type ConstantAttribute = {
    readonly type: ConstantAttributeName;
    readonly loc: SrcInfo;
};

export type ContractAttribute = {
    readonly type: "interface";
    readonly name: String;
    readonly loc: SrcInfo;
};

export type FunctionAttributeGet = {
    readonly kind: "function_attribute";
    readonly type: "get";
    readonly methodId: Expression | undefined;
    readonly loc: SrcInfo;
};

export type FunctionAttributeName =
    | "mutates"
    | "extends"
    | "virtual"
    | "abstract"
    | "override"
    | "inline";

export type FunctionAttributeRest = {
    readonly kind: "function_attribute";
    readonly type: FunctionAttributeName;
    readonly loc: SrcInfo;
};

export type FunctionAttribute = FunctionAttributeGet | FunctionAttributeRest;

export type TypedParameter = {
    readonly kind: "typed_parameter";
    readonly name: OptionalId;
    readonly type: Type;
    readonly as: Id | undefined; // only in `init()`
    readonly id: number;
    readonly loc: SrcInfo;
};

export type ReceiverSimple = {
    readonly kind: "simple";
    readonly param: TypedParameter;
    readonly id: number;
};

export type ReceiverFallback = {
    readonly kind: "fallback";
    readonly id: number;
};

export type ReceiverComment = {
    readonly kind: "comment";
    readonly comment: String;
    readonly id: number;
};

export type ReceiverSubKind =
    | ReceiverSimple
    | ReceiverFallback
    | ReceiverComment;

export type ReceiverInternal = {
    readonly kind: "internal";
    readonly subKind: ReceiverSubKind;
    readonly id: number;
    readonly loc: SrcInfo;
};

export type ReceiverExternal = {
    readonly kind: "external";
    readonly subKind: ReceiverSubKind;
    readonly id: number;
    readonly loc: SrcInfo;
};

export type ReceiverBounce = {
    readonly kind: "bounce";
    readonly param: TypedParameter;
    readonly id: number;
    readonly loc: SrcInfo;
};

export type ReceiverKind = ReceiverInternal | ReceiverExternal | ReceiverBounce;

export type AstNode =
    | FuncId
    | Wildcard
    | DestructMapping
    | DestructEnd
    | Expression
    | Statement
    | TypeDecl
    | FieldDecl
    | TypedParameter
    | FunctionDef
    | FunctionAttribute
    | AsmFunctionDef
    | FunctionDecl
    | Module
    | NativeFunctionDecl
    | StructFieldInitializer
    | StructFieldValue
    | Type
    | ContractInit
    | Receiver
    | Import
    | ConstantDef
    | ConstantDecl
    | ReceiverKind
    | ReceiverSubKind;
