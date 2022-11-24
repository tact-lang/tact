//
// Values
//

export type GrammarNumber = {
    kind: 'number',
    value: bigint
}

export type GrammarID = {
    kind: 'id',
    value: string
}

export type GrammarNull = {
    kind: 'null'
}

export type GrammarBoolean = {
    kind: 'boolean',
    value: boolean
}

//
// Expressions
//

export type GrammarOpBinary = {
    kind: 'op_binary',
    op: '+' | '-' | '*' | '/',
    left: GrammarExpression,
    right: GrammarExpression,
}

export type GrammarOpUnary = {
    kind: 'op_unary',
    op: '+' | '-' | '!' | '~',
    right: GrammarExpression,
}

export type GrammarOpField = {
    kind: 'op_field'
    src: GrammarExpression,
    key: string
}

export type GrammarOpCall = {
    kind: 'op_call'
    src: GrammarExpression,
    key: string,
    args: GrammarExpression[]
}

//
// Program
//

export type GrammarProgram = {
    kind: 'program',
    entries: (GrammarStruct | GrammarContract)[]
}

export type GrammarStruct = {
    kind: 'def_struct',
    name: string
    fields: GrammarField[]
}

export type GrammarField = {
    kind: 'def_field',
    name: string,
    type: string
}

export type GrammarContract = {
    kind: 'def_contract',
    name: string,
    declarations: (GrammarField)[]
}

export type GrammarArgument = {
    kind: 'def_argument',
    name: string,
    type: string
}

export type GrammarFunction = {
    kind: 'def_function',
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
    name: string,
    expression: GrammarExpression
}

export type GrammarStatementReturn = {
    kind: 'return',
    expression: GrammarExpression
}

//
// Unions
//

export type GrammarStatement = GrammarStatementLet | GrammarStatementReturn;
export type GrammarExpression = GrammarOpBinary | GrammarOpUnary | GrammarOpField | GrammarNumber | GrammarNull | GrammarID | GrammarBoolean;
export type GrammarNodes = GrammarExpression | GrammarProgram | GrammarStruct | GrammarField | GrammarContract | GrammarArgument | GrammarFunction | GrammarOpCall | GrammarStatementLet | GrammarStatementReturn;