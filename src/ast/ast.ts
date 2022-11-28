export type ASTPrimitive = {
    kind: 'primitive',
    id: number,
    name: string
}

//
// Values
//

export type ASTNumber = {
    kind: 'number',
    id: number,
    value: bigint
}

export type ASTID = {
    kind: 'id',
    id: number,
    value: string
}

// export type ASTNull = {
//     kind: 'null'
//     id: number,
// }

export type ASTBoolean = {
    kind: 'boolean',
    id: number,
    value: boolean
}

//
// Expressions
//

export type ASTOpBinary = {
    kind: 'op_binary',
    id: number,
    op: '+' | '-' | '*' | '/',
    left: ASTExpression,
    right: ASTExpression,
}

export type ASTOpUnary = {
    kind: 'op_unary',
    id: number,
    op: '+' | '-' | '!' | '~',
    right: ASTExpression,
}

export type ASTOpField = {
    kind: 'op_field'
    id: number,
    src: ASTExpression,
    key: string
}

export type ASTOpCall = {
    kind: 'op_call'
    id: number,
    src: ASTExpression,
    key: string,
    args: ASTExpression[]
}

//
// Program
//

export type ASTProgram = {
    kind: 'program',
    id: number,
    entries: (ASTStruct | ASTContract | ASTPrimitive)[]
}

export type ASTStruct = {
    kind: 'def_struct',
    id: number,
    name: string
    fields: ASTField[]
}

export type ASTField = {
    kind: 'def_field',
    id: number,
    name: string,
    type: string
}

export type ASTContract = {
    kind: 'def_contract',
    id: number,
    name: string,
    declarations: (ASTField | ASTFunction)[]
}

export type ASTArgument = {
    kind: 'def_argument',
    id: number,
    name: string,
    type: string
}

export type ASTFunction = {
    kind: 'def_function',
    id: number,
    name: string,
    return: string,
    args: ASTArgument[],
    statements: ASTStatement[]
}

//
// Statements
//

export type ASTStatementLet = {
    kind: 'let',
    id: number,
    name: string,
    type: string,
    expression: ASTExpression
}

export type ASTStatementReturn = {
    kind: 'return',
    id: number,
    expression: ASTExpression
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