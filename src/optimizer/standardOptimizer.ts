import { ASTExpression } from "../grammar/ast";
import { AssociativeRule1, AssociativeRule2, AssociativeRule3 } from "./associative";
import { Rule, ExpressionTransformer } from "./types";

type PrioritizedRule = {priority: number, rule: Rule};

// This optimizer uses rules that preserve overflows in integer expressions.
export class StandardOptimizer implements ExpressionTransformer {

    private rules: PrioritizedRule[];

    constructor() {
        this.rules = [
            {priority: 0, rule: new AssociativeRule1()},
            {priority: 1, rule: new AssociativeRule2()},
            {priority: 2, rule: new AssociativeRule3()}
            // TODO: add simpler algebraic rules that will be added to algebraic.ts
        ];

        // Sort according to the priorities: smaller number means greater priority. 
        // So, the rules will be sorted increasingly according to their priority number.
        this.rules.sort((r1, r2) => r1.priority - r2.priority);
    }

    public applyRules(ast: ASTExpression): ASTExpression {
        return this.rules.reduce((prev, prioritizedRule) => prioritizedRule.rule.applyRule(prev, this), ast);
    }

}