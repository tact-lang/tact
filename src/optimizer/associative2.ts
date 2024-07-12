// This module includes rules involving associative rewrites of expressions

import { evalBinaryOp } from "../constEval";
import { AstBinaryOperation, AstExpression, AstOpBinary } from "../grammar/ast";
import { Value } from "../types/types";
import { ExpressionTransformer, Rule, AstValue } from "./types";
import {
    abs,
    checkIsBinaryOpNode,
    checkIsBinaryOp_NonValue_Value,
    checkIsBinaryOp_Value_NonValue,
    extractValue,
    isValue,
    makeBinaryExpression,
    makeValueExpression,
    sign,
} from "./util";

type preAssociativityData = {
    op1_: AstBinaryOperation, 
    c1_: Value,
    op_: AstBinaryOperation,
    c2_: Value
};

type postAssociativityData = {
    val_: Value
};

type preCommutativityData = {
    op1_: AstBinaryOperation, 
    c1_: Value
};

type postCommutativityData = {
    val: Value
};

type associativityTransform = {
    preTransform: (c1: Value, c2: Value) => preAssociativityData;
    postTransform: (val: Value) => postAssociativityData;
};

type commutativityTransform = {
    preTransform: (c1: Value) => preCommutativityData;
    postTransform: (val: Value) => postCommutativityData;
};

export abstract class AssociativeRewriteRule extends Rule {
    // An entry (op, S) in the map means "operator op associates with all operators in set S",
    // mathematically: all op2 \in S. (a op b) op2 c = a op (b op2 c)
    private associativeOps: Map<AstBinaryOperation, Set<AstBinaryOperation>>;

    // This set contains all operators that commute.
    // Mathematically: 
    // all op \in commutativeOps. a op b = b op a
    private commutativeOps: Set<AstBinaryOperation>;

    constructor() {
        super();

        // + associates with these on the right:
        // i.e., all op \in additiveAssoc. (a + b) op c = a + (b op c)
        const additiveAssoc: Set<AstBinaryOperation> = new Set(["+", "-"]);

        // - associates with these on the right:
        const minusAssoc: Set<AstBinaryOperation> = new Set(["-", "+"]);

        // * associates with these on the right:
        const multiplicativeAssoc: Set<AstBinaryOperation> = new Set([
            "*",
            "<<",
        ]);

        // Division / does not associate with any on the right

        // Modulus % does not associate with any on the right

        // TODO: shifts, bitwise integer operators, boolean operators

        this.associativeOps = new Map([
            ["+", additiveAssoc],
            ["*", multiplicativeAssoc],
        ]);

        this.commutativeOps = new Set(
            ["+", "*", "!=", "==", "&&", "||"], // TODO: bitwise integer operators
        );
    }

    public areAssociative(
        op1: AstBinaryOperation,
        op2: AstBinaryOperation,
    ): boolean {
        if (this.associativeOps.has(op1)) {
            const rightOperators = this.associativeOps.get(op1)!;
            return rightOperators.has(op2);
        } else {
            return false;
        }
    }

    public isCommutative(op: AstBinaryOperation): boolean {
        return this.commutativeOps.has(op);
    }
}

export abstract class AllowableOpRule extends AssociativeRewriteRule {
    private allowedOps: Set<AstBinaryOperation>;

    constructor() {
        super();

        this.allowedOps = new Set(
            // Recall that integer operators +,-,*,/,% are not safe with this rule, because
            // there is a risk that they will not preserve overflows in the unknown operands.
            ["&&", "||"], // TODO: check bitwise integer operators
        );
    }

    public isAllowedOp(op: AstBinaryOperation): boolean {
        return this.allowedOps.has(op);
    }

    public areAllowedOps(op: AstBinaryOperation[]): boolean {
        return op.reduce(
            (prev, curr) => prev && this.allowedOps.has(curr),
            true,
        );
    }
}

