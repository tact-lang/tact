import type { FuncId, Id, Loc, TypeId, Language } from "@/next/ast/common";
import type { Expression, Number, String } from "@/next/ast/expression";
import type { Statement } from "@/next/ast/statement";
import type { TFunction, Type, TypedParameter } from "@/next/ast/type";
import type { RelativePath } from "@/next/fs";

export type Source = {
    readonly file: string | undefined;
    readonly contents: string;
    readonly root: Module;
};

export type Module = {
    readonly kind: "module";
    readonly imports: readonly Import[];
    readonly items: ModuleItems;
};
export type ModuleItems = {
    readonly functions: readonly Function[];
    readonly constants: readonly Constant[];
    readonly extensions: readonly Extension[];
    readonly types: readonly TypeDecl[];
};
export type TypeDecl =
    | StructDecl
    | MessageDecl
    | UnionDecl
    | AliasDecl
    | Contract
    | Trait;
export type Import = {
    readonly kind: "import";
    readonly importPath: ImportPath;
    readonly loc: Loc;
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

export type Contract = {
    readonly kind: "contract";
    readonly init: undefined | Init;

    readonly name: TypeId;
    readonly traits: readonly TypeId[];
    readonly attributes: readonly ContractAttribute[];
    readonly declarations: LocalItems;
    readonly loc: Loc;
};

export type Init = InitFunction | InitParams;
export type InitFunction = {
    readonly kind: "init_function";
    readonly params: readonly TypedParameter[];
    readonly statements: readonly Statement[];
    readonly loc: Loc;
};
export type InitParams = {
    readonly kind: "init_params";
    readonly params: readonly FieldDecl[];
    readonly loc: Loc;
};

export type Trait = {
    readonly kind: "trait";

    readonly name: TypeId;
    readonly traits: readonly TypeId[];
    readonly attributes: readonly ContractAttribute[];
    readonly declarations: LocalItems;
    readonly loc: Loc;
};

export type LocalItems = {
    readonly fields: readonly FieldDecl[];
    readonly methods: readonly Method[];
    readonly receivers: readonly Receiver[];
    readonly constants: readonly FieldConstant[];
};

export type ContractAttribute = {
    readonly type: "interface";
    readonly name: string;
    readonly loc: Loc;
};

export type Extension = {
    readonly kind: "extension";
    readonly mutates: boolean;
    readonly fun: Function;
    readonly selfType: Type;
};

export type Method = {
    readonly kind: "method";
    readonly mutates: boolean;
    readonly overridable: boolean;
    readonly override: boolean;
    readonly get: undefined | GetAttribute;
    readonly fun: Function;
};

export type GetAttribute = {
    readonly methodId: Expression | undefined;
    readonly loc: Loc;
};

export type Function = {
    readonly kind: "function";
    readonly inline: boolean;
    readonly name: Id;
    readonly type: TFunction;
    readonly body: FunctionalBody;
    readonly loc: Loc;
};

export type FunctionalBody = RegularBody | AsmBody | NativeBody | AbstractBody;
export type AbstractBody = {
    readonly kind: "abstract_body";
};
export type RegularBody = {
    readonly kind: "regular_body";
    readonly statements: readonly Statement[];
};
export type NativeBody = {
    readonly kind: "native_body";
    readonly nativeName: FuncId;
};
export type AsmBody = {
    readonly kind: "asm_body";
    readonly shuffle: AsmShuffle;
    readonly instructions: readonly AsmInstruction[];
};
export type AsmInstruction = string;
export type AsmShuffle = {
    readonly args: readonly Id[];
    readonly ret: readonly Number[];
};

export type FieldConstant = {
    readonly kind: "field_const";
    readonly overridable: boolean;
    readonly override: boolean;
    readonly body: Constant;
};
export type Constant = {
    readonly kind: "constant";
    readonly name: Id;
    readonly init: ConstantInit;
    readonly loc: Loc;
};
export type ConstantInit = ConstantDef | ConstantDecl;
export type ConstantDef = {
    readonly kind: "constant_def";
    readonly type: Type | undefined;
    readonly initializer: Expression;
};
export type ConstantDecl = {
    readonly kind: "constant_decl";
    readonly type: Type;
};

export type StructDecl = {
    readonly kind: "struct_decl";
    readonly name: TypeId;
    readonly typeParams: readonly TypeId[];
    readonly fields: readonly FieldDecl[];
    readonly loc: Loc;
};

export type MessageDecl = {
    readonly kind: "message_decl";
    readonly name: TypeId;
    readonly opcode: Expression | undefined;
    readonly fields: readonly FieldDecl[];
    readonly loc: Loc;
};

export type UnionDecl = {
    readonly kind: "union_decl";
    readonly name: TypeId;
    readonly typeParams: readonly TypeId[];
    readonly cases: readonly UnionCase[];
    readonly loc: Loc;
};
export type UnionCase = {
    readonly name: TypeId;
    readonly fields: readonly FieldDecl[];
};

export type AliasDecl = {
    readonly kind: "alias_decl";
    readonly name: TypeId;
    readonly typeParams: readonly TypeId[];
    readonly type: Type;
    readonly loc: Loc;
};

export type FieldDecl = {
    readonly kind: "field_decl";
    readonly name: Id;
    readonly type: Type;
    readonly initializer: Expression | undefined;
    readonly loc: Loc;
};

export type Receiver = {
    readonly kind: "receiver";
    readonly selector: ReceiverKind;
    readonly statements: readonly Statement[];
    readonly loc: Loc;
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
    readonly loc: Loc;
};
export type ReceiverExternal = {
    readonly kind: "external";
    readonly subKind: ReceiverSubKind;
    readonly loc: Loc;
};
export type ReceiverBounce = {
    readonly kind: "bounce";
    readonly param: TypedParameter;
    readonly loc: Loc;
};
export type ReceiverKind = ReceiverInternal | ReceiverExternal | ReceiverBounce;
