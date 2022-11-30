import { ASTFunction, ASTNativeFunction } from "../ast/ast";

export type TypeDescription = {
    kind: 'struct' | 'primitive' | 'contract';
    name: string;
    fields: FieldDescription[];
    functions: FunctionDescription[];
}

export type FieldDescription = {
    name: string,
    type: TypeDescription
}

export type FunctionArgument = {
    name: string,
    type: TypeDescription
}

export type FunctionDescription = {
    name: string,
    self: TypeDescription | null,
    returns: TypeDescription | null,
    args: FunctionArgument[],
    ast: ASTFunction | ASTNativeFunction
}