import { Interval } from "ohm-js";
import {
    AstExpression,
    AstNumber,
    AstBoolean,
    AstNull,
    AstString,
    SrcInfo,
} from "../grammar/ast";

export type ValueExpression = AstNumber | AstBoolean | AstNull | AstString;

export const DUMMY_INTERVAL: Interval = {
    sourceString: "",
    startIdx: 0,
    endIdx: 10,
    contents: "mock contents",
    minus(that) {
        // Returned the parameter so that the linter stops complaining
        return [that];
    },
    relativeTo(that) {
        // Returned the parameter so that the linter stops complaining
        return that;
    },
    subInterval(offset, len) {
        // Did this so that the linter stops complaining
        return offset == len ? this : this;
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
        // This this so that the linter stops complaining
        return intervals.length == 0 ? this : this;
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
            prevLine: "1",
        };
    },
};
export const DUMMY_LOCATION: SrcInfo = new SrcInfo(
    DUMMY_INTERVAL,
    null,
    "user",
);

export interface ExpressionTransformer {
    applyRules(ast: AstExpression): AstExpression;
}

export interface Rule {
    applyRule(
        ast: AstExpression,
        optimizer: ExpressionTransformer,
    ): AstExpression;
}
