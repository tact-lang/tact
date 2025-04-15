import type { CstLeaf, CstNode } from "@/fmt/cst/cst-parser";
import {
    childByField,
    childByType,
    childIdxByField,
    childLeafIdxWithText,
    childLeafWithText,
    containsComments,
    filterComments,
    isInlineComment,
    nonLeafChild,
    trailingNewlines,
    visit,
} from "@/fmt/cst/cst-helpers";
import { formatExpression } from "@/fmt/formatter/format-expressions";
import { formatAscription, formatType } from "@/fmt/formatter/format-types";
import {
    containsSeveralNewlines,
    formatId,
    formatSeparatedList,
    getLeafsBetween,
    isIgnoreDirective,
    multilineComments,
} from "@/fmt/formatter/helpers";
import {
    formatTrailingComments,
    formatInlineComments,
    formatComment,
} from "@/fmt/formatter/format-comments";
import type {
    FormatRule,
    FormatStatementRule,
} from "@/fmt/formatter/formatter";
import type { CodeBuilder } from "@/fmt/formatter/code-builder";

export const formatStatements: FormatRule = (code, node) => {
    const endIndex = childLeafIdxWithText(node, "}");
    const statements = node.children
        .slice(0, endIndex)
        .filter((it) => it.$ === "node");
    if (statements.length === 0) {
        code.add("{}");
        formatTrailingComments(code, node, endIndex, true);
        return;
    }

    const firstStatement = statements.at(0);
    if (isSingleLineStatement(node) && firstStatement) {
        code.add("{").space();
        formatStatement(code, firstStatement, false);
        code.space().add("}");
        return;
    }

    // don't add newline, see further comment
    code.add("{");

    // Block may have leading header comments after `{`:
    // ```
    // { // comment
    //   ^^^^^^^^^^ this
    //     let a = 100;
    // }
    // ```
    //
    // This flag tracks when we found the first new line,
    // in which case all further comments are NOT the leading heading
    let seenFirstNewline = false;

    let needNewLine = false;
    let skipNextStatement = false;

    for (let i = 0; i < endIndex; i++) {
        const statement = node.children.at(i);
        if (statement?.$ === "leaf") {
            if (!seenFirstNewline && statement.text.includes("\n")) {
                // add initial new line after `{`
                code.newLine().indent();
                seenFirstNewline = true;
                continue;
            }

            // don't add extra leading line
            if (i !== 1 && containsSeveralNewlines(statement.text)) {
                needNewLine = true;
                skipNextStatement = false;
            }
            continue;
        }

        if (needNewLine) {
            code.newLine();
            needNewLine = false;
        }

        if (statement?.type === "Comment") {
            if (!seenFirstNewline) {
                // found inline comment after `{`, need to add space before it
                code.space();
            }

            formatComment(code, statement);
            if (isIgnoreDirective(statement)) {
                skipNextStatement = true;
            }

            if (!seenFirstNewline) {
                // don't add new line for inline comment
                continue;
            }
        } else if (statement?.group === "statement") {
            if (!seenFirstNewline) {
                // add initial new line after `{`
                code.newLine().indent();
                seenFirstNewline = true;
            }

            if (skipNextStatement) {
                code.add(visit(statement).trim());
            } else {
                formatStatement(code, statement, true);
            }

            const newlines = trailingNewlines(statement);
            if (newlines > 1) {
                needNewLine = true;
                skipNextStatement = false;
            }
        }

        code.newLine();
    }

    code.dedent().add("}");

    formatTrailingComments(code, node, endIndex, true);
};

