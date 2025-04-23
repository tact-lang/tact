import type { Cst, CstNode } from "@/fmt/cst/cst-parser";
import {
    childByField,
    childByType,
    childIdxByField,
    childLeafIdxWithText,
    containsComments,
    countNewlines,
    filterComments,
    isComment,
    nonLeafChild,
    textOfId,
    trailingNewlines,
    visit,
} from "@/fmt/cst/cst-helpers";
import { CodeBuilder } from "@/fmt/formatter/code-builder";
import { formatId, formatSeparatedList, idText } from "@/fmt/formatter/helpers";
import { formatType } from "@/fmt/formatter/format-types";
import {
    formatComment,
    formatTrailingComments,
} from "@/fmt/formatter/format-comments";
import { formatDocComments } from "@/fmt/formatter/format-doc-comments";
import type { FormatRule } from "@/fmt/formatter/formatter";

export const formatExpression = (code: CodeBuilder, node: Cst): void => {
    if (node.$ !== "node") {
        code.add(visit(node));
        return;
    }

    switch (node.type) {
        case "expression": {
            const child = nonLeafChild(node);
            if (child) {
                formatExpression(code, child);
            }
            return;
        }
        case "Operator": {
            const name = node.children.at(0);
            if (!name) {
                return;
            }
            code.add(visit(name).trim());
            return;
        }
        // TODO: better handling of literals
        case "StringLiteral": {
            code.add(visit(node).trim());
            return;
        }
        case "IntegerLiteral": {
            code.add(visit(node).trim());
            return;
        }
        case "IntegerLiteralDec": {
            code.add(visit(node).trim());
            return;
        }
        case "BoolLiteral": {
            code.add(visit(node).trim());
            return;
        }
        case "Null": {
            code.add("null");
            return;
        }
        case "StructInstance": {
            formatStructInstance(code, node);
            return;
        }
        case "SuffixFieldAccess": {
            formatSuffixFieldAccess(code, node);
            return;
        }
        case "SuffixUnboxNotNull": {
            formatSuffixUnboxNotNull(code, node);
            return;
        }
        case "SuffixCall": {
            formatSuffixCall(code, node);
            return;
        }
        case "Parens": {
            const child = childByField(node, "child");
            const expression = nonLeafChild(child);
            code.add("(").applyOpt(formatExpression, expression).add(")");

            const endIndex = childLeafIdxWithText(child, ")");
            formatTrailingComments(code, child, endIndex, true);
            return;
        }
        case "condition": {
            const expression = nonLeafChild(node);
            code.add("(").applyOpt(formatExpression, expression).add(")");
            return;
        }
        case "Conditional": {
            formatConditional(code, node);
            return;
        }
        case "Binary": {
            formatBinary(code, node);
            return;
        }
        case "Unary": {
            formatUnary(code, node);
            return;
        }
        case "ParameterList": {
            formatSeparatedList(code, node, formatExpression);
            return;
        }
        case "Suffix": {
            formatSuffix(code, node);
            return;
        }
        case "InitOf": {
            formatInitOf(code, node);
            return;
        }
        case "CodeOf": {
            formatCodeOf(code, node);
            return;
        }
        case "Id": {
            code.apply(formatId, node);
            return;
        }
    }

    code.add(visit(node).trim());
};

const formatBinary: FormatRule = (code, node) => {
    const lineLengthBeforeLeft = code.lineLength();
    let indented = false;

    const processBinaryTail = (code: CodeBuilder, node: Cst): void => {
        if (node.$ === "leaf") return;

        let newlinesCount = 0;

        for (const child of node.children) {
            if (child.$ === "leaf") continue;
            if (child.type === "Operator") {
                code.space();
            }
            code.apply(formatExpression, child);
            if (child.type === "Operator") {
                newlinesCount = trailingNewlines(child);

                const commentsStart = child.children.findIndex((it) =>
                    isComment(it),
                );
                const commentsEnd =
                    child.children.length -
                    1 -
                    [...child.children]
                        .reverse()
                        .findIndex((it) => isComment(it)) +
                    1;

                const comments = child.children.slice(
                    commentsStart,
                    commentsEnd,
                );

                if (containsComments(comments)) {
                    if (newlinesCount === 0) {
                        // inline comments after operator
                        code.space();
                    }

                    const preCommentsNewlines = countNewlines(
                        child.children[commentsStart - 1],
                    );
                    const postCommentsNewlines = countNewlines(
                        child.children[commentsEnd],
                    );

                    if (preCommentsNewlines > 0) {
                        code.newLines(preCommentsNewlines);
                    } else {
                        code.space();
                    }

                    for (const comment of comments) {
                        if (comment.$ === "leaf") {
                            const newlines = countNewlines(comment);
                            code.newLines(newlines);
                            continue;
                        }

                        if (comment.type === "Comment") {
                            formatComment(code, comment);
                        }
                    }

                    code.newLines(postCommentsNewlines - 1);

                    newlinesCount = 1;
                } else if (newlinesCount === 0) {
                    code.space();
                }
            }

            if (newlinesCount) {
                if (!indented && lineLengthBeforeLeft > 0) {
                    code.indentCustom(lineLengthBeforeLeft);
                    indented = true;
                }
                code.newLines(newlinesCount);
                newlinesCount = 0;
            }
        }
    };

    const head = childByField(node, "head");
    const tail = childByField(node, "tail");

    if (!head || !tail) {
        return;
    }

    code.apply(formatExpression, head);
    code.apply(processBinaryTail, tail);
    // eslint-disable-next-line @typescript-eslint/no-unnecessary-condition
    if (indented) {
        code.dedent();
    }
};

