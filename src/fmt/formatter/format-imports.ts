import {
    childByField,
    childLeafIdxWithText,
    childrenByType,
    countNewlines,
    trailingNewlines,
} from "@/fmt/cst/cst-helpers";
import { formatExpression } from "@/fmt/formatter/format-expressions";
import { formatDocComments } from "@/fmt/formatter/format-doc-comments";
import {
    formatComment,
    formatTrailingComments,
} from "@/fmt/formatter/format-comments";
import type { FormatRule } from "@/fmt/formatter/formatter";

export const formatImports: FormatRule = (code, importsNode) => {
    const imports = childrenByType(importsNode, "Import");
    if (imports.length === 0) return;

    let needNewLine = false;
    let finalNewlines = false;

    for (const item of importsNode.children) {
        if (item.$ === "leaf") {
            const newlines = countNewlines(item);
            if (newlines > 1) {
                code.newLines(1);
                finalNewlines = true; // we don't want to add extra newline if we already add it here
            }
            continue;
        }

        if (needNewLine) {
            code.newLine();
            needNewLine = false;
        }

        if (item.type === "Import") {
            formatImport(code, item);
            code.newLine();

            const newlines = trailingNewlines(item);
            if (newlines > 1) {
                needNewLine = true;
            }
        }

        if (item.type === "Comment") {
            formatComment(code, item);
            code.newLine();
        }
    }

    if (!finalNewlines) {
        code.newLine();
    }
};

const formatImport: FormatRule = (code, node) => {
    formatDocComments(code, node);

    const path = childByField(node, "path");
    if (!path) {
        throw new Error("Invalid import node structure");
    }
    const value = childByField(path, "value");
    if (!value) {
        throw new Error("Invalid import node structure");
    }

    code.add("import");
    code.space();
    formatExpression(code, path);
    code.add(";");

    // process trailing comments after `;`
    const semicolonIndex = childLeafIdxWithText(node, ";");
    formatTrailingComments(code, node, semicolonIndex, true);
};