export const formatStatement: FormatStatementRule = (
    code,
    node,
    needSemicolon,
) => {
    switch (node.type) {
        case "StatementLet": {
            formatLetStatement(code, node, needSemicolon);
            break;
        }
        case "StatementDestruct": {
            formatDestructStatement(code, node, needSemicolon);
            break;
        }
        case "StatementReturn": {
            formatReturnStatement(code, node, needSemicolon);
            break;
        }
        case "StatementExpression": {
            formatExpressionStatement(code, node, needSemicolon);
            break;
        }
        case "StatementAssign": {
            formatAssignStatement(code, node, needSemicolon);
            break;
        }
        case "StatementCondition": {
            formatConditionStatement(code, node);
            break;
        }
        case "StatementWhile": {
            formatWhileStatement(code, node);
            break;
        }
        case "StatementRepeat": {
            formatRepeatStatement(code, node);
            break;
        }
        case "StatementUntil": {
            formatUntilStatement(code, node, needSemicolon);
            break;
        }
        case "StatementTry": {
            formatTryStatement(code, node);
            break;
        }
        case "StatementForEach": {
            formatForEachStatement(code, node);
            break;
        }
        case "StatementBlock": {
            const body = childByField(node, "body");
            if (body) {
                formatStatements(code, body);
            }
            break;
        }
        default: {
            throw new Error(`Unsupported statement type: ${node.type}`);
        }
    }
};

function formatCommentsBetweenAssignAndValue(
    code: CodeBuilder,
    node: CstNode,
    assign: CstLeaf,
    init: CstNode,
): boolean {
    const commentsAndNewlines = getLeafsBetween(node, assign, init);
    const comments = filterComments(commentsAndNewlines);
    if (comments.length > 0) {
        const multiline = multilineComments(commentsAndNewlines);

        if (multiline) {
            code.indent();
            code.newLine();
        } else {
            code.space();
        }

        for (const comment of commentsAndNewlines) {
            if (comment.$ !== "node" || comment.type !== "Comment") continue;
            formatComment(code, comment);
        }

        if (multiline) {
            code.newLine();
            code.dedent();
        } else {
            code.space();
        }

        return true;
    }

    return false;
}

const formatLetStatement: FormatStatementRule = (code, node, needSemicolon) => {
    // let name : Int = 100;
    //     ^^^^ ^^^^^ ^ ^^^
    //     |    |     | |
    //     |    |     | init
    //     |    |     assign
    //     |    typeOpt
    //     name
    const name = childByField(node, "name");
    const typeOpt = childByField(node, "type");
    const init = childByField(node, "init");
    const assign = childLeafWithText(node, "=");

    if (!name || !init || !assign) {
        throw new Error("Invalid let statement");
    }

    code.add("let").space().apply(formatId, name);

    if (typeOpt) {
        formatInlineComments(node, code, name, typeOpt, true);
        formatAscription(code, typeOpt);
        formatInlineComments(node, code, typeOpt, assign, true);
    } else {
        formatInlineComments(node, code, name, assign, true);
    }

    code.space().add("=");

    const hasMultilineComment = formatCommentsBetweenAssignAndValue(
        code,
        node,
        assign,
        init,
    );
    const needIndentAndNewline = multilineExpression(init);
    if (needIndentAndNewline || hasMultilineComment) {
        if (needIndentAndNewline) {
            code.newLine();
        }
        code.indent();
    } else {
        code.space();
    }

    formatExpression(code, init);

    code.addIf(needSemicolon, ";");

    if (hasMultilineComment || needIndentAndNewline) {
        code.dedent();
    }

    const endIndex = childIdxByField(node, "init");
    formatTrailingComments(code, node, endIndex, true);
};

const multilineExpression = (expr: CstNode): boolean => {
    if (expr.type !== "Binary") return false;

    const tail = childByField(expr, "tail");
    if (!tail) return false;

    const exprRight = childByField(expr, "right");
    if (exprRight && exprRight.type !== "Binary") {
        // don't wrap multiline with single binary
        return false;
    }

    if (tail.children.length > 2) {
        return visit(expr).includes("\n");
    }

    const operator = childByField(tail, "op");
    if (operator && containsComments(operator.children)) {
        return true;
    }

    const right = childByField(tail, "right");
    if (right?.type !== "Binary") return false; // don't wrap multiline with single binary

    return visit(expr).includes("\n");
};

