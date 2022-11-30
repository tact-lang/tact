import { Interval as RawInterval, Node as RawNode } from 'ohm-js';

export class ASTRef {
    readonly #interval: RawInterval;

    constructor(interval: RawInterval) {
        this.#interval = interval;
    }

    get contents() {
        return this.#interval.contents;
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
    op: '+' | '-' | '!',
    right: ASTExpression,
    ref: ASTRef
}

export type ASTOpField = {
    kind: 'op_field'
    id: number,
    src: ASTExpression,
    key: string,
    ref: ASTRef
}

export type ASTOpCall = {
    kind: 'op_call'
    id: number,
    src: ASTExpression,
    key: string,
    args: ASTExpression[],
    ref: ASTRef
}

//
// Program
//

export type ASTProgram = {
    kind: 'program',
    id: number,
    entries: (ASTStruct | ASTContract | ASTPrimitive | ASTFunction)[]
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
    type: string,
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
    type: string,
    ref: ASTRef
}

export type ASTFunction = {
    kind: 'def_function',
    id: number,
    name: string,
    return: string,
    args: ASTArgument[],
    statements: ASTStatement[],
    ref: ASTRef
}

//
// Statements
//

export type ASTStatementLet = {
    kind: 'let',
    id: number,
    name: string,
    type: string,
    expression: ASTExpression,
    ref: ASTRef
}

export type ASTStatementReturn = {
    kind: 'return',
    id: number,
    expression: ASTExpression,
    ref: ASTRef
}

//
// Unions
//

export type ASTStatement = ASTStatementLet | ASTStatementReturn;
export type ASTExpression = ASTOpBinary | ASTOpUnary | ASTOpField | ASTNumber | ASTID | ASTBoolean;
export type ASTNode = ASTExpression | ASTProgram | ASTStruct | ASTField | ASTContract | ASTArgument | ASTFunction | ASTOpCall | ASTStatementLet | ASTStatementReturn | ASTProgram | ASTPrimitive;
export type ASTType = ASTPrimitive | ASTStruct | ASTContract;

export function isStatement(src: ASTNode): src is ASTStatement {
    return src.kind === 'let' || src.kind === 'return';
}

export function isExpression(src: ASTNode): src is ASTExpression {
    return src.kind === 'op_binary' || src.kind === 'op_unary' || src.kind === 'op_field' || src.kind === 'number' || src.kind === 'id' || src.kind === 'boolean';
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