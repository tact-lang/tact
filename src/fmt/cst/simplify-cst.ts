import type {Cst} from "@/fmt/cst/cst-parser"

export const simplifyCst = (node: Cst): Cst => {
    if (node.$ === "leaf") {
        return node
    }

    if (node.type === "ParameterList") {
        return {
            ...node,
            children: node.children.flatMap(it => {
                if (it.$ === "node" && it.field === "tail") {
                    return it.children.flatMap(it => simplifyCst(it))
                }
                return simplifyCst(it)
            }),
        }
    }

    if (node.type === "traits" || node.type === "fields" || node.type === "args") {
        return {
            ...node,
            children: node.children.flatMap(it => {
                if (it.$ === "node" && it.type === "tail") {
                    return it.children.flatMap(it => simplifyCst(it))
                }
                return simplifyCst(it)
            }),
        }
    }

    const firstChild = node.children.at(0);

    if (node.type === "IntegerLiteral" && typeof firstChild !== "undefined") {
        const child = simplifyCst(firstChild)
        if (child.$ !== "node") return child
        const value = child.children.at(0)
        if (value?.$ !== "node") return child
        return {
            ...node,
            children: [
                {
                    ...value,
                    field: "value",
                },
            ],
        }
    }

    if (
        (node.type === "Binary" ||
            node.type === "Unary" ||
            node.type === "Suffix" ||
            node.type === "Conditional") &&
        typeof firstChild !== "undefined"
    ) {
        const result = simplifyCst(firstChild)
        if (result.$ === "leaf") return result
        return {
            ...result,
            group: node.group,
            field: node.field,
        }
    }

    const processedChildren = node.children.flatMap(it => {
        if (it.$ !== "node") return it

        if (it.children.length === 1 && it.field === it.type) {
            if (
                it.type === "declarations" ||
                it.type === "items" ||
                it.type === "attributes" ||
                it.type === "imports" ||
                it.type === "fields" ||
                it.type === "ids"
            ) {
                // don't need to flatten lists with a single element
                return it
            }

            const firstChild = it.children.at(0)
            if (!firstChild || firstChild.$ !== "node") return it
            return {
                ...firstChild,
                field: it.field,
            }
        }

        return it
    })

    return {
        ...node,
        children: processedChildren.flatMap(it => simplifyCst(it)),
    }
}
