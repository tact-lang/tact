import { ASTFunction, ASTInitFunction, ASTNativeFunction } from "../ast/ast";

export type TypeDescription = {
    kind: 'struct' | 'primitive' | 'contract';
    name: string;
    fields: FieldDescription[];
    functions: FunctionDescription[];
    init: InitDescription | null;
}

export type TypeRef = {
    kind: 'direct',
    name: string;
} | {
    kind: 'optional',
    inner: TypeRef
};

export type FieldDescription = {
    name: string,
    index: number,
    type: TypeRef
}

export type FunctionArgument = {
    name: string,
    type: TypeRef
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

export type InitDescription = {
    args: FunctionArgument[],
    ast: ASTInitFunction
}

export function printTypeRef(src: TypeRef | null): string {
    if (!src) {
        return '<null>';
    } else if (src.kind === 'direct') {
        return src.name;
    } else if (src.kind === 'optional') {
        return printTypeRef(src.inner) + '?';
    } else {
        throw Error('Invalid type ref');
    }
}