export class AssociativeRule1 extends AllowableOpRule {
    public applyRule(
        ast: AstExpression,
        optimizer: ExpressionTransformer,
    ): AstExpression {
        if (checkIsBinaryOpNode(ast)) {
            const topLevelNode = ast as AstOpBinary;
            if (
                checkIsBinaryOp_NonValue_Value(topLevelNode.left) &&
                checkIsBinaryOp_NonValue_Value(topLevelNode.right)
            ) {
                // The tree has this form:
                // (x1 op1 c1) op (x2 op2 c2)
                const leftTree = topLevelNode.left as AstOpBinary;
                const rightTree = topLevelNode.right as AstOpBinary;

                const x1 = leftTree.left;
                const c1 = leftTree.right as AstValue;
                const op1 = leftTree.op;

                const x2 = rightTree.left;
                const c2 = rightTree.right as AstValue;
                const op2 = rightTree.op;

                const op = topLevelNode.op;

                // Check that:
                // the operators are allowed
                // op1 and op associate
                // op and op2 associate
                // op commutes
                if (
                    this.areAllowedOps([op1, op, op2]) &&
                    this.areAssociative(op1, op) &&
                    this.areAssociative(op, op2) &&
                    this.isCommutative(op)
                ) {
                    // Agglutinate the constants and compute their final value
                    try {
                        // If an error occurs, we abandon the simplification
                        const val = evalBinaryOp(
                            op2,
                            extractValue(c1),
                            extractValue(c2),
                        );

                        // The final expression is
                        // (x1 op1 x2) op val

                        // Because we are joining x1 and x2,
                        // there is further opportunity of simplification,
                        // So, we ask the evaluator to apply all the rules in the subtree.
                        const newLeft = optimizer.applyRules(
                            makeBinaryExpression(op1, x1, x2),
                        );
                        const newRight = makeValueExpression(val);
                        return makeBinaryExpression(op, newLeft, newRight);
                    } catch (e) {
                        // Do nothing: will exit rule without modifying tree
                    }
                }
            } else if (
                checkIsBinaryOp_NonValue_Value(topLevelNode.left) &&
                checkIsBinaryOp_Value_NonValue(topLevelNode.right)
            ) {
                // The tree has this form:
                // (x1 op1 c1) op (c2 op2 x2)
                const leftTree = topLevelNode.left as AstOpBinary;
                const rightTree = topLevelNode.right as AstOpBinary;

                const x1 = leftTree.left;
                const c1 = leftTree.right as AstValue;
                const op1 = leftTree.op;

                const x2 = rightTree.right;
                const c2 = rightTree.left as AstValue;
                const op2 = rightTree.op;

                const op = topLevelNode.op;

                // Check that:
                // the operators are allowed
                // op1 and op associate
                // op and op2 associate
                if (
                    this.areAllowedOps([op1, op, op2]) &&
                    this.areAssociative(op1, op) &&
                    this.areAssociative(op, op2)
                ) {
                    // Agglutinate the constants and compute their final value
                    try {
                        // If an error occurs, we abandon the simplification
                        const val = evalBinaryOp(
                            op,
                            extractValue(c1),
                            extractValue(c2),
                        );

                        // The current expression could be either
                        // x1 op1 (val op2 x2) or
                        // (x1 op1 val) op2 x2  <--- we choose this form.
                        // Other rules will attempt to extract the constant outside the expression.

                        // Because we are joining x1 and val,
                        // there is further opportunity of simplification,
                        // So, we ask the evaluator to apply all the rules in the subtree.
                        const newValNode = makeValueExpression(val);
                        const newLeft = optimizer.applyRules(
                            makeBinaryExpression(op1, x1, newValNode),
                        );
                        return makeBinaryExpression(op2, newLeft, x2);
                    } catch (e) {
                        // Do nothing: will exit rule without modifying tree
                    }
                }
            } else if (
                checkIsBinaryOp_Value_NonValue(topLevelNode.left) &&
                checkIsBinaryOp_NonValue_Value(topLevelNode.right)
            ) {
                // The tree has this form:
                // (c1 op1 x1) op (x2 op2 c2)
                const leftTree = topLevelNode.left as AstOpBinary;
                const rightTree = topLevelNode.right as AstOpBinary;

                const x1 = leftTree.right;
                const c1 = leftTree.left as AstValue;
                const op1 = leftTree.op;

                const x2 = rightTree.left;
                const c2 = rightTree.right as AstValue;
                const op2 = rightTree.op;

                const op = topLevelNode.op;

                // Check that:
                // the operators are allowed
                // op and op1 associate
                // op2 and op associate
                // op commutes
                if (
                    this.areAllowedOps([op1, op, op2]) &&
                    this.areAssociative(op, op1) &&
                    this.areAssociative(op2, op) &&
                    this.isCommutative(op)
                ) {
                    // Agglutinate the constants and compute their final value
                    try {
                        // If an error occurs, we abandon the simplification
                        const val = evalBinaryOp(
                            op,
                            extractValue(c2),
                            extractValue(c1),
                        );

                        // The current expression could be either
                        // x2 op2 (val op1 x1) or
                        // (x2 op2 val) op1 x1  <--- we choose this form.
                        // Other rules will attempt to extract the constant outside the expression.

                        // Because we are joining x2 and val,
                        // there is further opportunity of simplification,
                        // So, we ask the evaluator to apply all the rules in the subtree.
                        const newValNode = makeValueExpression(val);
                        const newLeft = optimizer.applyRules(
                            makeBinaryExpression(op2, x2, newValNode),
                        );
                        return makeBinaryExpression(op1, newLeft, x1);
                    } catch (e) {
                        // Do nothing: will exit rule without modifying tree
                    }
                }
            } else if (
                checkIsBinaryOp_Value_NonValue(topLevelNode.left) &&
                checkIsBinaryOp_Value_NonValue(topLevelNode.right)
            ) {
                // The tree has this form:
                // (c1 op1 x1) op (c2 op2 x2)
                const leftTree = topLevelNode.left as AstOpBinary;
                const rightTree = topLevelNode.right as AstOpBinary;

                const x1 = leftTree.right;
                const c1 = leftTree.left as AstValue;
                const op1 = leftTree.op;

                const x2 = rightTree.right;
                const c2 = rightTree.left as AstValue;
                const op2 = rightTree.op;

                const op = topLevelNode.op;

                // Check that:
                // the operators are allowed
                // op1 and op associate
                // op and op2 associate
                // op commutes
                if (
                    this.areAllowedOps([op1, op, op2]) &&
                    this.areAssociative(op1, op) &&
                    this.areAssociative(op, op2) &&
                    this.isCommutative(op)
                ) {
                    // Agglutinate the constants and compute their final value
                    try {
                        // If an error occurs, we abandon the simplification
                        const val = evalBinaryOp(
                            op1,
                            extractValue(c1),
                            extractValue(c2),
                        );

                        // The final expression is
                        // val op (x1 op2 x2)

                        // Because we are joining x1 and x2,
                        // there is further opportunity of simplification,
                        // So, we ask the evaluator to apply all the rules in the subtree.
                        const newRight = optimizer.applyRules(
                            makeBinaryExpression(op2, x1, x2),
                        );
                        const newLeft = makeValueExpression(val);
                        return makeBinaryExpression(op, newLeft, newRight);
                    } catch (e) {
                        // Do nothing: will exit rule without modifying tree
                    }
                }
            }
        }

        // If execution reaches here, it means that the rule could not be applied fully
        // so, we return the original tree
        return ast;
    }
}