const formatUnary: FormatRule = (code, node) => {
    // ! foo
    // ^ ^^^
    // | |
    // | expression
    // |
    // prefixesNode
    const prefixesNode = childByField(node, "prefixes");
    const expression = childByField(node, "expression");

    if (!expression) {
        throw new Error("Invalid unary expression");
    }

    const prefixes = prefixesNode?.children ?? [];
    for (const prefix of prefixes) {
        formatExpression(code, prefix);
    }
    formatExpression(code, expression);
};

function isNestedConditional(node: CstNode): boolean {
    if (node.type === "Parens") {
        const child = childByField(node, "child");
        const expression = nonLeafChild(child);
        if (!expression) return false;
        return isNestedConditional(expression);
    }

    return node.type === "Conditional";
}

const formatConditional: FormatRule = (code, node) => {
    // foo ? bar : baz
    // ^^^ ^^^^^^^^^^^
    // |   |
    // |   tailOpt
    // head
    const head = node.children.at(0);
    const tailOpt = childByField(node, "tail");
    if (!head) {
        throw new Error("Invalid conditional expression");
    }
    formatExpression(code, head);

    if (!tailOpt) return; // Incomplete ternary

    const thenBranch = tailOpt.children.find((it) => it.$ === "node");
    const elseBranch = childByField(tailOpt, "elseBranch");
    if (!thenBranch || !elseBranch) {
        throw new Error("Invalid conditional branches");
    }

    const trueBranchCode = new CodeBuilder()
        .apply(formatExpression, thenBranch)
        .toString();
    const falseBranchCode = new CodeBuilder()
        .apply(formatExpression, elseBranch)
        .toString();

    const branchesWidth = trueBranchCode.length + falseBranchCode.length;

    const nestedConditional =
        isNestedConditional(thenBranch) || isNestedConditional(elseBranch);
    const multiline = branchesWidth > 70 || nestedConditional;
    if (multiline) {
        // format as:
        // bar
        //     ? trueBranch
        //     : falseBranch
        // prettier-ignore
        code.newLine().indent()
            .add("?").space().apply(formatExpression, thenBranch)
            .newLine()
            .add(":").space().apply(formatExpression, elseBranch)
            .dedent()
    } else {
        // format as:
        // bar ? trueBranch : falseBranch
        // prettier-ignore
        code.space().add("?").space()
            .apply(formatExpression, thenBranch)
            .space().add(":").space()
            .apply(formatExpression, elseBranch)
    }

    // trailing comments are processed in certain expression formatter
};

const formatInitOf: FormatRule = (code, node) => {
    code.add("initOf");
    // initOf JettonWallet(0, sender)
    //        ^^^^^^^^^^^^ ^^^^^^^^^
    //        |            |
    //        |            params
    //        name
    const name = childByField(node, "name");
    const params = childByField(node, "params");
    if (!name || !params) {
        throw new Error("Invalid initOf expression");
    }

    code.space().apply(formatId, name);
    formatSeparatedList(code, params, formatExpression);

    const endIndex = childLeafIdxWithText(params, ")");
    formatTrailingComments(code, params, endIndex, true);
};

const formatCodeOf: FormatRule = (code, node) => {
    code.add("codeOf");
    // codeOf JettonWallet
    //        ^^^^^^^^^^^^ this
    const name = childByField(node, "name");
    if (!name) {
        throw new Error("Invalid codeOf expression");
    }

    code.space().apply(formatId, name);

    // trailing comments are processed in `formatId`
};

const formatStructInstance: FormatRule = (code, node) => {
    // Foo { value: 100 }
    // ^^^ ^^^^^^^^^^^^^^
    // |   |
    // |   fields
    // type
    const type = childByField(node, "type");
    const fields = childByType(node, "StructInstanceFields");

    if (!type || !fields) {
        throw new Error("Invalid struct instance");
    }

    code.apply(formatType, type).space();

    formatSeparatedList(
        code,
        fields,
        (code, field) => {
            formatDocComments(code, field);

            // `value: 100` or just `value`
            const name = childByField(field, "name");
            if (!name) throw new Error("Invalid field initializer");

            code.add(textOfId(name));

            // value: 100
            //      ^^^^^ this
            const initOpt = childByField(field, "init");
            if (initOpt) {
                const expression = nonLeafChild(initOpt);
                if (expression === undefined) return;

                if (idText(name) === idText(expression)) {
                    // value: value -> value
                    return;
                }

                code.add(":").space();
                formatExpression(code, expression);
            }
        },
        {
            startIndex: 1,
            endIndex: -1,
            wrapperLeft: "{",
            wrapperRight: "}",
            extraWrapperSpace: " ",
            provideTrailingComments: (field) => {
                if (field.$ !== "node") return [];

                // value: 100
                //      ^^^^^ this
                const initOpt = childByField(field, "init");

                const searchField = initOpt ? "init" : "name";
                const endIndex = childIdxByField(field, searchField);
                return filterComments(field.children.slice(endIndex));
            },
        },
    );

    const endIndex = childLeafIdxWithText(fields, "}");
    formatTrailingComments(code, fields, endIndex, true);
};

