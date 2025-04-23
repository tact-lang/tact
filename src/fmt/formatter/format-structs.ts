import {
    childByField,
    childIdxByField,
    childLeafIdxWithText,
    childLeafWithText,
    childrenByType,
    containsComments,
    nonLeafChild,
} from "@/fmt/cst/cst-helpers";
import {
    containsSeveralNewlines,
    declName,
    formatId,
} from "@/fmt/formatter/helpers";
import { formatExpression } from "@/fmt/formatter/format-expressions";
import { formatDocComments } from "@/fmt/formatter/format-doc-comments";
import type {
    FormatRule,
    FormatStatementRule,
} from "@/fmt/formatter/formatter";
import { formatAscription } from "@/fmt/formatter/format-types";
import {
    formatComment,
    formatTrailingComments,
} from "@/fmt/formatter/format-comments";

export const formatStruct: FormatRule = (code, node) => {
    formatDocComments(code, node);
    code.add("struct").space().add(declName(node));
    formatFields(code, node);
};

export const formatMessage: FormatRule = (code, node) => {
    formatDocComments(code, node);
    code.add("message");

    // message(0x100) Foo {}
    //         ^^^^^ this
    const opcodeOpt = childByField(node, "opcode");
    if (opcodeOpt) {
        code.add("(");
        const expression = nonLeafChild(opcodeOpt);
        if (expression) {
            formatExpression(code, expression);
        }
        code.add(")");
    }

    code.space().add(declName(node));
    formatFields(code, node);
};

const formatFields: FormatRule = (code, node) => {
    const endIndex = childLeafIdxWithText(node, "}");
    const children = node.children.slice(0, endIndex);

    // struct can contain only comments, so we need to handle this case properly
    const hasComments = containsComments(children);

    const fieldsNode = childByField(node, "fields");
    if (!fieldsNode && !hasComments) {
        code.space().add("{}");

        // format inline comments after `}`
        formatTrailingComments(code, node, endIndex, true);
        return;
    }

    const fields = fieldsNode ? childrenByType(fieldsNode, "FieldDecl") : [];
    const firstField = fields.at(0);

    const oneLiner =
        fields.length === 1 &&
        firstField &&
        childLeafWithText(fieldsNode, ";") === undefined &&
        !hasComments;

    if (oneLiner) {
        code.space().add("{").space();
        formatField(code, firstField, false);
        code.space().add("}");

        // format inline comments after `}`
        formatTrailingComments(code, node, endIndex, true);
        return;
    }

    code.space().add("{").newLine().indent();

    for (const child of children) {
        if (child.$ === "leaf") continue;

        if (child.type === "Comment") {
            code.apply(formatComment, child);
            code.newLine();
        }

        if (child.field === "fields") {
            const fields = child.children;

            let needNewline = false;
            let needNewlineBetween = false;
            for (const field of fields) {
                if (field.$ === "leaf") {
                    if (containsSeveralNewlines(field.text)) {
                        needNewlineBetween = true;
                    }
                    continue;
                }

                if (needNewlineBetween) {
                    code.newLine();
                    needNewlineBetween = false;
                }

                if (field.type === "Comment") {
                    if (needNewline) {
                        code.newLine();
                    }
                    code.apply(formatComment, field);
                    code.newLine();
                    needNewline = false;
                } else if (field.type === "FieldDecl") {
                    if (needNewline) {
                        code.newLine();
                    }
                    formatField(code, field, true);
                    needNewline = true;
                }
            }

            if (needNewline) {
                code.newLine();
            }
        }
    }

    code.dedent().add("}");

    // format inline comments after `}`
    formatTrailingComments(code, node, endIndex, true);
};

export const formatField: FormatStatementRule = (code, decl, needSemicolon) => {
    formatDocComments(code, decl);

    // foo : Int = 100;
    // ^^^ ^^^^^   ^^^
    // |   |       |
    // |   |       initOpt
    // |   type
    // name
    const name = childByField(decl, "name");
    const type = childByField(decl, "type");
    const initOpt = childByField(decl, "expression");

    if (!name || !type) {
        throw new Error("Invalid field declaration");
    }

    // foo: Int
    code.apply(formatId, name).apply(formatAscription, type);

    if (initOpt) {
        // foo: Int = 100;
        //            ^^^ this
        const value = nonLeafChild(initOpt);
        if (value) {
            //  = 100
            code.space().add("=").space().apply(formatExpression, value);
        }
    }

    code.addIf(needSemicolon, ";");

    // since `;` is not a part of the field, we process all comments after type
    //
    // foo: Int; // 100
    //      ^^^ after this type
    const endIndex = childIdxByField(decl, "type");
    formatTrailingComments(code, decl, endIndex, true);
};
