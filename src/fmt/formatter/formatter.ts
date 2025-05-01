import type { Cst, CstNode } from "@/fmt/cst/cst-parser";
import { CodeBuilder } from "@/fmt/formatter/code-builder";
import {
    formatFunction,
    formatNativeFunction,
    formatAsmFunction,
    formatPrimitiveType,
    formatConstant,
} from "@/fmt/formatter/format-declarations";
import { formatStatement } from "@/fmt/formatter/format-statements";
import { formatExpression } from "@/fmt/formatter/format-expressions";
import { visit, childByField, trailingNewlines } from "@/fmt/cst/cst-helpers";
import { formatContract, formatTrait } from "@/fmt/formatter/format-contracts";
import { formatMessage, formatStruct } from "@/fmt/formatter/format-structs";
import {
    hasIgnoreDirective,
    containsSeveralNewlines,
} from "@/fmt/formatter/helpers";
import { formatComment } from "@/fmt/formatter/format-comments";
import { formatImports } from "@/fmt/formatter/format-imports";

export type FormatRule = (code: CodeBuilder, node: CstNode) => void;
export type FormatStatementRule = (
    code: CodeBuilder,
    node: CstNode,
    needSemicolon: boolean,
) => void;

export const format = (node: Cst): string => {
    const code = new CodeBuilder();
    formatNode(code, node);
    return code.toString();
};

const formatNode = (code: CodeBuilder, node: Cst): void => {
    if (node.$ === "leaf") {
        code.add(node.text);
        return;
    }

    switch (node.type) {
        case "Root": {
            if (node.children.length === 0) {
                return;
            }

            let needNewLine = false;
            node.children.forEach((child, index) => {
                if (child.$ === "leaf") {
                    // don't add extra leading lines
                    if (index !== 0 && containsSeveralNewlines(child.text)) {
                        needNewLine = true;
                    }
                    return;
                }

                if (needNewLine) {
                    code.newLine();
                    needNewLine = false;
                }

                if (child.type === "Comment") {
                    formatComment(code, child);
                    code.newLine();
                    return;
                }

                formatNode(code, child);
                if (index < node.children.length - 2) {
                    code.newLine();
                }
            });
            code.trimNewlines().newLine();
            break;
        }
        case "Module": {
            const imports = childByField(node, "imports");
            if (imports) {
                formatImports(code, imports);
            }

            const itemsNode = childByField(node, "items");
            if (!itemsNode) {
                break;
            }

            let needNewLine = false;

            const items = itemsNode.children;
            items.forEach((item, index) => {
                if (item.$ === "leaf") {
                    if (containsSeveralNewlines(item.text)) {
                        needNewLine = true;
                    }
                    return;
                }

                if (needNewLine) {
                    code.newLine();
                    needNewLine = false;
                }

                if (item.type === "Comment") {
                    // floating comment
                    code.add(visit(item));
                    code.newLine();
                    return;
                }

                if (hasIgnoreDirective(item)) {
                    code.add(visit(item).trim());
                } else {
                    formatNode(code, item);
                }

                if (index < items.length - 1) {
                    code.newLine();
                }

                const newlines = trailingNewlines(item);
                if (newlines > 1) {
                    code.newLine();
                }
            });
            break;
        }

        case "PrimitiveTypeDecl": {
            formatPrimitiveType(code, node);
            break;
        }
        case "$Function": {
            formatFunction(code, node);
            break;
        }
        case "NativeFunctionDecl": {
            formatNativeFunction(code, node);
            break;
        }
        case "AsmFunction": {
            formatAsmFunction(code, node);
            break;
        }
        case "Contract": {
            formatContract(code, node);
            break;
        }
        case "Trait": {
            formatTrait(code, node);
            break;
        }
        case "StructDecl": {
            formatStruct(code, node);
            break;
        }
        case "MessageDecl": {
            formatMessage(code, node);
            break;
        }
        case "Constant": {
            formatConstant(code, node);
            break;
        }
        case "Comment": {
            formatComment(code, node);
            break;
        }
        case "StatementDestruct":
        case "StatementRepeat":
        case "StatementUntil":
        case "StatementTry":
        case "StatementForEach":
        case "StatementLet":
        case "StatementReturn":
        case "StatementExpression":
        case "StatementAssign":
        case "StatementCondition":
        case "StatementWhile":
        case "StatementBlock": {
            formatStatement(code, node, true);
            break;
        }
        default: {
            if (node.group === "expression") {
                formatExpression(code, node);
            } else {
                code.add(visit(node).trim());
            }
        }
    }
};
