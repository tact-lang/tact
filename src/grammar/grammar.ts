import rawGrammar from './grammar.ohm-bundle';

export type GrammarNumber = {
    kind: 'number', value: bigint
};

export type GrammarID = {
    kind: 'id', value: string
}

export type GrammarAdd = {
    kind: 'add', left: GrammarExpression, right: GrammarExpression
};

export type GrammarSub = {
    kind: 'sub', left: GrammarExpression, right: GrammarExpression
};

export type GrammarMul = {
    kind: 'mul', left: GrammarExpression, right: GrammarExpression
};

export type GrammarDiv = {
    kind: 'div', left: GrammarExpression, right: GrammarExpression
};

export type GrammarNull = {
    kind: 'null'
}

export type GrammarBoolean = {
    kind: 'boolean', value: boolean
}

export type GrammarExpression = GrammarNumber | GrammarAdd | GrammarSub | GrammarMul | GrammarDiv | GrammarID | GrammarNull | GrammarBoolean;

export type GrammarStruct = {
    kind: 'struct',
    name: string,
    expressions: GrammarExpression[]
}

export type GrammarContract = {
    kind: 'contract',
    name: string,
    expressions: GrammarExpression[]
}

export type GrammarField = {
    kind: 'field',
    name: string,
    type: string
}

export type GrammarProgramItem = GrammarStruct;

export type GrammarProgram = { kind: 'program', entries: GrammarProgramItem[] };

type GrammarItem = GrammarExpression | GrammarProgramItem | GrammarProgram | GrammarField | GrammarContract;

//
// Implementation
//

const semantics = rawGrammar.createSemantics();

semantics.addOperation<GrammarItem>('eval', {
    Program(arg0) {
        return {
            kind: 'program',
            entries: arg0.children.map((v) => v.eval())
        };
    },
    Struct(arg0, arg1, arg2, arg3, arg4) {
        return {
            kind: 'struct',
            name: arg1.sourceString,
            expressions: arg3.children.map((v) => v.eval())
        }
    },
    Contract(arg0, arg1, arg2, arg3, arg4) {
        return {
            kind: 'contract',
            name: arg1.sourceString,
            expressions: arg3.children.map((v) => v.eval())
        }
    },
    Field(arg0, arg1, arg2, arg3, arg4) {
        return {
            kind: 'field',
            name: arg1.sourceString,
            type: arg3.sourceString
        }
    },
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
        return ({ kind: 'add', left: arg0.eval(), right: arg2.eval() });
    },
    ExpressionAdd_sub(arg0, arg1, arg2) {
        return ({ kind: 'sub', left: arg0.eval(), right: arg2.eval() });
    },
    ExpressionMul_div(arg0, arg1, arg2) {
        return ({ kind: 'div', left: arg0.eval(), right: arg2.eval() });
    },
    ExpressionMul_mul(arg0, arg1, arg2) {
        return ({ kind: 'mul', left: arg0.eval(), right: arg2.eval() });
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