import { AstExpression } from "../grammar/ast";
import { AddSelf, AddZero, MultiplyOne, MultiplyZero, SubstractSelf } from "./algebraic";
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
            { priority: 6, rule: new SubstractSelf() },
            { priority: 7, rule: new AddSelf() },
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