export class AssociativeRule2 extends AllowableOpRule {
    public applyRule(
        ast: AstExpression,
        optimizer: ExpressionTransformer,
    ): AstExpression {
        if (checkIsBinaryOpNode(ast)) {
            const topLevelNode = ast as AstOpBinary;
            if (
                checkIsBinaryOp_NonValue_Value(topLevelNode.left) &&
                !isValue(topLevelNode.right)
            ) {
                // The tree has this form:
                // (x1 op1 c1) op x2
                const leftTree = topLevelNode.left as AstOpBinary;
                const rightTree = topLevelNode.right;

                const x1 = leftTree.left;
                const c1 = leftTree.right as AstValue;
                const op1 = leftTree.op;

                const x2 = rightTree;

                const op = topLevelNode.op;

                // Check that:
                // the operators are allowed
                // op1 and op associate
                // op commutes
                if (
                    this.areAllowedOps([op1, op]) &&
                    this.areAssociative(op1, op) &&
                    this.isCommutative(op)
                ) {
                    // The final expression is
                    // (x1 op1 x2) op c1

                    // Because we are joining x1 and x2,
                    // there is further opportunity of simplification,
                    // So, we ask the evaluator to apply all the rules in the subtree.
                    const newLeft = optimizer.applyRules(
                        makeBinaryExpression(op1, x1, x2),
                    );
                    return makeBinaryExpression(op, newLeft, c1);
                }
            } else if (
                checkIsBinaryOp_Value_NonValue(topLevelNode.left) &&
                !isValue(topLevelNode.right)
            ) {
                // The tree has this form:
                // (c1 op1 x1) op x2
                const leftTree = topLevelNode.left as AstOpBinary;
                const rightTree = topLevelNode.right;

                const x1 = leftTree.right;
                const c1 = leftTree.left as AstValue;
                const op1 = leftTree.op;

                const x2 = rightTree;

                const op = topLevelNode.op;

                // Check that:
                // the operators are allowed
                // op1 and op associate
                if (
                    this.areAllowedOps([op1, op]) &&
                    this.areAssociative(op1, op)
                ) {
                    // The final expression is
                    // c1 op1 (x1 op x2)

                    // Because we are joining x1 and x2,
                    // there is further opportunity of simplification,
                    // So, we ask the evaluator to apply all the rules in the subtree.
                    const newRight = optimizer.applyRules(
                        makeBinaryExpression(op, x1, x2),
                    );
                    return makeBinaryExpression(op1, c1, newRight);
                }
            } else if (
                !isValue(topLevelNode.left) &&
                checkIsBinaryOp_NonValue_Value(topLevelNode.right)
            ) {
                // The tree has this form:
                // x2 op (x1 op1 c1)
                const leftTree = topLevelNode.left;
                const rightTree = topLevelNode.right as AstOpBinary;

                const x1 = rightTree.left;
                const c1 = rightTree.right as AstValue;
                const op1 = rightTree.op;

                const x2 = leftTree;

                const op = topLevelNode.op;

                // Check that:
                // the operators are allowed
                // op and op1 associate
                if (
                    this.areAllowedOps([op, op1]) &&
                    this.areAssociative(op, op1)
                ) {
                    // The final expression is
                    // (x2 op x1) op1 c1

                    // Because we are joining x1 and x2,
                    // there is further opportunity of simplification,
                    // So, we ask the evaluator to apply all the rules in the subtree.
                    const newLeft = optimizer.applyRules(
                        makeBinaryExpression(op, x2, x1),
                    );
                    return makeBinaryExpression(op1, newLeft, c1);
                }
            } else if (
                !isValue(topLevelNode.left) &&
                checkIsBinaryOp_Value_NonValue(topLevelNode.right)
            ) {
                // The tree has this form:
                // x2 op (c1 op1 x1)
                const leftTree = topLevelNode.left;
                const rightTree = topLevelNode.right as AstOpBinary;

                const x1 = rightTree.right;
                const c1 = rightTree.left as AstValue;
                const op1 = rightTree.op;

                const x2 = leftTree;

                const op = topLevelNode.op;

                // Check that:
                // the operators are allowed
                // op and op1 associate
                // op is commutative
                if (
                    this.areAllowedOps([op, op1]) &&
                    this.areAssociative(op, op1) &&
                    this.isCommutative(op)
                ) {
                    // The final expression is
                    // c1 op (x2 op1 x1)

                    // Because we are joining x1 and x2,
                    // there is further opportunity of simplification,
                    // So, we ask the evaluator to apply all the rules in the subtree.
                    const newRight = optimizer.applyRules(
                        makeBinaryExpression(op1, x2, x1),
                    );
                    return makeBinaryExpression(op, c1, newRight);
                }
            }
        }

        // If execution reaches here, it means that the rule could not be applied fully
        // so, we return the original tree
        return ast;
    }
}

