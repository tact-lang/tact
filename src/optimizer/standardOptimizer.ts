import { ASTExpression } from "../grammar/ast";
import { AssociativeRule1, AssociativeRule2, AssociativeRule3 } from "./associative";
import { Rule, ExpressionTransformer } from "./types";

// This optimizer uses rules that preserve overflows in integer expressions.
export class StandardOptimizer implements ExpressionTransformer {

    private rules: Rule[];

    constructor() {
        this.rules = [
            new AssociativeRule1(0),
            new AssociativeRule2(1),
            new AssociativeRule3(3) 
            // TODO: add simpler algebraic rules that will be added to algebraic.ts
        ];

        // Sort according to the priorities: smaller number means greater priority. 
        // So, the rules will be sorted increasingly according to their priority number.
        this.rules.sort((r1, r2) => r1.getPriority() - r2.getPriority());
    }

    public applyRules(ast: ASTExpression): ASTExpression {
        var result = ast;
        this.rules.forEach(rule => result = rule.applyRule(result, this));
        return result;
    }

}