import { ASTFunction, ASTInitFunction, ASTNativeFunction, ASTReceive, ASTType } from "../ast/ast";

export type TypeDescription = {
    kind: 'struct' | 'primitive' | 'contract';
    name: string;
    fields: FieldDescription[];
    functions: FunctionDescription[];
    receivers: ReceiverDescription[];
    init: InitDescription | null;
    ast: ASTType
}

export type TypeRef = {
    kind: 'ref',
    name: string,
    optional: boolean
} | {
    kind: 'map',
    key: string,
    value: string
};

export type FieldDescription = {
    name: string,
    index: number,
    type: TypeRef,
    as: string | null,
    default: bigint | boolean | null | undefined
}

export type FunctionArgument = {
    name: string,
    type: TypeRef,
    as: string | null
}

export type FunctionDescription = {
    name: string,
    isPublic: boolean,
    isGetter: boolean,
    self: TypeDescription | null,
    returns: TypeRef | null,
    args: FunctionArgument[],
    ast: ASTFunction | ASTNativeFunction
}

export type ReceiverDescription = {
    type: string,
    name: string,
    ast: ASTReceive
}

export type InitDescription = {
    args: FunctionArgument[],
    ast: ASTInitFunction
}

export function printTypeRef(src: TypeRef | null): string {
    if (!src) {
        return '<null>';
    } else if (src.kind === 'ref') {
        return src.name + (src.optional ? '?' : '');
    } else {
        throw Error('Invalid type ref');
    }
}