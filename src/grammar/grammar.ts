import rawGrammar from './grammar.ohm-bundle';
import { ASTNode, ASTProgram, createNode, createRef } from '../ast/ast';


// Semantics
const semantics = rawGrammar.createSemantics();

// Resolve program
semantics.addOperation<ASTNode>('resolve_program', {
    Program(arg0) {
        return createNode({
            kind: 'program',
            entries: arg0.children.map((v) => v.resolve_program_item())
        });
    },
});

// Resolve program items
semantics.addOperation<ASTNode>('resolve_program_item', {
    Primitive(arg0, arg1, arg2) {
        return createNode({
            kind: 'primitive',
            name: arg1.sourceString,
            ref: createRef(this)
        });
    },
    Struct(arg0, arg1, arg2, arg3, arg4) {
        return createNode({
            kind: 'def_struct',
            name: arg1.sourceString,
            fields: arg3.children.map((v) => v.resolve_declaration()),
            ref: createRef(this)
        })
    },
    Contract(arg0, arg1, arg2, arg3, arg4) {
        return createNode({
            kind: 'def_contract',
            name: arg1.sourceString,
            declarations: arg3.children.map((v) => v.resolve_declaration()),
            ref: createRef(this)
        })
    },
    StaticFunction(arg0) {
        return arg0.resolve_declaration();
    },
    NativeFunction(arg0) {
        return arg0.resolve_declaration();
    },
});

// Struct and class declarations
semantics.addOperation<ASTNode>('resolve_declaration', {
    Field(arg0, arg1, arg2, arg3, arg4) {
        return createNode({
            kind: 'def_field',
            name: arg1.sourceString,
            type: arg3.sourceString,
            ref: createRef(this)
        })
    },
    FunctionArg(arg0, arg1, arg2) {
        return createNode({
            kind: 'def_argument',
            name: arg0.sourceString,
            type: arg2.sourceString,
            ref: createRef(this)
        })
    },
    Function_withType(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9) {
        return createNode({
            kind: 'def_function',
            name: arg1.sourceString,
            return: arg6.sourceString,
            args: arg3.asIteration().children.map((v: any) => v.resolve_declaration()),
            statements: arg8.children.map((v: any) => v.resolve_statement()),
            ref: createRef(this)
        })
    },
    Function_withVoid(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7) {
        return createNode({
            kind: 'def_function',
            name: arg1.sourceString,
            return: null,
            args: arg3.asIteration().children.map((v: any) => v.resolve_declaration()),
            statements: arg6.children.map((v: any) => v.resolve_statement()),
            ref: createRef(this)
        })
    },
    NativeFunction_withType(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11) {
        return createNode({
            kind: 'def_native_function',
            name: arg5.sourceString,
            nativeName: arg2.sourceString,
            return: arg10.sourceString,
            args: arg7.asIteration().children.map((v: any) => v.resolve_declaration()),
            ref: createRef(this)
        })
    },
    NativeFunction_withVoid(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9) {
        return createNode({
            kind: 'def_native_function',
            name: arg5.sourceString,
            nativeName: arg2.sourceString,
            return: null,
            args: arg7.asIteration().children.map((v: any) => v.resolve_declaration()),
            ref: createRef(this)
        })
    },
});

// Statements
semantics.addOperation<ASTNode>('resolve_statement', {
    StatementLet(arg0, arg1, arg2, arg3, arg4, arg5, arg6) {
        return createNode({
            kind: 'statement_let',
            name: arg1.sourceString,
            type: arg3.sourceString,
            expression: arg5.resolve_expression(),
            ref: createRef(this)
        })
    },
    StatementReturn(arg0, arg1, arg2) {
        return createNode({
            kind: 'statement_return',
            expression: arg1.resolve_expression(),
            ref: createRef(this)
        })
    },
    StatementCall(arg0, arg1) {
        return createNode({
            kind: 'statement_call',
            expression: arg0.resolve_expression(),
            ref: createRef(this)
        })
    },
    StatementStaticCall(arg0, arg1) {
        return createNode({
            kind: 'statement_call',
            expression: arg0.resolve_expression(),
            ref: createRef(this)
        })
    },
    StatementAssign(arg0, arg1, arg2) {
        return createNode({
            kind: 'statement_assign',
            path: arg0.resolve_lvalue(),
            expression: arg1.resolve_expression(),
            ref: createRef(this)
        })
    }
});

// LValue
semantics.addOperation<string[]>('resolve_lvalue', {
    LValue_id(arg0, arg1) {
        return [arg0.sourceString];
    },
    LValue_subId(arg0, arg1, arg2) {
        return [arg0.sourceString, ...arg2.resolve_lvalue()];
    }
})

