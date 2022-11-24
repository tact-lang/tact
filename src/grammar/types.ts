//
// Values
//

export type GrammarNumber = {
    kind: 'number',
    id: number,
    value: bigint
}

export type GrammarID = {
    kind: 'id',
    id: number,
    value: string
}

export type GrammarNull = {
    kind: 'null'
    id: number,
}

export type GrammarBoolean = {
    kind: 'boolean',
    id: number,
    value: boolean
}

//
// Expressions
//

export type GrammarOpBinary = {
    kind: 'op_binary',
    id: number,
    op: '+' | '-' | '*' | '/',
    left: GrammarExpression,
    right: GrammarExpression,
}

export type GrammarOpUnary = {
    kind: 'op_unary',
    id: number,
    op: '+' | '-' | '!' | '~',
    right: GrammarExpression,
}

export type GrammarOpField = {
    kind: 'op_field'
    id: number,
    src: GrammarExpression,
    key: string
}

export type GrammarOpCall = {
    kind: 'op_call'
    id: number,
    src: GrammarExpression,
    key: string,
    args: GrammarExpression[]
}

//
// Program
//

export type GrammarProgram = {
    kind: 'program',
    id: number,
    entries: (GrammarStruct | GrammarContract)[]
}

export type GrammarStruct = {
    kind: 'def_struct',
    id: number,
    name: string
    fields: GrammarField[]
}

export type GrammarField = {
    kind: 'def_field',
    id: number,
    name: string,
    type: string
}

export type GrammarContract = {
    kind: 'def_contract',
    id: number,
    name: string,
    declarations: (GrammarField)[]
}

export type GrammarArgument = {
    kind: 'def_argument',
    id: number,
    name: string,
    type: string
}

export type GrammarFunction = {
    kind: 'def_function',
    id: number,
    name: string,
    return: string,
    args: GrammarArgument[],
    statements: GrammarStatement[]
}

//
// Statements
//

export type GrammarStatementLet = {
    kind: 'let',
    id: number,
    name: string,
    expression: GrammarExpression
}

export type GrammarStatementReturn = {
    kind: 'return',
    id: number,
    expression: GrammarExpression
}

//
// Unions
//

export type GrammarStatement = GrammarStatementLet | GrammarStatementReturn;
export type GrammarExpression = GrammarOpBinary | GrammarOpUnary | GrammarOpField | GrammarNumber | GrammarNull | GrammarID | GrammarBoolean;
export type GrammarNodes = GrammarExpression | GrammarProgram | GrammarStruct | GrammarField | GrammarContract | GrammarArgument | GrammarFunction | GrammarOpCall | GrammarStatementLet | GrammarStatementReturn | GrammarProgram;