const formatReturnStatement: FormatStatementRule = (
    code,
    node,
    needSemicolon,
) => {
    // return 100;
    // ^^^^^^ ^^^
    // |      |
    // |      exprOpt
    // |
    // returnKeyword
    const returnKeyword = childLeafWithText(node, "return");
    if (!returnKeyword) {
        throw new Error("Invalid return statement");
    }
    const exprOpt = childByField(node, "expression");

    code.add("return");

    if (exprOpt) {
        const hasMultilineComment = formatCommentsBetweenAssignAndValue(
            code,
            node,
            returnKeyword,
            exprOpt,
        );
        const needIndentAndNewline = multilineExpression(exprOpt);
        if (needIndentAndNewline || hasMultilineComment) {
            if (needIndentAndNewline) {
                code.newLine();
            }
            code.indent();
        } else {
            code.space();
        }

        formatExpression(code, exprOpt);

        if (hasMultilineComment || needIndentAndNewline) {
            code.dedent();
        }
    }

    code.addIf(needSemicolon, ";");

    const endIndex = exprOpt ? childIdxByField(node, "expression") : 0; // index of return
    formatTrailingComments(code, node, endIndex, true);
};

const formatExpressionStatement: FormatStatementRule = (
    code,
    node,
    needSemicolon,
) => {
    // 10;
    // ^^ expression
    const expression = childByField(node, "expression");
    if (!expression) {
        throw new Error("Invalid expression statement");
    }

    formatExpression(code, expression);
    code.addIf(needSemicolon, ";");

    const endIndex = childIdxByField(node, "expression");
    formatTrailingComments(code, node, endIndex, true);
};

const formatAssignStatement: FormatStatementRule = (
    code,
    node,
    needSemicolon,
) => {
    // value + = 100;
    // ^^^^^ ^ ^ ^^^
    // |     | | |
    // |     | | right
    // |     | assign
    // |     operatorOpt
    // left
    const left = childByField(node, "left");
    const operatorOpt = childByField(node, "operator");
    const assign = childLeafWithText(node, "=");
    const right = childByField(node, "right");

    if (!left || !right || !assign) {
        throw new Error("Invalid assign statement");
    }

    formatExpression(code, left);

    code.space();
    if (operatorOpt) {
        code.add(visit(operatorOpt).trim());
    }

    code.add("=");

    const hasMultilineComment = formatCommentsBetweenAssignAndValue(
        code,
        node,
        assign,
        right,
    );
    const needIndentAndNewline = multilineExpression(right);
    if (needIndentAndNewline || hasMultilineComment) {
        if (needIndentAndNewline) {
            code.newLine();
        }
        code.indent();
    } else {
        code.space();
    }

    formatExpression(code, right);
    code.addIf(needSemicolon, ";");

    if (hasMultilineComment || needIndentAndNewline) {
        code.dedent();
    }

    const endIndex = childIdxByField(node, "right");
    formatTrailingComments(code, node, endIndex, true);
};

const formatConditionStatement: FormatRule = (code, node) => {
    // if (true) {} else {}
    // ^^ ^^^^^^ ^^ ^^^^^^^
    // |  |      |  |
    // |  |      |  falseBranchOpt
    // |  |      trueBranch
    // |  condition
    // ifKeyword
    const ifKeyword = childLeafWithText(node, "if");
    const condition = childByField(node, "condition");
    const trueBranch = childByField(node, "trueBranch");
    const falseBranchOpt = childByField(node, "falseBranch");

    if (!condition || !trueBranch || !ifKeyword) {
        throw new Error("Invalid condition statement");
    }

    code.add("if").space();
    formatInlineComments(node, code, ifKeyword, condition, false);

    formatExpression(code, condition);
    code.space();

    formatStatements(code, trueBranch);

    const trueBranchEndIndex = childLeafIdxWithText(trueBranch, "}");
    const trueBranchLeafs = trueBranch.children.slice(trueBranchEndIndex + 1);
    // if (true) {
    //     ...
    // }
    // // comment here
    // else { ... }
    const trueBranchComments = filterComments(trueBranchLeafs);

    if (falseBranchOpt) {
        if (
            isSingleLineStatement(trueBranch) ||
            trueBranchComments.length > 0
        ) {
            // add a new line to format like this:
            // if (true) { return 10 }
            // else { return 20 }
            code.newLine();
        } else {
            code.space();
        }

        code.add("else").space();

        const branch = nonLeafChild(falseBranchOpt);
        if (!branch) return;

        if (branch.type === "StatementCondition") {
            formatConditionStatement(code, branch);
        } else {
            const body = childByField(branch, "body");
            if (body) {
                formatStatements(code, body);
            }
        }
    }

    const endIndex = childIdxByField(
        node,
        falseBranchOpt ? "falseBranch" : "trueBranch",
    );
    formatTrailingComments(code, node, endIndex, true);
};