function ensureInt(val: Value): bigint {
    if (typeof val !== "bigint") {
        throw new Error(`integer expected`);
    }
    return val;
}

export class AssociativeRule3 extends AssociativeRewriteRule {
    private extraOpCondition: Map<
        AstBinaryOperation,
        (c1: Value, val: Value) => boolean
    >;

    // Two operators op1 and op2 pseudo-associate if:
    // there are operators op1', op2' and unary functions f, g, h such that:
    // (a op1 b) op2 c = f(a) op1' (g(b) op2' h(c))           (1)

    // So, in order to transform an expression with pseudo-associative operators, 
    // we need to know the operators and unary functions in the existential above, for
    // each pair of operators op1, op2.

    // This means that we will have a map, such that given op1, op2, the map will return a function
    // that receives the data in the left-side of equality (1) and returns their 
    // transformed counterparts in the right-side of equality (1).

    private leftAssocTransforms: Map<AstBinaryOperation, Map<AstBinaryOperation, associativityTransform>>;
    private rightAssocTransforms: Map<AstBinaryOperation, Map<AstBinaryOperation, associativityTransform>>;
    private rightCommuteTransforms: Map<AstBinaryOperation, Map<AstBinaryOperation, associativityTransform>>;
    private leftCommuteTransforms: Map<AstBinaryOperation, Map<AstBinaryOperation, associativityTransform>>;

