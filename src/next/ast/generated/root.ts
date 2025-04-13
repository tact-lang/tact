/* eslint-disable @typescript-eslint/no-unnecessary-condition */
import type * as $c from "@/next/ast/common";
import type * as $e from "@/next/ast/expression";
import type * as $s from "@/next/ast/statement";
import type * as $t from "@/next/ast/type";
import type * as $ from "@/next/ast/root";
export type ImportType = $.ImportType;
export const allImportType: readonly $.ImportType[] = ["stdlib", "relative"];
export type ImportPath = $.ImportPath;
export const ImportPath = (path: $c.RelativePath, type_: $.ImportType, language: $c.Language): $.ImportPath => Object.freeze({
    path,
    type: type_,
    language
});
export type Import = $.Import;
export const Import = (importPath: $.ImportPath, loc: $c.Range): $.Import => Object.freeze({
    kind: "import",
    importPath,
    loc
});
export const isImport = ($value: Import) => $value.kind === "import";
export type FunctionAttributeGet = $.FunctionAttributeGet;
export const FunctionAttributeGet = (methodId: $e.Expression | undefined, loc: $c.Range): $.FunctionAttributeGet => Object.freeze({
    kind: "function_attribute",
    type: "get",
    methodId,
    loc
});
export const isFunctionAttributeGet = ($value: FunctionAttributeGet) => $value.kind === "function_attribute";
export type FunctionAttributeName = $.FunctionAttributeName;
export const allFunctionAttributeName: readonly $.FunctionAttributeName[] = ["mutates", "extends", "virtual", "abstract", "override", "inline"];
export type FunctionAttributeRest = $.FunctionAttributeRest;
export const FunctionAttributeRest = (type_: $.FunctionAttributeName, loc: $c.Range): $.FunctionAttributeRest => Object.freeze({
    kind: "function_attribute",
    type: type_,
    loc
});
export const isFunctionAttributeRest = ($value: FunctionAttributeRest) => $value.kind === "function_attribute";
export type FunctionAttribute = $.FunctionAttribute;
export type TypedParameter = $.TypedParameter;
export const TypedParameter = (name: $c.OptionalId, type_: $t.Type, loc: $c.Range): $.TypedParameter => Object.freeze({
    kind: "typed_parameter",
    name,
    type: type_,
    loc
});
export const isTypedParameter = ($value: TypedParameter) => $value.kind === "typed_parameter";
export type FunctionDef = $.FunctionDef;
export const FunctionDef = (attributes: readonly $.FunctionAttribute[], name: $c.Id, typeParams: readonly $c.TypeId[], return_: $t.Type | undefined, params: readonly $.TypedParameter[], statements: readonly $s.Statement[], loc: $c.Range): $.FunctionDef => Object.freeze({
    kind: "function_def",
    attributes,
    name,
    typeParams,
    return: return_,
    params,
    statements,
    loc
});
export const isFunctionDef = ($value: FunctionDef) => $value.kind === "function_def";
export type AsmShuffle = $.AsmShuffle;
export const AsmShuffle = (args: readonly $c.Id[], ret: readonly $e.Number[]): $.AsmShuffle => Object.freeze({
    args,
    ret
});
export type AsmInstruction = $.AsmInstruction;
export type AsmFunctionDef = $.AsmFunctionDef;
export const AsmFunctionDef = (shuffle: $.AsmShuffle, attributes: readonly $.FunctionAttribute[], name: $c.Id, typeParams: readonly $c.TypeId[], return_: $t.Type | undefined, params: readonly $.TypedParameter[], instructions: readonly $.AsmInstruction[], loc: $c.Range): $.AsmFunctionDef => Object.freeze({
    kind: "asm_function_def",
    shuffle,
    attributes,
    name,
    typeParams,
    return: return_,
    params,
    instructions,
    loc
});
export const isAsmFunctionDef = ($value: AsmFunctionDef) => $value.kind === "asm_function_def";
export type NativeFunctionDecl = $.NativeFunctionDecl;
export const NativeFunctionDecl = (attributes: readonly $.FunctionAttribute[], name: $c.Id, typeParams: readonly $c.TypeId[], nativeName: $c.FuncId, params: readonly $.TypedParameter[], return_: $t.Type | undefined, loc: $c.Range): $.NativeFunctionDecl => Object.freeze({
    kind: "native_function_decl",
    attributes,
    name,
    typeParams,
    nativeName,
    params,
    return: return_,
    loc
});
export const isNativeFunctionDecl = ($value: NativeFunctionDecl) => $value.kind === "native_function_decl";
export type ConstantAttributeName = $.ConstantAttributeName;
export const allConstantAttributeName: readonly $.ConstantAttributeName[] = ["virtual", "override", "abstract"];
export type ConstantAttribute = $.ConstantAttribute;
export const ConstantAttribute = (type_: $.ConstantAttributeName, loc: $c.Range): $.ConstantAttribute => Object.freeze({
    type: type_,
    loc
});
export type ConstantDef = $.ConstantDef;
export const ConstantDef = (attributes: readonly $.ConstantAttribute[], name: $c.Id, type_: $t.Type | undefined, initializer: $e.Expression, loc: $c.Range): $.ConstantDef => Object.freeze({
    kind: "constant_def",
    attributes,
    name,
    type: type_,
    initializer,
    loc
});
export const isConstantDef = ($value: ConstantDef) => $value.kind === "constant_def";
export type FieldDecl = $.FieldDecl;
export const FieldDecl = (name: $c.Id, type_: $t.Type, initializer: $e.Expression | undefined, loc: $c.Range): $.FieldDecl => Object.freeze({
    kind: "field_decl",
    name,
    type: type_,
    initializer,
    loc
});
export const isFieldDecl = ($value: FieldDecl) => $value.kind === "field_decl";
export type StructDecl = $.StructDecl;
export const StructDecl = (name: $c.TypeId, typeParams: readonly $c.TypeId[], fields: readonly $.FieldDecl[], loc: $c.Range): $.StructDecl => Object.freeze({
    kind: "struct_decl",
    name,
    typeParams,
    fields,
    loc
});
export const isStructDecl = ($value: StructDecl) => $value.kind === "struct_decl";
export type MessageDecl = $.MessageDecl;
export const MessageDecl = (name: $c.TypeId, opcode: $e.Expression | undefined, fields: readonly $.FieldDecl[], loc: $c.Range): $.MessageDecl => Object.freeze({
    kind: "message_decl",
    name,
    opcode,
    fields,
    loc
});
export const isMessageDecl = ($value: MessageDecl) => $value.kind === "message_decl";
export type ContractAttribute = $.ContractAttribute;
export const ContractAttribute = (name: string, loc: $c.Range): $.ContractAttribute => Object.freeze({
    type: "interface",
    name,
    loc
});
export type ContractInit = $.ContractInit;
export const ContractInit = (params: readonly $.TypedParameter[], statements: readonly $s.Statement[], loc: $c.Range): $.ContractInit => Object.freeze({
    kind: "contract_init",
    params,
    statements,
    loc
});
export const isContractInit = ($value: ContractInit) => $value.kind === "contract_init";
export type ReceiverSimple = $.ReceiverSimple;
export const ReceiverSimple = (param: $.TypedParameter): $.ReceiverSimple => Object.freeze({
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
export const ReceiverInternal = (subKind: $.ReceiverSubKind, loc: $c.Range): $.ReceiverInternal => Object.freeze({
    kind: "internal",
    subKind,
    loc
});
export const isReceiverInternal = ($value: ReceiverInternal) => $value.kind === "internal";
export type ReceiverExternal = $.ReceiverExternal;
export const ReceiverExternal = (subKind: $.ReceiverSubKind, loc: $c.Range): $.ReceiverExternal => Object.freeze({
    kind: "external",
    subKind,
    loc
});
export const isReceiverExternal = ($value: ReceiverExternal) => $value.kind === "external";
export type ReceiverBounce = $.ReceiverBounce;
export const ReceiverBounce = (param: $.TypedParameter, loc: $c.Range): $.ReceiverBounce => Object.freeze({
    kind: "bounce",
    param,
    loc
});
export const isReceiverBounce = ($value: ReceiverBounce) => $value.kind === "bounce";
export type ReceiverKind = $.ReceiverKind;
export type Receiver = $.Receiver;
export const Receiver = (selector: $.ReceiverKind, statements: readonly $s.Statement[], loc: $c.Range): $.Receiver => Object.freeze({
    kind: "receiver",
    selector,
    statements,
    loc
});
export const isReceiver = ($value: Receiver) => $value.kind === "receiver";
export type ContractItem = $.ContractItem;
export type Contract = $.Contract;
export const Contract = (name: $c.TypeId, traits: readonly $c.TypeId[], attributes: readonly $.ContractAttribute[], params: readonly $.FieldDecl[] | undefined, declarations: readonly $.ContractItem[], loc: $c.Range): $.Contract => Object.freeze({
    kind: "contract",
    name,
    traits,
    attributes,
    params,
    declarations,
    loc
});
export const isContract = ($value: Contract) => $value.kind === "contract";
export type FunctionDecl = $.FunctionDecl;
export const FunctionDecl = (attributes: readonly $.FunctionAttribute[], name: $c.Id, typeParams: readonly $c.TypeId[], return_: $t.Type | undefined, params: readonly $.TypedParameter[], loc: $c.Range): $.FunctionDecl => Object.freeze({
    kind: "function_decl",
    attributes,
    name,
    typeParams,
    return: return_,
    params,
    loc
});
export const isFunctionDecl = ($value: FunctionDecl) => $value.kind === "function_decl";
export type ConstantDecl = $.ConstantDecl;
export const ConstantDecl = (attributes: readonly $.ConstantAttribute[], name: $c.Id, type_: $t.Type, loc: $c.Range): $.ConstantDecl => Object.freeze({
    kind: "constant_decl",
    attributes,
    name,
    type: type_,
    loc
});
export const isConstantDecl = ($value: ConstantDecl) => $value.kind === "constant_decl";
export type TraitItem = $.TraitItem;
export type Trait = $.Trait;
export const Trait = (name: $c.TypeId, traits: readonly $c.TypeId[], attributes: readonly $.ContractAttribute[], declarations: readonly $.TraitItem[], loc: $c.Range): $.Trait => Object.freeze({
    kind: "trait",
    name,
    traits,
    attributes,
    declarations,
    loc
});
export const isTrait = ($value: Trait) => $value.kind === "trait";
export type ModuleItem = $.ModuleItem;
export type Module = $.Module;
export const Module = (imports: readonly $.Import[], items: readonly $.ModuleItem[]): $.Module => Object.freeze({
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
export type UnionCase = $.UnionCase;
export const UnionCase = (name: $c.TypeId, fields: readonly $.FieldDecl[]): $.UnionCase => Object.freeze({
    name,
    fields
});
export type UnionDecl = $.UnionDecl;
export const UnionDecl = (name: $c.TypeId, typeParams: readonly $c.TypeId[], cases: readonly $.UnionCase[], loc: $c.Range): $.UnionDecl => Object.freeze({
    kind: "union_decl",
    name,
    typeParams,
    cases,
    loc
});
export const isUnionDecl = ($value: UnionDecl) => $value.kind === "union_decl";