const formatWhileStatement: FormatRule = (code, node) => {
    formatLoopStatement(code, node, "while");
};

const formatRepeatStatement: FormatRule = (code, node) => {
    formatLoopStatement(code, node, "repeat");
};

const formatLoopStatement = (
    code: CodeBuilder,
    node: CstNode,
    kind: "repeat" | "while",
): void => {
    // while (true) {}
    //        ^^^^  ^^
    //        |     |
    //        |     body
    //        condition
    // or
    // repeat(true) {}
    //        ^^^^  ^^
    //        |     |
    //        |     body
    //        condition
    const condition = childByField(node, "condition");
    const body = childByField(node, "body");

    if (!condition || !body) {
        throw new Error("Invalid while statement");
    }

    // prettier-ignore
    code.add(kind).space()
        .apply(formatExpression, condition)
        .space()
        .apply(formatStatements, body)

    const endIndex = childIdxByField(node, "body");
    formatTrailingComments(code, node, endIndex, true);
};

const formatDestructField: FormatRule = (code, field) => {
    if (field.type === "RegularField") {
        // foo: bar
        // ^^^  ^^^
        // |    |
        // |    fieldName
        // varName
        const fieldName = childByField(field, "fieldName");
        const varName = childByField(field, "varName");
        if (!fieldName || !varName) {
            throw new Error("Invalid regular field in destruct");
        }

        code.apply(formatId, fieldName)
            .add(":")
            .space()
            .apply(formatId, varName);
    } else if (field.type === "PunnedField") {
        // foo
        // ^^^ this
        const name = childByField(field, "name");
        if (!name) {
            throw new Error("Invalid punned field in destruct");
        }
        code.apply(formatId, name);
    }
};

const formatDestructStatement: FormatStatementRule = (
    code,
    node,
    needSemicolon,
) => {
    // let Foo { arg, foo: param, .. } = foo();
    //     ^^^   ^^^^^^^^^^^^^^^  ^^   ^ ^^^^^
    //     |     |                |    | |
    //     |     |                |    | init
    //     |     |                |    assign
    //     |     |                restOpt
    //     |     fields
    //     type
    const type = childByField(node, "type");
    const fields = childByField(node, "fields");
    const restOpt = childByType(node, "RestArgument");
    const assign = childLeafWithText(node, "=");
    const init = childByField(node, "init");

    if (!type || !fields || !assign || !init) {
        throw new Error("Invalid destruct statement");
    }

    code.add("let").space();
    formatType(code, type);

    code.space();

    const restArg = restOpt?.type === "RestArgument" ? ".." : undefined;

    formatSeparatedList(code, fields, formatDestructField, {
        wrapperLeft: "{",
        wrapperRight: "}",
        extraWrapperSpace: " ",
        startIndex: 0,
        endIndex: 0,
        suffixElement: restArg,
        needSeparatorAfterSuffixElement: false, // comma is forbidden after `..`
    });

    code.space().add("=").space();
    formatExpression(code, init);
    code.addIf(needSemicolon, ";");

    const endIndex = childIdxByField(node, "init");
    formatTrailingComments(code, node, endIndex, true);
};

