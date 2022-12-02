import { Interval as RawInterval, Node as RawNode } from 'ohm-js';

export class ASTRef {
    readonly #interval: RawInterval;

    constructor(interval: RawInterval) {
        this.#interval = interval;
    }

    get contents() {
        return this.#interval.contents;
    }

    get interval() {
        return this.#interval;
    }
}

export type ASTPrimitive = {
    kind: 'primitive',
    id: number,
    name: string,
    ref: ASTRef
}

//
// Values
//

export type ASTNumber = {
    kind: 'number',
    id: number,
    value: bigint,
    ref: ASTRef
}

export type ASTID = {
    kind: 'id',
    id: number,
    value: string,
    ref: ASTRef
}

export type ASTBoolean = {
    kind: 'boolean',
    id: number,
    value: boolean,
    ref: ASTRef
}

export type ASTNull = {
    kind: 'null',
    id: number,
    ref: ASTRef
}

//
// Types
//

export type ASTTypeRef = {
    kind: 'type_ref',
    id: number,
    name: string,
    optional: boolean,
    ref: ASTRef
}

//
// Expressions
//

export type ASTOpBinary = {
    kind: 'op_binary',
    id: number,
    op: '+' | '-' | '*' | '/' | '!=' | '>' | '<' | '>=' | '<=' | '==' | '&&' | '||',
    left: ASTExpression,
    right: ASTExpression,
    ref: ASTRef
}

export type ASTOpUnary = {
    kind: 'op_unary',
    id: number,
    op: '+' | '-' | '!' | '!!',
    right: ASTExpression,
    ref: ASTRef
}

export type ASTOpField = {
    kind: 'op_field'
    id: number,
    src: ASTExpression,
    name: string,
    ref: ASTRef
}

export type ASTOpCall = {
    kind: 'op_call'
    id: number,
    src: ASTExpression,
    name: string,
    args: ASTExpression[],
    ref: ASTRef
}

export type ASTOpCallStatic = {
    kind: 'op_static_call'
    id: number,
    name: string,
    args: ASTExpression[],
    ref: ASTRef
}

export type ASTOpNew = {
    kind: 'op_new'
    id: number,
    type: string,
    args: ASTNewParameter[],
    ref: ASTRef
}

export type ASTNewParameter = {
    kind: 'new_parameter'
    id: number,
    name: string,
    exp: ASTExpression,
    ref: ASTRef
}

//
// Program
//

export type ASTProgram = {
    kind: 'program',
    id: number,
    entries: (ASTStruct | ASTContract | ASTPrimitive | ASTFunction | ASTNativeFunction)[]
}

export type ASTStruct = {
    kind: 'def_struct',
    id: number,
    name: string
    fields: ASTField[],
    ref: ASTRef
}

export type ASTField = {
    kind: 'def_field',
    id: number,
    name: string,
    type: ASTTypeRef,
    ref: ASTRef
}

export type ASTContract = {
    kind: 'def_contract',
    id: number,
    name: string,
    declarations: (ASTField | ASTFunction)[],
    ref: ASTRef
}

export type ASTArgument = {
    kind: 'def_argument',
    id: number,
    name: string,
    type: ASTTypeRef,
    ref: ASTRef
}

export type ASTFunctionAttribute = { type: 'public' } | { type: 'get' };

export type ASTFunction = {
    kind: 'def_function',
    id: number,
    attribute: ASTFunctionAttribute[],
    name: string,
    return: ASTTypeRef | null,
    args: ASTArgument[],
    statements: ASTStatement[],
    ref: ASTRef
}

export type ASTNativeFunction = {
    kind: 'def_native_function',
    id: number,
    name: string,
    nativeName: string,
    return: ASTTypeRef | null,
    args: ASTArgument[],
    ref: ASTRef
}

//
// Statements
//

export type ASTStatementLet = {
    kind: 'statement_let',
    id: number,
    name: string,
    type: ASTTypeRef,
    expression: ASTExpression,
    ref: ASTRef
}

export type ASTStatementReturn = {
    kind: 'statement_return',
    id: number,
    expression: ASTExpression,
    ref: ASTRef
}

export type ASTStatementCall = {
    kind: 'statement_call',
    id: number,
    expression: ASTOpCall | ASTOpCallStatic,
    ref: ASTRef
}

export type ASTSTatementAssign = {
    kind: 'statement_assign',
    id: number,
    path: string[],
    expression: ASTExpression,
    ref: ASTRef
}

//
// Unions
//

export type ASTStatement = ASTStatementLet | ASTStatementReturn | ASTStatementCall | ASTSTatementAssign;
export type ASTExpression = ASTOpBinary | ASTOpUnary | ASTOpField | ASTNumber | ASTID | ASTBoolean | ASTOpCall | ASTOpCallStatic | ASTOpNew;
export type ASTNode = ASTExpression | ASTProgram | ASTStruct | ASTField | ASTContract | ASTArgument | ASTFunction | ASTOpCall | ASTStatementLet | ASTStatementReturn | ASTProgram | ASTPrimitive | ASTOpCallStatic | ASTStatementCall | ASTNativeFunction | ASTSTatementAssign | ASTOpNew | ASTNewParameter | ASTTypeRef;
export type ASTType = ASTPrimitive | ASTStruct | ASTContract;

export function isStatement(src: ASTNode): src is ASTStatement {
    return src.kind === 'statement_let' || src.kind === 'statement_return' || src.kind === 'statement_call' || src.kind === 'statement_assign';
}

export function isExpression(src: ASTNode): src is ASTExpression {
    return src.kind === 'op_binary' || src.kind === 'op_unary' || src.kind === 'op_field' || src.kind === 'number' || src.kind === 'id' || src.kind === 'boolean' || src.kind === 'op_new' || src.kind === 'op_call' || src.kind === 'op_static_call';
}


type DistributiveOmit<T, K extends keyof any> = T extends any
    ? Omit<T, K>
    : never;
let nextId = 1;
export function createNode(src: DistributiveOmit<ASTNode, 'id'>): ASTNode {
    return Object.freeze(Object.assign({ id: nextId++ }, src));
}

export function createRef(s: RawNode, ...extra: RawNode[]): ASTRef {
    let i = s.source;
    if (extra.length > 0) {
        i = i.coverageWith(...extra.map((e) => e.source));
    }
    return new ASTRef(i);
}

export function throwError(message: string, ref: ASTRef): never {
    throw new Error(ref.interval.getLineAndColumnMessage() + message);
}