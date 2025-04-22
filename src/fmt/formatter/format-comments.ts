import type { CodeBuilder } from "@/fmt/formatter/code-builder";
import type { Cst, CstNode } from "@/fmt/cst/cst-parser";
import { filterComments, visit } from "@/fmt/cst/cst-helpers";
import { getCommentsBetween } from "@/fmt/formatter/helpers";
import type { FormatRule } from "@/fmt/formatter/formatter";

export function formatTrailingComments(
    code: CodeBuilder,
    node: undefined | CstNode,
    startFrom: number,
    withSpace: boolean,
): void {
    if (!node || startFrom < 0) return;

    const afterBody = node.children.slice(startFrom + 1);
    if (afterBody.length === 0) return;

    const comments = filterComments(afterBody);
    if (comments.length > 0) {
        // if there are any newlines before, add a single newline
        const firstLeaf = afterBody.at(0);
        if (firstLeaf?.$ === "leaf" && firstLeaf.text.includes("\n")) {
            code.newLine();
        }
    }
    formatComments(code, comments, withSpace);
}

export function formatInlineComments(
    node: CstNode,
    code: CodeBuilder,
    start: Cst,
    end: Cst,
    withSpace: boolean,
): void {
    const comments = getCommentsBetween(node, start, end);
    formatComments(code, comments, withSpace);
}

export function formatComments(
    code: CodeBuilder,
    comments: Cst[],
    withSpace: boolean,
): void {
    if (comments.length === 0) return;

    if (withSpace) {
        code.space();
    }
    for (const comment of comments) {
        code.add(visit(comment));
    }
}

export function formatLineComments(code: CodeBuilder, comments: Cst[]): void {
    if (comments.length === 0) return;

    for (const comment of comments) {
        code.add(visit(comment).trim());
        code.newLine();
    }
}

export const formatComment: FormatRule = (code, comment) => {
    code.add(visit(comment).trim());
};