interface ChainCall {
    nodes: CstNode[];
    leadingComments: CstNode[];
    trailingComments: CstNode[];
    hasLeadingNewline: boolean;
}

const formatSuffix: FormatRule = (code, node) => {
    const suffixes = childByField(node, "suffixes");
    if (!suffixes) return;

    const infos: ChainCall[] = [];
    let suffixesList =
        suffixes.type === "SuffixFieldAccess" ||
        suffixes.type === "SuffixCall" ||
        suffixes.type === "SuffixUnboxNotNull"
            ? [suffixes]
            : suffixes.children;

    // foo.bar()
    // ^^^
    const firstExpression = node.children.at(0);
    // foo.bar()
    //        ^^
    const firstSuffix = suffixesList.at(0);
    const secondSuffix = suffixesList.at(1);

    // first call suffix attached to first expression
    const firstSuffixIsCallOrNotNull =
        firstSuffix &&
        firstSuffix.$ === "node" &&
        (firstSuffix.type === "SuffixCall" ||
            firstSuffix.type === "SuffixUnboxNotNull");
    if (firstSuffixIsCallOrNotNull) {
        suffixesList = suffixesList.slice(1);
    }

    suffixesList.forEach((suffix) => {
        if (suffix.$ !== "node") return;

        if (suffix.type === "SuffixFieldAccess") {
            const name = childByField(suffix, "name");
            if (name) {
                infos.push({
                    nodes: [suffix],
                    hasLeadingNewline: name.children.some(
                        (it) => it.$ === "leaf" && it.text.includes("\n"),
                    ),
                    leadingComments: [],
                    trailingComments: [],
                });
            }
        }

        if (suffix.type === "SuffixCall" && infos.length > 0) {
            const lastInfo = infos.at(-1);
            if (lastInfo) {
                lastInfo.nodes.push(suffix);

                const params = childByField(suffix, "params");
                lastInfo.hasLeadingNewline =
                    params?.children.some(
                        (it) => it.$ === "leaf" && it.text.includes("\n"),
                    ) ?? false;
            }
        }

        if (suffix.type === "SuffixUnboxNotNull" && infos.length > 0) {
            const lastInfo = infos.at(-1);
            if (lastInfo) {
                lastInfo.nodes.push(suffix);
            }
        }
    });

    const indent = infos.slice(0, -1).some((call) => call.hasLeadingNewline)
        ? 4
        : 0;

    if (firstExpression) {
        formatExpression(code, firstExpression);
    }

    if (firstSuffixIsCallOrNotNull) {
        formatExpression(code, firstSuffix);

        if (
            secondSuffix &&
            secondSuffix.$ === "node" &&
            secondSuffix.type === "SuffixUnboxNotNull"
        ) {
            formatExpression(code, secondSuffix);
        }
    }

    const shouldBeMultiline =
        indent > 0 ||
        infos
            .slice(0, -1)
            .some(
                (call) =>
                    call.leadingComments.length > 0 ||
                    call.trailingComments.length > 0,
            );

    if (shouldBeMultiline) {
        code.indent();
        code.newLine();

        infos.forEach((info, index) => {
            info.nodes.forEach((child) => {
                code.apply(formatExpression, child);
            });

            if (index !== infos.length - 1) {
                code.newLine();
            }
        });

        code.dedent();
    } else {
        infos.forEach((info) => {
            info.nodes.forEach((child) => {
                code.apply(formatExpression, child);
            });
        });
    }

    return;
};

const formatSuffixFieldAccess: FormatRule = (code, node) => {
    const name = childByField(node, "name");
    if (!name) {
        throw new Error("Invalid field access expression");
    }

    code.add(".");
    code.apply(formatId, name);

    // trailing comments are processed in `formatId`
};

const formatSuffixUnboxNotNull: FormatRule = (code, node) => {
    code.add("!!");

    formatTrailingComments(code, node, 1, true);
};

const formatSuffixCall: FormatRule = (code, node) => {
    const args = childByField(node, "params");
    if (!args) {
        throw new Error("Invalid call expression");
    }

    const endIndex = childLeafIdxWithText(args, ")");

    formatSeparatedList(code, args, formatExpression, { endIndex });

    formatTrailingComments(code, args, endIndex, true);
};