// Expressions
semantics.addOperation<ASTNode>('resolve_expression', {

    // Literals
    integerLiteral(n) {
        return createNode({ kind: 'number', value: BigInt(n.sourceString), ref: createRef(this) }); // Parses dec-based integer and hex-based integers
    },
    boolLiteral(arg0) {
        return createNode({ kind: 'boolean', value: arg0.sourceString === 'true', ref: createRef(this) });
    },
    id(arg0, arg1) {
        return createNode({ kind: 'id', value: arg0.sourceString + arg1.sourceString, ref: createRef(this) });
    },

    // Binary
    ExpressionAdd_add(arg0, arg1, arg2) {
        return createNode({ kind: 'op_binary', op: '+', left: arg0.resolve_expression(), right: arg2.resolve_expression(), ref: createRef(this) });
    },
    ExpressionAdd_sub(arg0, arg1, arg2) {
        return createNode({ kind: 'op_binary', op: '-', left: arg0.resolve_expression(), right: arg2.resolve_expression(), ref: createRef(this) });
    },
    ExpressionMul_div(arg0, arg1, arg2) {
        return createNode({ kind: 'op_binary', op: '/', left: arg0.resolve_expression(), right: arg2.resolve_expression(), ref: createRef(this) });
    },
    ExpressionMul_mul(arg0, arg1, arg2) {
        return createNode({ kind: 'op_binary', op: '*', left: arg0.resolve_expression(), right: arg2.resolve_expression(), ref: createRef(this) });
    },
    ExpressionCompare_eq(arg0, arg1, arg2) {
        return createNode({ kind: 'op_binary', op: '==', left: arg0.resolve_expression(), right: arg2.resolve_expression(), ref: createRef(this) });
    },
    ExpressionCompare_not(arg0, arg1, arg2) {
        return createNode({ kind: 'op_binary', op: '!=', left: arg0.resolve_expression(), right: arg2.resolve_expression(), ref: createRef(this) });
    },
    ExpressionCompare_gt(arg0, arg1, arg2) {
        return createNode({ kind: 'op_binary', op: '>', left: arg0.resolve_expression(), right: arg2.resolve_expression(), ref: createRef(this) });
    },
    ExpressionCompare_gte(arg0, arg1, arg2) {
        return createNode({ kind: 'op_binary', op: '>=', left: arg0.resolve_expression(), right: arg2.resolve_expression(), ref: createRef(this) });
    },
    ExpressionCompare_lt(arg0, arg1, arg2) {
        return createNode({ kind: 'op_binary', op: '>', left: arg0.resolve_expression(), right: arg2.resolve_expression(), ref: createRef(this) });
    },
    ExpressionCompare_lte(arg0, arg1, arg2) {
        return createNode({ kind: 'op_binary', op: '>=', left: arg0.resolve_expression(), right: arg2.resolve_expression(), ref: createRef(this) });
    },
    ExpressionOr_or(arg0, arg1, arg2) {
        return createNode({ kind: 'op_binary', op: '||', left: arg0.resolve_expression(), right: arg2.resolve_expression(), ref: createRef(this) });
    },
    ExpressionAnd_and(arg0, arg1, arg2) {
        return createNode({ kind: 'op_binary', op: '&&', left: arg0.resolve_expression(), right: arg2.resolve_expression(), ref: createRef(this) });
    },

    // Unary
    ExpressionUnary_add(arg0, arg1) {
        return createNode({ kind: 'op_unary', op: '+', right: arg1.resolve_expression(), ref: createRef(this) });
    },
    ExpressionUnary_neg(arg0, arg1) {
        return createNode({ kind: 'op_unary', op: '-', right: arg1.resolve_expression(), ref: createRef(this) });
    },
    ExpressionUnary_not(arg0, arg1) {
        return createNode({ kind: 'op_unary', op: '!', right: arg1.resolve_expression(), ref: createRef(this) });
    },
    ExpressionBracket(arg0, arg1, arg2) {
        return arg1.resolve_expression();
    },

    // Access
    ExpressionField(arg0, arg1, arg2) {
        return createNode({ kind: 'op_field', src: arg0.resolve_expression(), name: arg2.sourceString, ref: createRef(this) });
    },
    ExpressionCall(arg0, arg1, arg2, arg3, arg4, arg5) {
        return createNode({ kind: 'op_call', src: arg0.resolve_expression(), name: arg2.sourceString, args: arg4.asIteration().children.map((v: any) => v.resolve_expression()), ref: createRef(this) });
    },
    ExpressionStaticCall(arg0, arg1, arg2, arg3) {
        return createNode({ kind: 'op_static_call', name: arg0.sourceString, args: arg2.asIteration().children.map((v: any) => v.resolve_expression()), ref: createRef(this) });
    },
});

export function parse(src: string): ASTProgram {
    let matchResult = rawGrammar.match(src);
    if (matchResult.failed()) {
        throw new Error(matchResult.message);
    }
    let res = semantics(matchResult).resolve_program();
    return res;
}