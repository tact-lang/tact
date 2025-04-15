import type {
    FuncId,
    Id,
    Range,
    OptionalId,
    TypeId,
    Language,
} from "@/next/ast/common";
import type { Expression, Number, String } from "@/next/ast/expression";
import type { Statement } from "@/next/ast/statement";
import type { Type } from "@/next/ast/type";
import type { RelativePath } from "@/next/fs";

export type Source = {
    readonly file: string | undefined;
    readonly contents: string;
    readonly root: Module;
};

export type Module = {
    readonly kind: "module";
    readonly imports: readonly Import[];
    readonly items: readonly ModuleItem[];
};

export type Contract = {
    readonly kind: "contract";
    readonly name: TypeId;
    readonly traits: readonly TypeId[];
    readonly attributes: readonly ContractAttribute[];
    readonly params: undefined | readonly FieldDecl[];
    readonly declarations: readonly ContractItem[];
    readonly loc: Range;
};

export type Trait = {
    readonly kind: "trait";
    readonly name: TypeId;
    readonly traits: readonly TypeId[];
    readonly attributes: readonly ContractAttribute[];
    readonly declarations: readonly TraitItem[];
    readonly loc: Range;
};

export type ModuleItem =
    | FunctionDef
    | AsmFunctionDef
    | NativeFunctionDecl
    | ConstantDef
    | StructDecl
    | MessageDecl
    | UnionDecl
    | AliasDecl
    | Contract
    | Trait;

export type ContractItem =
    | FieldDecl
    | FunctionDef
    | AsmFunctionDef
    | ContractInit
    | Receiver
    | ConstantDef;

export type TraitItem =
    | FieldDecl
    | FunctionDef
    | AsmFunctionDef
    | FunctionDecl
    | Receiver
    | ConstantDef
    | ConstantDecl;

export type Import = {
    readonly kind: "import";
    readonly importPath: ImportPath;
    readonly loc: Range;
};

export type FunctionDef = {
    readonly kind: "function_def";
    readonly attributes: readonly FunctionAttribute[];
    readonly name: Id;
    readonly typeParams: readonly TypeId[];
    readonly return: Type | undefined;
    readonly params: readonly TypedParameter[];
    readonly statements: readonly Statement[];
    readonly loc: Range;
};

export type Receiver = {
    readonly kind: "receiver";
    readonly selector: ReceiverKind;
    readonly statements: readonly Statement[];
    readonly loc: Range;
};

export type ContractInit = {
    readonly kind: "contract_init";
    readonly params: readonly TypedParameter[];
    readonly statements: readonly Statement[];
    readonly loc: Range;
};

export type AsmFunctionDef = {
    readonly kind: "asm_function_def";
    readonly shuffle: AsmShuffle;
    readonly attributes: readonly FunctionAttribute[];
    readonly name: Id;
    readonly typeParams: readonly TypeId[];
    readonly return: Type | undefined;
    readonly params: readonly TypedParameter[];
    readonly instructions: readonly AsmInstruction[];
    readonly loc: Range;
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
    readonly typeParams: readonly TypeId[];
    readonly return: Type | undefined;
    readonly params: readonly TypedParameter[];
    readonly loc: Range;
};

export type NativeFunctionDecl = {
    readonly kind: "native_function_decl";
    readonly attributes: readonly FunctionAttribute[];
    readonly name: Id;
    readonly typeParams: readonly TypeId[];
    readonly nativeName: FuncId;
    readonly params: readonly TypedParameter[];
    readonly return: Type | undefined;
    readonly loc: Range;
};

export type ConstantDef = {
    readonly kind: "constant_def";
    readonly attributes: readonly ConstantAttribute[];
    readonly name: Id;
    readonly type: Type | undefined;
    readonly initializer: Expression;
    readonly loc: Range;
};

export type ConstantDecl = {
    readonly kind: "constant_decl";
    readonly attributes: readonly ConstantAttribute[];
    readonly name: Id;
    readonly type: Type;
    readonly loc: Range;
};

export type StructDecl = {
    readonly kind: "struct_decl";
    readonly name: TypeId;
    readonly typeParams: readonly TypeId[];
    readonly fields: readonly FieldDecl[];
    readonly loc: Range;
};

export type MessageDecl = {
    readonly kind: "message_decl";
    readonly name: TypeId;
    readonly opcode: Expression | undefined;
    readonly fields: readonly FieldDecl[];
    readonly loc: Range;
};

export type UnionDecl = {
    readonly kind: "union_decl";
    readonly name: TypeId;
    readonly typeParams: readonly TypeId[];
    readonly cases: readonly UnionCase[];
    readonly loc: Range;
}

export type AliasDecl = {
    readonly kind: "alias_decl";
    readonly name: TypeId;
    readonly typeParams: readonly TypeId[];
    readonly type: Type;
}

export type UnionCase = {
    readonly name: TypeId;
    readonly fields: readonly FieldDecl[];
}

export type FieldDecl = {
    readonly kind: "field_decl";
    readonly name: Id;
    readonly type: Type;
    readonly initializer: Expression | undefined;
    readonly loc: Range;
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

export type ConstantAttributeName = "virtual" | "override" | "abstract";

export type ConstantAttribute = {
    readonly type: ConstantAttributeName;
    readonly loc: Range;
};

export type ContractAttribute = {
    readonly type: "interface";
    readonly name: string;
    readonly loc: Range;
};

export type FunctionAttributeGet = {
    readonly kind: "function_attribute";
    readonly type: "get";
    readonly methodId: Expression | undefined;
    readonly loc: Range;
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
    readonly loc: Range;
};

export type FunctionAttribute = FunctionAttributeGet | FunctionAttributeRest;

export type TypedParameter = {
    readonly kind: "typed_parameter";
    readonly name: OptionalId;
    readonly type: Type;
    readonly loc: Range;
};

export type ReceiverSimple = {
    readonly kind: "simple";
    readonly param: TypedParameter;
};

export type ReceiverFallback = {
    readonly kind: "fallback";
};

export type ReceiverComment = {
    readonly kind: "comment";
    readonly comment: String;
};

export type ReceiverSubKind =
    | ReceiverSimple
    | ReceiverFallback
    | ReceiverComment;

export type ReceiverInternal = {
    readonly kind: "internal";
    readonly subKind: ReceiverSubKind;
    readonly loc: Range;
};

export type ReceiverExternal = {
    readonly kind: "external";
    readonly subKind: ReceiverSubKind;
    readonly loc: Range;
};

export type ReceiverBounce = {
    readonly kind: "bounce";
    readonly param: TypedParameter;
    readonly loc: Range;
};

export type ReceiverKind = ReceiverInternal | ReceiverExternal | ReceiverBounce;
