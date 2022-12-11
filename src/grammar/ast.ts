import { Interval as RawInterval, Node as RawNode } from 'ohm-js';

export class ASTRef {

    static merge(...refs: ASTRef[]) {
        if (refs.length === 0) {
            throw Error('Cannot merge 0 refs');
        }
        let r = refs[0].#interval;
        for (let i = 1; i < refs.length; i++) {
            r = r.coverageWith(r, refs[i].#interval);
        }
        return new ASTRef(r);
    }

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

export type ASTString = {
    kind: 'string',
    id: number,
    value: string,
    ref: ASTRef
}

export type ASTNull = {
    kind: 'null',
    id: number,
    ref: ASTRef
}

export type ASTLvalueRef = {
    kind: 'lvalue_ref',
    id: number,
    name: string,
    ref: ASTRef
}

//
// Types
//

export type ASTTypeRefSimple = {
    kind: 'type_ref_simple',
    id: number,
    name: string,
    optional: boolean,
    ref: ASTRef
}

export type ASTTypeRefMap = {
    kind: 'type_ref_map',
    id: number,
    key: string,
    value: string,
    ref: ASTRef
}

export type ASTTypeRef = ASTTypeRefSimple | ASTTypeRefMap;

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
    entries: (ASTStruct | ASTContract | ASTPrimitive | ASTFunction | ASTNativeFunction | ASTProgramImport)[]
}

export type ASTProgramImport = {
    kind: 'program_import',
    id: number,
    path: ASTString,
}

export type ASTStruct = {
    kind: 'def_struct',
    id: number,
    name: string,
    message: boolean,
    prefix: number | null,
    fields: ASTField[],
    ref: ASTRef
}

export type ASTField = {
    kind: 'def_field',
    id: number,
    name: string,
    type: ASTTypeRef,
    init: bigint | boolean | null | undefined,
    as: string | null,
    ref: ASTRef
}

export type ASTContract = {
    kind: 'def_contract',
    id: number,
    name: string,
    declarations: (ASTField | ASTFunction | ASTInitFunction | ASTReceive)[],
    ref: ASTRef
}

export type ASTArgument = {
    kind: 'def_argument',
    id: number,
    name: string,
    type: ASTTypeRef,
    ref: ASTRef
}

export type ASTFunctionAttribute = { type: 'public', ref: ASTRef } | { type: 'get', ref: ASTRef } | { type: 'mutates', ref: ASTRef } | { type: 'extends', ref: ASTRef };

export type ASTFunction = {
    kind: 'def_function',
    id: number,
    attributes: ASTFunctionAttribute[],
    name: string,
    return: ASTTypeRef | null,
    args: ASTArgument[],
    statements: ASTStatement[],
    ref: ASTRef
}

export type ASTReceive = {
    kind: 'def_receive',
    id: number,
    selector: { kind: 'simple', arg: ASTArgument } | { kind: 'fallback' } | { kind: 'comment', comment: ASTString } | { kind: 'bounce', arg: ASTArgument },
    statements: ASTStatement[],
    ref: ASTRef
}

export type ASTNativeFunction = {
    kind: 'def_native_function',
    id: number,
    attributes: ASTFunctionAttribute[],
    name: string,
    nativeName: string,
    return: ASTTypeRef | null,
    args: ASTArgument[],
    ref: ASTRef
}

export type ASTInitFunction = {
    kind: 'def_init_function',
    id: number,
    args: ASTArgument[],
    statements: ASTStatement[],
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

export type ASTStatementExpression = {
    kind: 'statement_expression',
    id: number,
    expression: ASTExpression,
    ref: ASTRef
}

export type ASTSTatementAssign = {
    kind: 'statement_assign',
    id: number,
    path: ASTLvalueRef[],
    expression: ASTExpression,
    ref: ASTRef
}

export type ASTCondition = {
    kind: 'statement_condition',
    id: number,
    expression: ASTExpression,
    trueStatements: ASTStatement[],
    falseStatements: ASTStatement[];
    elseif: ASTCondition | null,
    ref: ASTRef,
}

export type ASTStatementWhile = {
    kind: 'statement_while'
    id: number,
    condition: ASTExpression,
    statements: ASTStatement[],
    ref: ASTRef
}

export type ASTStatementUntil = {
    kind: 'statement_until'
    id: number,
    condition: ASTExpression,
    statements: ASTStatement[],
    ref: ASTRef
}

export type ASTStatementRepeat = {
    kind: 'statement_repeat'
    id: number,
    condition: ASTExpression,
    statements: ASTStatement[],
    ref: ASTRef
}


//
// Unions
//

export type ASTStatement = ASTStatementLet | ASTStatementReturn | ASTStatementExpression | ASTSTatementAssign | ASTCondition | ASTStatementWhile | ASTStatementUntil | ASTStatementRepeat;
export type ASTExpression = ASTOpBinary | ASTOpUnary | ASTOpField | ASTNumber | ASTID | ASTBoolean | ASTOpCall | ASTOpCallStatic | ASTOpNew | ASTNull | ASTLvalueRef;
export type ASTNode = ASTExpression | ASTProgram | ASTStruct | ASTField | ASTContract | ASTArgument | ASTFunction | ASTOpCall | ASTStatementLet | ASTStatementReturn | ASTProgram | ASTPrimitive | ASTOpCallStatic | ASTStatementExpression | ASTNativeFunction | ASTSTatementAssign | ASTOpNew | ASTNewParameter | ASTTypeRef | ASTNull | ASTCondition | ASTInitFunction | ASTStatementWhile | ASTStatementUntil | ASTStatementRepeat | ASTReceive | ASTLvalueRef | ASTString | ASTProgramImport;
export type ASTType = ASTPrimitive | ASTStruct | ASTContract;

export function isStatement(src: ASTNode): src is ASTStatement {
    return src.kind === 'statement_let' || src.kind === 'statement_return' || src.kind === 'statement_expression' || src.kind === 'statement_assign' || src.kind === 'statement_condition' || src.kind === 'statement_while' || src.kind === 'statement_until' || src.kind === 'statement_repeat';
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

export function __DANGER_resetNodeId() {
    nextId = 1;
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