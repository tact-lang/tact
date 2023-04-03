import { ABIField, Address, Cell } from "ton-core";
import { ASTFunction, ASTInitFunction, ASTNativeFunction, ASTNode, ASTReceive, ASTRef, ASTStatement, ASTType } from "../grammar/ast";

export type TypeOrigin = 'stdlib' | 'user';

export type TypeDescription = {
    kind: 'struct' | 'primitive' | 'contract' | 'trait' | 'partial_struct';
    origin: TypeOrigin;
    name: string;
    uid: number;
    header: number | null;
    tlb: string | null;
    signature: string | null;
    fields: FieldDescription[];
    traits: TypeDescription[];
    functions: Map<string, FunctionDescription>;
    receivers: ReceiverDescription[];
    init: InitDescription | null;
    ast: ASTType;
    dependsOn: TypeDescription[];
    interfaces: string[];
    constants: ConstantDescription[];
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
    default: bigint | boolean | string | null | Address | Cell | undefined,
    ref: ASTRef,
    ast: ASTNode,
    abi: ABIField
}

export type ConstantDescription = {
    name: string;
    type: TypeRef;
    value: bigint | boolean | string | Address | Cell | null;
    ref: ASTRef,
    ast: ASTNode
}

export type FunctionArgument = {
    name: string,
    type: TypeRef,
    as: string | null,
    ref: ASTRef
}

export type FunctionDescription = {
    name: string,
    origin: TypeOrigin,
    isPublic: boolean,
    isGetter: boolean,
    isMutating: boolean,
    isOverrides: boolean,
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
    kind: 'internal-comment-fallback',
    name: string
} | {
    kind: 'internal-fallback',
    name: string
} | {
    kind: 'internal-bounce',
    name: string,
    type: string,
    isGeneric: boolean
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