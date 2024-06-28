import { Interval } from "ohm-js";
import { 
    ASTExpression,
    ASTNumber,
    ASTBoolean,
    ASTNull,
    ASTString,
    ASTOpBinary,
    ASTRef
 } from "../grammar/ast";

export type ValueExpression =  ASTNumber | ASTBoolean | ASTNull | ASTString;

export const DUMMY_INTERVAL: Interval = {
    sourceString: "",
    startIdx: 0,
    endIdx: 10,
    contents: "mock contents",
    minus: jest.fn().mockReturnThis(),
    relativeTo: jest.fn().mockReturnThis(),
    subInterval: jest.fn().mockReturnThis(),
    collapsedLeft: jest.fn().mockReturnThis(),
    collapsedRight: jest.fn().mockReturnThis(),
    trimmed: jest.fn().mockReturnThis(),
    coverageWith: jest.fn().mockReturnThis(),
    getLineAndColumnMessage: jest.fn().mockReturnValue(`Line 1, Column 0`),
    getLineAndColumn: jest.fn().mockReturnValue({ line: 1, column: 0 }),
  };
export const DUMMY_AST_REF: ASTRef = new ASTRef(DUMMY_INTERVAL, "dummy");

  
export interface ExpressionTransformer {
    applyRules(ast: ASTExpression): ASTExpression
}

export abstract class Rule {

    private priority: number;

    constructor(priority: number) {
        this.priority = priority;
    }

    public abstract applyRule(ast: ASTExpression, optimizer: ExpressionTransformer): ASTExpression;

    // A smaller number means greater priority. 
    // Hence, negative numbers have higher priority than positive numbers.
    public getPriority(): number {
        return this.priority;
    }
   
}