    public constructor() {
        super();

        this.extraOpCondition = new Map([
            [
                "+",
                (c1, val) => {
                    const n1 = ensureInt(c1);
                    const res = ensureInt(val);
                    if (n1 === 0n) {
                        return true;
                    }
                    return sign(n1) === sign(res) && abs(n1) <= abs(res);
                },
            ],

            [
                "-",
                (c1, val) => {
                    const n1 = ensureInt(c1);
                    const res = ensureInt(val);
                    if (n1 === 0n) {
                        return true;
                    }
                    return sign(n1) === sign(res) && abs(n1) <= abs(res);
                },
            ],

            [
                "*",
                (c1, val) => {
                    const n1 = ensureInt(c1);
                    const res = ensureInt(val);
                    if (n1 < 0n) {
                        if (sign(n1) === sign(res)) {
                            return abs(n1) <= abs(res);
                        } else {
                            return abs(n1) < abs(res);
                        }
                    } else if (n1 === 0n) {
                        return true;
                    } else {
                        return abs(n1) <= abs(res);
                    }
                },
            ],
        ]);

        // First, we consider expressions of the form: (x1 op1 c1) op c2.

        // The following maps correspond to the pseudo-associativity transformation: x1 op1_ (f(c1) op_ g(c2))
        // and the operation for going back to op1: x1 op1 h(f(c1) op_ g(c2))
        // for each pair of operators op1, op. 
        // Here, we will denote f(c1) as c1_, g(c2) as c2_, f(c1) op_ g(c2) as val, 
        // and h(f(c1) op_ g(c2)) as val_
        
        // op1 = +
        
        // This map stores all possibilities for op and the corresponding transformations for c1, c2 and val.
        const plusLeftAssocOperators: Map<AstBinaryOperation, associativityTransform> = 
        new Map([
            ["+", { // original expression: (x1 + c1) + c2
                preTransform: (c1, c2) => {
                // op is +, so there is nothing to transform,
                // or equivalently, the transformation is identity
                return {op1_: "+", op_: "+", c1_: c1, c2_ : c2};
                },
                postTransform: (val) => {
                    // Since operators op1 and op did not change, 
                    // the transformation for going back is identity.
                    return {val_: val};
                }
            }
            ],

            ["-", { // original expression: (x1 + c1) - c2
                preTransform: (c1, c2) => {
                // op is -. There is nothing to transform,
                // because + already associates with -.
                return {op1_: "+", op_: "-", c1_: c1, c2_ : c2};
                },
                postTransform: (val) => {
                    return {val_: val};
                }
            }],
        ]);

        // op1 = -

        const minusLeftAssocOperators: Map<AstBinaryOperation, associativityTransform> = 
        new Map([
            ["+", { // original expression: (x1 - c1) + c2
                preTransform: (c1, c2) => {
                // op1 gets transformed into + and we multiply c1 by -1
                // so that the expression will look like x1 + (-c1 + c2)
                const newC1 = ensureInt(-ensureInt(c1));
                return {op1_: "+", op_: "+", c1_: newC1, c2_ : c2};
                },
                postTransform: (val) => {
                    // Our original expression looks like x1 + val
                    // But we need to go back to -, so we multiply val by -1
                    // to obtain x1 - (-val)
                    const newVal = ensureInt(-ensureInt(val));
                    return {val_: newVal};
                }
            }],

            ["-", { // original expression: (x1 - c1) - c2
                preTransform: (c1, c2) => {
                // op1 gets transformed into + and we multiply c1 by -1
                // so that the expression will look like x1 + (-c1 - c2)
                const newC1 = ensureInt(-ensureInt(c1));
                return {op1_: "+", op_: "-", c1_: newC1, c2_ : c2};
                },
                postTransform: (val) => {
                    return {val_: val};
                }
            }],
        ]);

        // op1 = *

        const multLeftAssocOperators: Map<AstBinaryOperation, associativityTransform> = 
        new Map([
            ["*", { // original expression: (x1 * c1) * c2
                preTransform: (c1, c2) => {
                // Nothing to transform because * is already associative
                return {op1_: "*", op_: "*", c1_: c1, c2_ : c2};
                },
                postTransform: (val) => {
                    // Since operators op1 and op did not change, 
                    // the transformation for going back is identity.
                    return {val_: val};
                }
            }
            ],
        ]);

        this.leftAssocTransforms = new Map([
            ["+", plusLeftAssocOperators],
            ["-", minusLeftAssocOperators],
            ["*", multLeftAssocOperators],
        ]);

        // Now consider expressions of the form: c2 op (c1 op1 x1).

        // The following maps correspond to the pseudo-associativity transformation: (f(c2) op_ g(c1)) op1_ g(x1)
        // and the operation for restoring x1: h(f(c2) op_ g(c1)) op1 x1
        // for each pair of operators op1, op. 
        // Here, we will denote g(c1) as c1_, f(c2) as c2_, f(c2) op_ g(c1) as val, 
        // and h(f(c2) op_ g(c1)) as val_

        // op = +
        
        const plusRightAssocOperators: Map<AstBinaryOperation, associativityTransform> = 
        new Map([
            ["+", { // original expression: c2 + (c1 + x1)
                preTransform: (c1, c2) => {
                return {op1_: "+", op_: "+", c1_: c1, c2_ : c2};
                },
                postTransform: (val) => {
                    return {val_: val};
                }
            }
            ],

            ["-", { // original expression: c2 + (c1 - x1)
                preTransform: (c1, c2) => {
                // There is nothing to transform,
                // because + already associates with -.
                return {op1_: "-", op_: "+", c1_: c1, c2_ : c2};
                },
                postTransform: (val) => {
                    return {val_: val};
                }
            }],
        ]);

        // op = -

        // Expressions of the form c2 - (c1 op1 x1) (for op1 \in {-, +}) cannot be simplified
        // without violating overflow preservation.
        // I am currently building a proof of this. 

        // op = *

        const multRightAssocOperators: Map<AstBinaryOperation, associativityTransform> = 
        new Map([
            ["*", { // original expression: c2 * (c1 * x1)
                preTransform: (c1, c2) => {
                // Identity, since * is already associative
                return {op1_: "*", op_: "*", c1_: c1, c2_ : c2};
                },
                postTransform: (val) => {
                    return {val_: val};
                }
            }],
        ]);

        this.rightAssocTransforms = new Map([
            ["+", plusRightAssocOperators],
            ["*", multRightAssocOperators],
        ]);

        // Now consider expressions of the form: c2 op (x1 op1 c1).

        // The following maps correspond to the pseudo-commutative-associative transformation: (h(c2) op_ i(f(c1))) op1_ i(g(x1))
        // and the operation for restoring x1: x1 op1 j(h(c2) op_ i(f(c1)))
        // for each pair of operators op1, op. 
        // Here, we will denote i(f(c1)) as c1_, h(c2) as c2_, h(c2) op_ i(f(c1)) as val, 
        // and j(h(c2) op_ i(f(c1))) as val_

        // op = +
        
        const plusRightCommuteOperators: Map<AstBinaryOperation, associativityTransform> = 
        new Map([
            ["+", { // original expression: c2 + (x1 + c1)
                preTransform: (c1, c2) => {
                return {op1_: "+", op_: "+", c1_: c1, c2_ : c2};
                },
                postTransform: (val) => {
                    return {val_: val};
                }
            }
            ],

            ["-", { // original expression: c2 + (x1 - c1)
                preTransform: (c1, c2) => {
                // Multiply c1 by -1 to get (c2 + -c1) + x1
                const newC1 = ensureInt(-ensureInt(c1));
                return {op1_: "+", op_: "+", c1_: newC1, c2_ : c2};
                },
                postTransform: (val) => {
                    // Final expression is x1 - -(c2 + -c1)
                    const newVal = ensureInt(-ensureInt(val));
                    return {val_: newVal};
                }
            }],
        ]);

        // op = -

        // Expressions of the form c2 - (x1 op1 c1) (for op1 \in {-, +}) cannot be simplified
        // without violating overflow preservation.
        // I am currently building a proof of this. 

        // op = *

        const multRightCommuteOperators: Map<AstBinaryOperation, associativityTransform> = 
        new Map([
            ["*", { // original expression: c2 * (x1 * c1)
                preTransform: (c1, c2) => {
                // Identity, since * is already associative
                return {op1_: "*", op_: "*", c1_: c1, c2_ : c2};
                },
                postTransform: (val) => {
                    return {val_: val};
                }
            }],
        ]);

        this.rightCommuteTransforms = new Map([
            ["+", plusRightCommuteOperators],
            ["*", multRightCommuteOperators],
        ]);

        // Now consider expressions of the form: (c1 op1 x1) op c2.

        // The following maps correspond to the pseudo-commute-associativity transformation: x1 op1_ (f(c1) op_ g(c2))
        // and the operation for going back to op1: h(f(c1) op_ g(c2)) op1 x1
        // for each pair of operators op1, op. 
        
        // op1 = +
        
        const plusLeftCommuteOperators: Map<AstBinaryOperation, associativityTransform> = 
        new Map([
            ["+", { // original expression: (c1 + x1) + c2
                preTransform: (c1, c2) => {
                // The transformation is identity, since + is already commutative and associative
                return {op1_: "+", op_: "+", c1_: c1, c2_ : c2};
                },
                postTransform: (val) => {
                    return {val_: val};
                }
            }
            ],

            ["-", { // original expression: (c1 + x1) - c2
                preTransform: (c1, c2) => {
                // There is nothing to transform,
                // because + already associates with -.
                return {op1_: "+", op_: "-", c1_: c1, c2_ : c2};
                },
                postTransform: (val) => {
                    return {val_: val};
                }
            }],
        ]);

        // op1 = -

        const minusLeftCommuteOperators: Map<AstBinaryOperation, associativityTransform> = 
        new Map([
            ["+", { // original expression: (c1 - x1) + c2
                preTransform: (c1, c2) => {
                // The expression will look like -x1 + (c1 + c2)
                return {op1_: "+", op_: "+", c1_: c1, c2_ : c2};
                },
                postTransform: (val) => {
                    // The final expression looks like (c1 + c2) - x1
                    return {val_: val};
                }
            }],

            ["-", { // original expression: (c1 - x1) - c2
                preTransform: (c1, c2) => {
                // The expression will look like -x1 + (c1 - c2)
                return {op1_: "+", op_: "-", c1_: c1, c2_ : c2};
                },
                postTransform: (val) => {
                    // The final expression looks like (c1 - c2) - x1
                    return {val_: val};
                }
            }],
        ]);

        // op1 = *

        const multLeftCommuteOperators: Map<AstBinaryOperation, associativityTransform> = 
        new Map([
            ["*", { // original expression: (c1 * x1) * c2
                preTransform: (c1, c2) => {
                // Nothing to transform because * is already associative
                return {op1_: "*", op_: "*", c1_: c1, c2_ : c2};
                },
                postTransform: (val) => {
                    // Since operators op1 and op did not change, 
                    // the transformation for going back is identity.
                    return {val_: val};
                }
            }
            ],
        ]);

        this.leftCommuteTransforms = new Map([
            ["+", plusLeftCommuteOperators],
            ["-", minusLeftCommuteOperators],
            ["*", multLeftCommuteOperators],
        ]);
    }

