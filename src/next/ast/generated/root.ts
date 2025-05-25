/* eslint-disable @typescript-eslint/no-unnecessary-condition */
import type * as $c from "@/next/ast/common";
import type * as $e from "@/next/ast/expression";
import type * as $s from "@/next/ast/statement";
import type * as $t from "@/next/ast/type";
import type * as $f from "@/next/fs";
import type * as $ from "@/next/ast/root";
export type ImportType = $.ImportType;
export const allImportType: readonly $.ImportType[] = ["stdlib", "relative"];
export type ImportPath = $.ImportPath;
export const ImportPath = (path: $f.RelativePath, type_: $.ImportType, language: $c.Language): $.ImportPath => Object.freeze({
    path,
    type: type_,
    language
});
export type Import = $.Import;
export const Import = (importPath: $.ImportPath, loc: $c.Loc): $.Import => Object.freeze({
    kind: "import",
    importPath,
    loc
});
export const isImport = ($value: Import) => $value.kind === "import";
export type RegularBody = $.RegularBody;
export const RegularBody = (statements: readonly $s.Statement[]): $.RegularBody => Object.freeze({
    kind: "regular_body",
    statements
});
export const isRegularBody = ($value: RegularBody) => $value.kind === "regular_body";
export type AsmShuffle = $.AsmShuffle;
export const AsmShuffle = (args: readonly $c.Id[], ret: readonly $e.Number[]): $.AsmShuffle => Object.freeze({
    args,
    ret
});
export type AsmInstruction = $.AsmInstruction;
export type AsmBody = $.AsmBody;
export const AsmBody = (shuffle: $.AsmShuffle, instructions: readonly $.AsmInstruction[]): $.AsmBody => Object.freeze({
    kind: "asm_body",
    shuffle,
    instructions
});
export const isAsmBody = ($value: AsmBody) => $value.kind === "asm_body";
export type NativeBody = $.NativeBody;
export const NativeBody = (nativeName: $c.FuncId): $.NativeBody => Object.freeze({
    kind: "native_body",
    nativeName
});
export const isNativeBody = ($value: NativeBody) => $value.kind === "native_body";
export type AbstractBody = $.AbstractBody;
export const AbstractBody = (): $.AbstractBody => Object.freeze({
    kind: "abstract_body"
});
export const isAbstractBody = ($value: AbstractBody) => $value.kind === "abstract_body";
export type FunctionalBody = $.FunctionalBody;
export type Function = $.Function;
export const Function = (inline: boolean, name: $c.Id, type_: $t.FnType, body: $.FunctionalBody, loc: $c.Loc): $.Function => Object.freeze({
    kind: "function",
    inline,
    name,
    type: type_,
    body,
    loc
});
export const isFunction = ($value: Function) => $value.kind === "function";
export type ConstantDef = $.ConstantDef;
export const ConstantDef = (type_: $t.Type | undefined, initializer: $e.Expression): $.ConstantDef => Object.freeze({
    kind: "constant_def",
    type: type_,
    initializer
});
export const isConstantDef = ($value: ConstantDef) => $value.kind === "constant_def";
export type ConstantDecl = $.ConstantDecl;
export const ConstantDecl = (type_: $t.Type): $.ConstantDecl => Object.freeze({
    kind: "constant_decl",
    type: type_
});
export const isConstantDecl = ($value: ConstantDecl) => $value.kind === "constant_decl";
export type ConstantInit = $.ConstantInit;
export type Constant = $.Constant;
export const Constant = (name: $c.Id, init: $.ConstantInit, loc: $c.Loc): $.Constant => Object.freeze({
    kind: "constant",
    name,
    init,
    loc
});
export const isConstant = ($value: Constant) => $value.kind === "constant";
export type Extension = $.Extension;
export const Extension = (mutates: boolean, fun: $.Function, selfType: $t.Type): $.Extension => Object.freeze({
    kind: "extension",
    mutates,
    fun,
    selfType
});
export const isExtension = ($value: Extension) => $value.kind === "extension";
export type FieldDecl = $.FieldDecl;
export const FieldDecl = (name: $c.Id, type_: $t.Type, initializer: $e.Expression | undefined, loc: $c.Loc): $.FieldDecl => Object.freeze({
    kind: "field_decl",
    name,
    type: type_,
    initializer,
    loc
});
export const isFieldDecl = ($value: FieldDecl) => $value.kind === "field_decl";
export type StructDecl = $.StructDecl;
export const StructDecl = (name: $c.TypeId, typeParams: readonly $c.TypeId[], fields: readonly $.FieldDecl[], loc: $c.Loc): $.StructDecl => Object.freeze({
    kind: "struct_decl",
    name,
    typeParams,
    fields,
    loc
});
export const isStructDecl = ($value: StructDecl) => $value.kind === "struct_decl";
export type MessageDecl = $.MessageDecl;
export const MessageDecl = (name: $c.TypeId, opcode: $e.Expression | undefined, fields: readonly $.FieldDecl[], loc: $c.Loc): $.MessageDecl => Object.freeze({
    kind: "message_decl",
    name,
    opcode,
    fields,
    loc
});
export const isMessageDecl = ($value: MessageDecl) => $value.kind === "message_decl";
export type UnionCase = $.UnionCase;
export const UnionCase = (name: $c.TypeId, fields: readonly $.FieldDecl[]): $.UnionCase => Object.freeze({
    name,
    fields
});
export type UnionDecl = $.UnionDecl;
export const UnionDecl = (name: $c.TypeId, typeParams: readonly $c.TypeId[], cases: readonly $.UnionCase[], loc: $c.Loc): $.UnionDecl => Object.freeze({
    kind: "union_decl",
    name,
    typeParams,
    cases,
    loc
});
export const isUnionDecl = ($value: UnionDecl) => $value.kind === "union_decl";
export type AliasDecl = $.AliasDecl;
export const AliasDecl = (name: $c.TypeId, typeParams: readonly $c.TypeId[], type_: $t.Type, loc: $c.Loc): $.AliasDecl => Object.freeze({
    kind: "alias_decl",
    name,
    typeParams,
    type: type_,
    loc
});
export const isAliasDecl = ($value: AliasDecl) => $value.kind === "alias_decl";
export type InitFunction = $.InitFunction;
export const InitFunction = (args: readonly $t.TypedParameter[], statements: readonly $s.Statement[], loc: $c.Loc): $.InitFunction => Object.freeze({
    kind: "init_function",
    args,
    statements,
    loc
});
export const isInitFunction = ($value: InitFunction) => $value.kind === "init_function";
export type InitParams = $.InitParams;
export const InitParams = (params: readonly $.FieldDecl[]): $.InitParams => Object.freeze({
    kind: "init_params",
    params
});
export const isInitParams = ($value: InitParams) => $value.kind === "init_params";
export type Init = $.Init;
export type ContractAttribute = $.ContractAttribute;
export const ContractAttribute = (name: string, loc: $c.Loc): $.ContractAttribute => Object.freeze({
    type: "interface",
    name,
    loc
});
export type GetAttribute = $.GetAttribute;
export const GetAttribute = (methodId: $e.Expression | undefined, loc: $c.Loc): $.GetAttribute => Object.freeze({
    methodId,
    loc
});
export type Method = $.Method;
export const Method = (mutates: boolean, overridable: boolean, override: boolean, get: $.GetAttribute | undefined, fun: $.Function): $.Method => Object.freeze({
    kind: "method",
    mutates,
    overridable,
    override,
    get,
    fun
});
export const isMethod = ($value: Method) => $value.kind === "method";
export type ReceiverSimple = $.ReceiverSimple;
export const ReceiverSimple = (param: $t.TypedParameter): $.ReceiverSimple => Object.freeze({
    kind: "simple",
    param
});
export const isReceiverSimple = ($value: ReceiverSimple) => $value.kind === "simple";
export type ReceiverFallback = $.ReceiverFallback;
export const ReceiverFallback = (): $.ReceiverFallback => Object.freeze({
    kind: "fallback"
});
export const isReceiverFallback = ($value: ReceiverFallback) => $value.kind === "fallback";
export type ReceiverComment = $.ReceiverComment;
export const ReceiverComment = (comment: $e.String): $.ReceiverComment => Object.freeze({
    kind: "comment",
    comment
});
export const isReceiverComment = ($value: ReceiverComment) => $value.kind === "comment";
export type ReceiverSubKind = $.ReceiverSubKind;
export type ReceiverInternal = $.ReceiverInternal;
export const ReceiverInternal = (subKind: $.ReceiverSubKind, loc: $c.Loc): $.ReceiverInternal => Object.freeze({
    kind: "internal",
    subKind,
    loc
});
export const isReceiverInternal = ($value: ReceiverInternal) => $value.kind === "internal";
export type ReceiverExternal = $.ReceiverExternal;
export const ReceiverExternal = (subKind: $.ReceiverSubKind, loc: $c.Loc): $.ReceiverExternal => Object.freeze({
    kind: "external",
    subKind,
    loc
});
export const isReceiverExternal = ($value: ReceiverExternal) => $value.kind === "external";
export type ReceiverBounce = $.ReceiverBounce;
export const ReceiverBounce = (param: $t.TypedParameter, loc: $c.Loc): $.ReceiverBounce => Object.freeze({
    kind: "bounce",
    param,
    loc
});
export const isReceiverBounce = ($value: ReceiverBounce) => $value.kind === "bounce";
export type ReceiverKind = $.ReceiverKind;
export type Receiver = $.Receiver;
export const Receiver = (selector: $.ReceiverKind, statements: readonly $s.Statement[], loc: $c.Loc): $.Receiver => Object.freeze({
    kind: "receiver",
    selector,
    statements,
    loc
});
export const isReceiver = ($value: Receiver) => $value.kind === "receiver";
export type FieldConstant = $.FieldConstant;
export const FieldConstant = (overridable: boolean, override: boolean, body: $.Constant): $.FieldConstant => Object.freeze({
    kind: "field_const",
    overridable,
    override,
    body
});
export const isFieldConstant = ($value: FieldConstant) => $value.kind === "field_const";
export type LocalItems = $.LocalItems;
export const LocalItems = (fields: readonly $.FieldDecl[], methods: readonly $.Method[], receivers: readonly $.Receiver[], constants: readonly $.FieldConstant[]): $.LocalItems => Object.freeze({
    fields,
    methods,
    receivers,
    constants
});
export type Contract = $.Contract;
export const Contract = (init: $.Init | undefined, name: $c.TypeId, traits: readonly $c.TypeId[], attributes: readonly $.ContractAttribute[], declarations: $.LocalItems, loc: $c.Loc): $.Contract => Object.freeze({
    kind: "contract",
    init,
    name,
    traits,
    attributes,
    declarations,
    loc
});
export const isContract = ($value: Contract) => $value.kind === "contract";
export type Trait = $.Trait;
export const Trait = (name: $c.TypeId, traits: readonly $c.TypeId[], attributes: readonly $.ContractAttribute[], declarations: $.LocalItems, loc: $c.Loc): $.Trait => Object.freeze({
    kind: "trait",
    name,
    traits,
    attributes,
    declarations,
    loc
});
export const isTrait = ($value: Trait) => $value.kind === "trait";
export type TypeDecl = $.TypeDecl;
export type ModuleItems = $.ModuleItems;
export const ModuleItems = (functions: readonly $.Function[], constants: readonly $.Constant[], extensions: readonly $.Extension[], types: readonly $.TypeDecl[]): $.ModuleItems => Object.freeze({
    functions,
    constants,
    extensions,
    types
});
export type Module = $.Module;
export const Module = (imports: readonly $.Import[], items: $.ModuleItems): $.Module => Object.freeze({
    kind: "module",
    imports,
    items
});
export const isModule = ($value: Module) => $value.kind === "module";
export type Source = $.Source;
export const Source = (file: string | undefined, contents: string, root: $.Module): $.Source => Object.freeze({
    file,
    contents,
    root
});