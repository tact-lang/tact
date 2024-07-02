import { Interval } from "ohm-js";
import { 
    ASTExpression,
    ASTNumber,
    ASTBoolean,
    ASTNull,
    ASTString,
    SrcInfo
 } from "../grammar/ast";

export type ValueExpression =  ASTNumber | ASTBoolean | ASTNull | ASTString;

export const DUMMY_INTERVAL: Interval = {
    sourceString: "",
    startIdx: 0,
    endIdx: 10,
    contents: "mock contents",
    minus(that) {
        return [this];
    },
    relativeTo(that) {
        return this;
    },
    subInterval(offset, len) {
        return this;
    },
    collapsedLeft() {
        return this;
    },
    collapsedRight() {
        return this;
    },
    trimmed() {
        return this;
    },
    coverageWith(...intervals) {
        return this;
    },
    getLineAndColumnMessage() {
        return `Line 1, Column 0`;
    },
    getLineAndColumn() {
        return { 
            offset: 0, 
            lineNum: 1, 
            colNum: 0, 
            line: "1", 
            nextLine: "1", 
            prevLine: "1" 
        };
    }
  };
export const DUMMY_LOCATION: SrcInfo = new SrcInfo(DUMMY_INTERVAL, null, "user");

  
export interface ExpressionTransformer {
    applyRules(ast: ASTExpression): ASTExpression
}

export interface Rule {
    applyRule(ast: ASTExpression, optimizer: ExpressionTransformer): ASTExpression;
}