    protected opSatisfiesConditions(
        op: AstBinaryOperation,
        c1: Value,
        res: Value,
    ): boolean {
        if (this.extraOpCondition.has(op)) {
            return this.extraOpCondition.get(op)!(c1, res);
        } else {
            return false;
        }
    }

    private lookupTransform(keyOp1: AstBinaryOperation, keyOp2: AstBinaryOperation, 
        transforms: Map<AstBinaryOperation, Map<AstBinaryOperation, associativityTransform>>): associativityTransform | undefined {
            if (transforms.has(keyOp1)) {
                const intermediateMap = transforms.get(keyOp1)!;
                if (intermediateMap.has(keyOp2)) {
                    return intermediateMap.get(keyOp2)!;
                }
            }
            return undefined;
    }

    protected getLeftAssociativityTransform(keyOp1: AstBinaryOperation, keyOp2: AstBinaryOperation): associativityTransform | undefined {
        return this.lookupTransform(keyOp1, keyOp2, this.leftAssocTransforms);
    }

    protected getRightAssociativityTransform(keyOp1: AstBinaryOperation, keyOp2: AstBinaryOperation): associativityTransform | undefined {
        return this.lookupTransform(keyOp1, keyOp2, this.rightAssocTransforms);
    }

    protected getLeftCommutativityTransform(keyOp1: AstBinaryOperation, keyOp2: AstBinaryOperation): associativityTransform | undefined {
        return this.lookupTransform(keyOp1, keyOp2, this.leftCommuteTransforms);
    }

    protected getRightCommutativityTransform(keyOp1: AstBinaryOperation, keyOp2: AstBinaryOperation): associativityTransform | undefined {
        return this.lookupTransform(keyOp1, keyOp2, this.rightCommuteTransforms);
    }

