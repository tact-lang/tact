import {
    childByField,
    childByType,
    childrenByType,
    nonLeafChild,
    textOfId,
    visit,
} from "@/fmt/cst/cst-helpers"
import {formatId} from "@/fmt/formatter/helpers"
import type {FormatRule} from "@/fmt/formatter/formatter"
import {formatTrailingComments} from "@/fmt/formatter/format-comments"

export const formatType: FormatRule = (code, node) => {
    switch (node.type) {
        case "TypeRegular": {
            formatTypeRegular(code, node)
            break
        }
        case "TypeGeneric": {
            formatTypeGeneric(code, node)
            break
        }
        case "TypeAs": {
            formatTypeAs(code, node)
            break
        }
        case "TypeOptional": {
            formatTypeOptional(code, node)
            break
        }
        case "TypeId": {
            code.add(textOfId(node))
            break
        }
        default: {
            code.add(visit(node).trim())
        }
    }
}

export const formatAscription: FormatRule = (code, node) => {
    // : Int
    //   ^^^ this
    const type = childByType(node, "TypeAs")
    if (!type) {
        throw new Error("Invalid ascription")
    }

    code.add(":").space()
    formatType(code, type)
}

const formatTypeRegular: FormatRule = (code, node) => {
    const child = childByField(node, "child")
    if (!child) {
        throw new Error("Invalid regular type")
    }

    code.add(textOfId(child))

    formatTrailingComments(code, child, 0, true)
}

const formatTypeGeneric: FormatRule = (code, node) => {
    // map<Int, String>
    // ^^^ ^^^^^^^^^^^
    // |   |
    // |   args
    // name
    const name = childByField(node, "name")
    const args = childByField(node, "args")

    if (!name || !args) {
        throw new Error("Invalid generic type")
    }

    formatType(code, name)

    // ["Int", ", ", "String"] -> ["Int", "String"]
    const typeArgs = childrenByType(args, "TypeAs")
    if (typeArgs.length === 0) {
        // bounced type
        typeArgs.push(...childrenByType(args, "TypeOptional"))
    }
    if (typeArgs.length > 0) {
        code.add("<")
        typeArgs.forEach((arg, i) => {
            formatType(code, arg)
            if (i < typeArgs.length - 1) {
                code.add(",").space()
            }
        })
        code.add(">")
    }
}

const formatTypeAs: FormatRule = (code, node) => {
    const type = childByField(node, "type")
    if (!type) {
        throw new Error("Invalid 'as' type")
    }

    formatType(code, type)

    // Int as int64
    //     ^^^^^^^^ this
    const asTypeOpt = childByField(node, "as")

    if (asTypeOpt) {
        const children = nonLeafChild(asTypeOpt)
        if (children) {
            code.space().add("as").space()
            code.apply(formatId, children)
        }
    }
}

const formatTypeOptional: FormatRule = (code, node) => {
    const type = childByType(node, "TypeRegular")
    if (type) {
        formatType(code, type)
    }

    const typeGeneric = childByType(node, "TypeGeneric")
    if (typeGeneric) {
        formatType(code, typeGeneric)
    }

    // Foo?
    //    ^ this
    const optionals = childrenByType(node, "optionals")
    for (const _ of optionals) {
        code.add("?")
    }
}
