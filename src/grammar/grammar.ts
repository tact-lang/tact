import rawGrammar from './grammar.ohm-bundle';

export type GrammarNumber = {
    type: 'number', value: bigint
};

export type GrammarID = {
    type: 'id', value: string
}

export type GrammarAdd = {
    type: 'add', left: GrammarExpression, right: GrammarExpression
};

export type GrammarSub = {
    type: 'sub', left: GrammarExpression, right: GrammarExpression
};

export type GrammarMul = {
    type: 'mul', left: GrammarExpression, right: GrammarExpression
};

export type GrammarDiv = {
    type: 'div', left: GrammarExpression, right: GrammarExpression
};

export type GrammarExpression = GrammarNumber | GrammarAdd | GrammarSub | GrammarMul | GrammarDiv | GrammarID;

export type GrammarProgram = GrammarExpression;

//
// Implementation
//

const semantics = rawGrammar.createSemantics();

semantics.addOperation<GrammarProgram>('eval', {
    integerLiteral(n) {
        // Parses dec-based integer and hex-based integers
        return ({ type: 'number', value: BigInt(n.sourceString) });
    },
    id(arg0, arg1) {
        return ({ type: 'id', value: arg0.sourceString + arg1.sourceString });
    },
    ExpressionAdd_add(arg0, arg1, arg2) {
        return ({ type: 'add', left: arg0.eval(), right: arg2.eval() });
    },
    ExpressionAdd_sub(arg0, arg1, arg2) {
        return ({ type: 'sub', left: arg0.eval(), right: arg2.eval() });
    },
    ExpressionMul_div(arg0, arg1, arg2) {
        return ({ type: 'div', left: arg0.eval(), right: arg2.eval() });
    },
    ExpressionMul_mul(arg0, arg1, arg2) {
        return ({ type: 'mul', left: arg0.eval(), right: arg2.eval() });
    },
});

export function parse(src: string) {
    let matchResult = rawGrammar.match(src);
    if (matchResult.failed()) {
        throw new Error(matchResult.message);
    }
    let res = semantics(matchResult).eval();
    return res;
}