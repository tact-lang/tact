import { ASTFunction, ASTInitFunction, ASTNativeFunction, ASTReceive, ASTRef, ASTStatement, ASTType } from "../grammar/ast";

export type TypeDescription = {
    kind: 'struct' | 'primitive' | 'contract' | 'trait';
    name: string;
    uid: number;
    fields: FieldDescription[];
    traits: TypeDescription[];
    functions: { [name: string]: FunctionDescription };
    receivers: ReceiverDescription[];
    init: InitDescription | null;
    ast: ASTType;
    dependsOn: TypeDescription[];
}

export type TypeRef = {
    kind: 'ref',
    name: string,
    optional: boolean
} | {
    kind: 'map',
    key: string,
    value: string
} | {
    kind: 'void'
} | {
    kind: 'null'
};

export type FieldDescription = {
    name: string,
    index: number,
    type: TypeRef,
    as: string | null,
    default: bigint | boolean | null | undefined,
    ref: ASTRef
}

export type FunctionArgument = {
    name: string,
    type: TypeRef,
    as: string | null,
    ref: ASTRef
}

export type FunctionDescription = {
    name: string,
    isPublic: boolean,
    isGetter: boolean,
    isMutating: boolean,
    isOverwrites: boolean,
    isVirtual: boolean,
    self: string | null,
    returns: TypeRef,
    args: FunctionArgument[],
    ast: ASTFunction | ASTNativeFunction
}

export type StatementDescription = {
    kind: 'native',
    src: ASTStatement
} | {
    kind: 'intrinsic'
}

export type ReceiverSelector = {
    kind: 'internal-binary',
    type: string,
    name: string,
} | {
    kind: 'internal-empty'
} | {
    kind: 'internal-comment',
    comment: string
} | {
    kind: 'internal-fallback',
    name: string
} | {
    kind: 'internal-bounce',
    name: string
};

export type ReceiverDescription = {
    selector: ReceiverSelector,
    ast: ASTReceive
}

export type InitDescription = {
    args: FunctionArgument[],
    ast: ASTInitFunction
}

export function printTypeRef(src: TypeRef): string {
    if (src.kind === 'ref') {
        return src.name + (src.optional ? '?' : '');
    } else if (src.kind === 'map') {
        return `map[${src.key}]${src.value}`;
    } else if (src.kind === 'void') {
        return '<void>';
    } else if (src.kind === 'null') {
        return '<null>';
    } else {
        throw Error('Invalid type ref');
    }
}

export function typeRefEquals(a: TypeRef, b: TypeRef) {
    if (a.kind !== b.kind) {
        return false;
    }
    if (a.kind === 'ref' && b.kind === 'ref') {
        return a.name === b.name && a.optional === b.optional;
    }
    if (a.kind === 'map' && b.kind === 'map') {
        return a.key === b.key && a.value === b.value;
    }
    if (a.kind === 'null' && b.kind === 'null') {
        return true;
    }
    if (a.kind === 'void' && b.kind === 'void') {
        return true;
    }
    return false;
}