    public applyRule(
        ast: AstExpression,
        optimizer: ExpressionTransformer,
    ): AstExpression {
        if (checkIsBinaryOpNode(ast)) {
            const topLevelNode = ast as AstOpBinary;
            if (
                checkIsBinaryOp_NonValue_Value(topLevelNode.left) &&
                isValue(topLevelNode.right)
            ) {
                // The tree has this form:
                // (x1 op1 c1) op c2

                // The transformation will do the following.
                // (x1 op1 c1) op c2 
                // =  (pseudo-associativity)
                // x1 op1_ (f(c1) op_ g(c2))
                // =  (Transform op1_ back into op1)
                // = x1 op1 h(f(c1) op_ g(c2))

                const leftTree = topLevelNode.left as AstOpBinary;
                const rightTree = topLevelNode.right as AstValue;

                const x1 = leftTree.left;
                const c1 = extractValue(leftTree.right as AstValue);
                const op1 = leftTree.op;

                const c2 = extractValue(rightTree);

                const op = topLevelNode.op;

                // Agglutinate the constants and compute their final value
                try {
                    // This function gives:
                    // op1 => op1_
                    // op => op_
                    // c1 => f(c1)
                    // c2 => g(c2) 
                    const transform = this.getLeftAssociativityTransform(op1, op)!;
                    const preData = transform.preTransform(c1, c2);

                    const c1_ = preData.c1_;
                    const c2_ = preData.c2_;
                    const op1_ = preData.op1_;
                    const op_ = preData.op_;

                    // Check that:
                    // op1_ and op_ associate
                    if (
                        this.areAssociative(op1_, op_)
                    ) {
                    // If an error occurs, we abandon the simplification
                    const val = evalBinaryOp(op_, c1_, c2_);

                    // This functions gives:
                    // val => h(val)
                    const postData = transform.postTransform(val);

                    const finalVal = postData.val_;

                    // check the extra conditions on op1

                    if (
                        this.opSatisfiesConditions(op1, c1, finalVal)
                    ) {
                        // The final expression is
                        // x1 op1 finalVal

                        const newConstant = makeValueExpression(finalVal);
                        // Since the tree is simpler now, there is further
                        // opportunity for simplification that was missed
                        // previously
                        return optimizer.applyRules(
                            makeBinaryExpression(op1, x1, newConstant),
                        );
                    }
                }
                } catch (e) {
                    // Do nothing: will exit rule without modifying tree
                }
            } else if (
                checkIsBinaryOp_Value_NonValue(topLevelNode.left) &&
                isValue(topLevelNode.right)
            ) {
                // The tree has this form:
                // (c1 op1 x1) op c2

                // The transformation will do the following.
                // (c1 op1 x1) op c2 
                // =  (Transform op1 into commutative operator op1_
                //     so that op1_ and op will associate)
                // (f(c1) op1_ g(x1)) op c2
                // =  (Commutativity of op1_)
                // (g(x1) op1_ f(c1)) op c2
                // =  (Associativity of op1_ and op)
                // = g(x1) op1_ (f(c1) op c2)
                // =  (Commutativity of op1_)
                // = (f(c1) op c2) op1_ g(x1)
                
                // =  (Transform op1_ back into op1)   
                // This last step is neccessary to remove
                // unexpected overflows in the subexpression op1_ g(x1)
                // Also, note that this transformation assumes that 
                // g is an invertible function.

                // = h(f(c1) op c2) op1 x1

                const leftTree = topLevelNode.left as AstOpBinary;
                const rightTree = topLevelNode.right as AstValue;

                const x1 = leftTree.right;
                const c1 = extractValue(leftTree.left as AstValue);
                const op1 = leftTree.op;

                const c2 = extractValue(rightTree);

                const op = topLevelNode.op;

                // Agglutinate the constants and compute their final value
                try {
                    // This function gives:
                    // op1 => op1_
                    // c1 => f(c1)
                    const transform = this.getLeftCommutativityTransform(op1, op)! 
                    const preData = transform.preTransform(c1, c2);
                    
                    const c1_ = preData.c1_;
                    const c2_ = preData.c2_;
                    const op1_ = preData.op1_;
                    const op_ = preData.op_;

                    // Check that:
                    // op1_ and op associate
                    // op1_ commutes
                    if (
                        this.areAssociative(op1_, op) &&
                        this.isCommutative(op1_)
                    ) { 
                    // If an error occurs, we abandon the simplification
                    const val = evalBinaryOp(op, c1_, c2);

                    // This function gives:
                    // val => h(val)
                    const postData = transform.postTransform(val);

                    const finalVal = postData.val_;

                    // Check extra conditions on op1

                    if (this.opSatisfiesConditions(op1, c1, finalVal)) {
                        // The final expression will be 
                        // finalVal op1 x1

                        const newConstant = makeValueExpression(finalVal);
                        // Since the tree is simpler now, there is further
                        // opportunity for simplification that was missed
                        // previously
                        return optimizer.applyRules(
                            makeBinaryExpression(op1, newConstant, x1),
                        );
                    }
                }
                } catch (e) {
                    // Do nothing: will exit rule without modifying tree
                }
            } else if (
                isValue(topLevelNode.left) &&
                checkIsBinaryOp_NonValue_Value(topLevelNode.right)
            ) {
                // The tree has this form:
                // c2 op (x1 op1 c1)

                // The transformation will do the following.
                // c2 op (x1 op1 c1)  
                // =  (Transform op1 into commutative operator op1_
                //     so that op and op1_ will associate)
                // c2 op (f(x1) op1_ g(c1))
                // =  (Commutativity of op1_)
                // c2 op (g(c1) op1_ f(x1))
                // =  (Associativity of op and op1_)
                // = (c2 op g(c1)) op1_ f(x1)
                // =  (Commutativity of op1_)
                // = f(x1) op1_ (c2 op g(c1))
                
                // =  (Transform op1_ back into op1)   
                // This last step is neccessary to remove
                // unexpected overflows in the subexpression f(x1) op1_
                // Also, note that this transformation assumes that 
                // f is an invertible function.

                // = x1 op1 h(c2 op g(c1))

                const leftTree = topLevelNode.left as AstValue;
                const rightTree = topLevelNode.right as AstOpBinary;

                const x1 = rightTree.left;
                const c1 = extractValue(rightTree.right as AstValue);
                const op1 = rightTree.op;

                const c2 = extractValue(leftTree);

                const op = topLevelNode.op;

                // Agglutinate the constants and compute their final value
                try {
                    // This function gives:
                    // op1 => op1_
                    // c1 => g(c1)
                    const transform = this.getRightCommutativityTransform(op, op1)!;
                    const preData = transform.preTransform(c1, c2);

                    const c1_ = preData.c1_;
                    const c2_ = preData.c2_;
                    const op1_ = preData.op1_;
                    const op_ = preData.op_;

                    // Check that:
                    // op and op1_ associate
                    // op1_ commutes
                    if (
                        this.areAssociative(op, op1_) &&
                        this.isCommutative(op1_)
                    ) {

                    // If an error occurs, we abandon the simplification
                    const val = evalBinaryOp(op, c2, c1_);

                    // This function gives:
                    // val => h(val)
                    const postData = transform.postTransform(val);

                    const finalVal = postData.val_;

                    // check the extra conditions on op1
                    if (
                        this.opSatisfiesConditions(op1, c1, finalVal)
                    ) {
                        // The final expression is
                        // x1 op1 finalVal

                        const newConstant = makeValueExpression(finalVal);
                        // Since the tree is simpler now, there is further
                        // opportunity for simplification that was missed
                        // previously
                        return optimizer.applyRules(
                            makeBinaryExpression(op1, x1, newConstant),
                        );
                    }
                }
                } catch (e) {
                    // Do nothing: will exit rule without modifying tree
                }
            } else if (
                isValue(topLevelNode.left) &&
                checkIsBinaryOp_Value_NonValue(topLevelNode.right)
            ) {
                // The tree has this form:
                // c2 op (c1 op1 x1)

                // The transformation will do the following.
                // c2 op (c1 op1 x1)
                // =  (pseudo-associativity)
                // (f(c2) op_ g(c1)) op1_ g(x1)   
                // Note that this step assumes that function g distributes 
                // over op1_
                // =  (Transform op1_ back into op1)
                // h(f(c2) op_ g(c1)) op1 x1
                // Note that this step assumes that g is invertible.

                const leftTree = topLevelNode.left as AstValue;
                const rightTree = topLevelNode.right as AstOpBinary;

                const x1 = rightTree.right;
                const c1 = extractValue(rightTree.left as AstValue);
                const op1 = rightTree.op;

                const c2 = extractValue(leftTree);

                const op = topLevelNode.op;

                // Agglutinate the constants and compute their final value
                try {
                    // This function gives:
                    // op1 => op1_
                    // op => op_
                    // c1 => f(c1)
                    // c2 => g(c2) 
                    const transform = this.getRightAssociativityTransform(op, op1)!;
                    const preData = transform.preTransform(c1, c2);

                    const c1_ = preData.c1_;
                    const c2_ = preData.c2_;
                    const op1_ = preData.op1_;
                    const op_ = preData.op_;

                    // Check that:
                    // op_ and op1_ associate
                    if (
                        this.areAssociative(op_, op1_)
                    ) {

                    // If an error occurs, we abandon the simplification
                    const val = evalBinaryOp(op_, c2_, c1_);

                    // This functions gives:
                    // val => h(val)
                    const postData = transform.postTransform(val);

                    const finalVal = postData.val_;

                    // check the extra conditions on op1
                    if(
                        this.opSatisfiesConditions(op1, c1, finalVal)
                    ) {
                        // The final expression is
                        // finalVal op1 x1

                        const newConstant = makeValueExpression(finalVal);
                        // Since the tree is simpler now, there is further
                        // opportunity for simplification that was missed
                        // previously
                        return optimizer.applyRules(
                            makeBinaryExpression(op1, newConstant, x1),
                        );
                    }
                }
                } catch (e) {
                    // Do nothing: will exit rule without modifying tree
                }
            }
        }

        // If execution reaches here, it means that the rule could not be applied fully
        // so, we return the original tree
        return ast;
    }
}
