import { AstExpression } from "../grammar/ast";
import {
    AddSelf,
    AddZero,
    AndFalse,
    AndSelf,
    AndTrue,
    Contradiction,
    DoubleNegation,
    ExcludedMiddle,
    MultiplyOne,
    MultiplyZero,
    NegateFalse,
    NegateTrue,
    OrFalse,
    OrSelf,
    OrTrue,
    SubtractSelf,
} from "./algebraic";
import {
    AssociativeRule1,
    AssociativeRule2,
    AssociativeRule3,
} from "./associative";
import { Rule, ExpressionTransformer } from "./types";

type PrioritizedRule = { priority: number; rule: Rule };

// This optimizer uses rules that preserve overflows in integer expressions.
export class StandardOptimizer extends ExpressionTransformer {
    private rules: PrioritizedRule[];

    constructor() {
        super();

        this.rules = [
            { priority: 0, rule: new AssociativeRule1() },
            { priority: 1, rule: new AssociativeRule2() },
            { priority: 2, rule: new AssociativeRule3() },
            { priority: 3, rule: new AddZero() },
            { priority: 4, rule: new MultiplyZero() },
            { priority: 5, rule: new MultiplyOne() },
            { priority: 6, rule: new SubtractSelf() },
            { priority: 7, rule: new AddSelf() },
            { priority: 8, rule: new OrTrue() },
            { priority: 9, rule: new AndFalse() },
            { priority: 10, rule: new OrFalse() },
            { priority: 11, rule: new AndTrue() },
            { priority: 12, rule: new OrSelf() },
            { priority: 13, rule: new AndSelf() },
            { priority: 14, rule: new ExcludedMiddle() },
            { priority: 15, rule: new Contradiction() },
            { priority: 16, rule: new DoubleNegation() },
            { priority: 17, rule: new NegateTrue() },
            { priority: 18, rule: new NegateFalse() },
        ];

        // Sort according to the priorities: smaller number means greater priority.
        // So, the rules will be sorted increasingly according to their priority number.
        this.rules.sort((r1, r2) => r1.priority - r2.priority);
    }

    public applyRules(ast: AstExpression): AstExpression {
        return this.rules.reduce(
            (prev, prioritizedRule) =>
                prioritizedRule.rule.applyRule(prev, this),
            ast,
        );
    }
}
