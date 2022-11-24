import rawGrammar from './grammar.ohm-bundle';
import { GrammarNodes } from './types';

//
// Implementation
//

const semantics = rawGrammar.createSemantics();

// Resolve program
semantics.addOperation<GrammarNodes>('resolve_program', {
    Program(arg0) {
        return {
            kind: 'program',
            entries: arg0.children.map((v) => v.resolve_program_item())
        };
    },
});

// Resolve program items
semantics.addOperation<GrammarNodes>('resolve_program_item', {
    Struct(arg0, arg1, arg2, arg3, arg4) {
        return {
            kind: 'def_struct',
            name: arg1.sourceString,
            fields: arg3.children.map((v) => v.resolve_declaration())
        }
    },
    Contract(arg0, arg1, arg2, arg3, arg4) {
        return {
            kind: 'def_contract',
            name: arg1.sourceString,
            declarations: arg3.children.map((v) => v.resolve_declaration())
        }
    },
});

// Struct and class declarations
semantics.addOperation<GrammarNodes>('resolve_declaration', {
    Field(arg0, arg1, arg2, arg3, arg4) {
        return {
            kind: 'def_field',
            name: arg1.sourceString,
            type: arg3.sourceString
        }
    },
    FunctionArg(arg0, arg1, arg2) {
        return {
            kind: 'def_argument',
            name: arg0.sourceString,
            type: arg2.sourceString
        }
    },
    Function(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9) {
        return {
            kind: 'def_function',
            name: arg1.sourceString,
            return: arg6.sourceString,
            args: arg3.asIteration().children.map((v: any) => v.resolve_declaration()),
            statements: arg8.children.map((v: any) => v.resolve_statement()),
        }
    },
});

// Statements
semantics.addOperation<GrammarNodes>('resolve_statement', {
    StatementLet(arg0, arg1, arg2, arg3, arg4) {
        return {
            kind: 'let',
            name: arg1.sourceString,
            expression: arg3.resolve_expression()
        }
    },
    StatementReturn(arg0, arg1, arg2) {
        return {
            kind: 'return',
            expression: arg1.resolve_expression()
        }
    },
});

// Expressions
semantics.addOperation<GrammarNodes>('resolve_expression', {
    integerLiteral(n) {
        // Parses dec-based integer and hex-based integers
        return ({ kind: 'number', value: BigInt(n.sourceString) });
    },
    id(arg0, arg1) {
        return ({ kind: 'id', value: arg0.sourceString + arg1.sourceString });
    },
    nullLiteral(arg0) {
        return ({ kind: 'null' });
    },
    boolLiteral(arg0) {
        return ({ kind: 'boolean', value: arg0.sourceString === 'true' });
    },
    ExpressionAdd_add(arg0, arg1, arg2) {
        return ({ kind: 'op_binary', op: '+', left: arg0.resolve_expression(), right: arg2.resolve_expression() });
    },
    ExpressionAdd_sub(arg0, arg1, arg2) {
        return ({ kind: 'op_binary', op: '-', left: arg0.resolve_expression(), right: arg2.resolve_expression() });
    },
    ExpressionMul_div(arg0, arg1, arg2) {
        return ({ kind: 'op_binary', op: '/', left: arg0.resolve_expression(), right: arg2.resolve_expression() });
    },
    ExpressionMul_mul(arg0, arg1, arg2) {
        return ({ kind: 'op_binary', op: '*', left: arg0.resolve_expression(), right: arg2.resolve_expression() });
    },
    ExpressionField(arg0, arg1, arg2) {
        return ({ kind: 'op_field', src: arg0.resolve_expression(), key: arg2.sourceString });
    },
    ExpressionCall(arg0, arg1, arg2, arg3, arg4, arg5) {
        return ({ kind: 'op_call', src: arg0.resolve_expression(), key: arg2.sourceString, args: arg4.asIteration().children.map((v: any) => v.resolve_expression()) });
    },
});

export function parse(src: string) {
    let matchResult = rawGrammar.match(src);
    if (matchResult.failed()) {
        throw new Error(matchResult.message);
    }
    let res = semantics(matchResult).resolve_program();
    return res;
}