const formatUntilStatement: FormatStatementRule = (
    code,
    node,
    needSemicolon,
) => {
    // do {} until (true);
    //    ^^       ^^^^^^
    //    |        |
    //    |        condition
    //    body
    const body = childByField(node, "body");
    const condition = childByField(node, "condition");

    if (!body || !condition) {
        throw new Error("Invalid until statement");
    }

    // prettier-ignore
    code.add("do").space()
        .apply(formatStatements, body)
        .space().add("until").space()
        .apply(formatExpression, condition)
        .addIf(needSemicolon, ";")

    const endIndex = childIdxByField(node, "condition");
    formatTrailingComments(code, node, endIndex, true);
};

const formatTryStatement: FormatRule = (code, node) => {
    // try {} catch (e) {}
    //     ^^ ^^^^^^^^^^^^
    //     |  |
    //     |  handlerOpt
    //     body
    const body = childByField(node, "body");
    const handlerOpt = childByField(node, "handler");

    if (!body) {
        throw new Error("Invalid try statement");
    }

    code.add("try").space();
    formatStatements(code, body);

    if (handlerOpt) {
        // catch (e) {}
        //        ^  ^^
        //        |  |
        //        |  handlerBody
        //        name
        const name = childByField(handlerOpt, "name");
        const handlerBody = childByField(handlerOpt, "body");

        if (!name || !handlerBody) {
            throw new Error("Invalid catch handler");
        }

        code.space()
            .add("catch")
            .space()
            .add("(")
            .apply(formatId, name)
            .add(")")
            .space();
        formatStatements(code, handlerBody);
    }

    const endIndex = childIdxByField(node, handlerOpt ? "handler" : "body");
    formatTrailingComments(code, node, endIndex, true);
};

const formatForEachStatement: FormatRule = (code, node) => {
    // foreach (key, value in foo()) {}
    //          ^^^  ^^^^^    ^^^^^  ^^
    //          |    |        |      |
    //          |    |        |      body
    //          |    |        expression
    //          |    value
    //          key
    const key = childByField(node, "key");
    const value = childByField(node, "value");
    const expression = childByField(node, "expression");
    const body = childByField(node, "body");

    if (!key || !value || !expression || !body) {
        throw new Error("Invalid forEach statement");
    }

    code.add("foreach").space().add("(");
    code.apply(formatId, key)
        .add(",")
        .space()
        .apply(formatId, value)
        .space()
        .add("in")
        .space();
    formatExpression(code, expression);
    code.add(")").space();
    formatStatements(code, body);

    const endIndex = childIdxByField(node, "body");
    formatTrailingComments(code, node, endIndex, true);
};

function isSemicolonStatement(node: CstNode): boolean {
    return (
        node.type === "StatementLet" ||
        node.type === "StatementDestruct" ||
        node.type === "StatementReturn" ||
        node.type === "StatementExpression" ||
        node.type === "StatementAssign" ||
        node.type === "StatementUntil"
    );
}

function canBeSingleLine(node: CstNode): boolean {
    const hasInlineComments = node.children.some((it) => isInlineComment(it));
    if (hasInlineComments) {
        return false;
    }
    if (node.type === "StatementUntil") {
        return false;
    }
    if (node.type === "StatementReturn") {
        const expr = childByField(node, "expression");
        if (expr && expr.type === "StructInstance") {
            return false;
        }
    }
    const multiline = visit(node).trim().includes("\n");
    return !multiline;
}

function isSingleLineStatement(node: CstNode): boolean {
    const endIndex = childLeafIdxWithText(node, "}");
    const statements = node.children
        .slice(0, endIndex)
        .filter((it) => it.$ === "node");
    if (statements.length === 0) {
        return false;
    }

    const comments = filterComments(statements);
    const firstStatement = statements[0];
    return (
        statements.length === 1 &&
        typeof firstStatement !== "undefined" &&
        childLeafWithText(firstStatement, ";") === undefined &&
        isSemicolonStatement(firstStatement) &&
        canBeSingleLine(firstStatement) &&
        comments.length === 0
    );
}
