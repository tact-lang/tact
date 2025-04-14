import type {Cst, CstNode} from "@/fmt/cst/cst-parser"
import {
    childByField,
    childByType,
    childIdxByField,
    childIdxByType,
    childLeafIdxWithText,
    containsComments,
    filterComments,
    isComment,
} from "@/fmt/cst/cst-helpers"

let pendingComments: Cst[] = []

interface CommentsExtraction {
    comments: Cst[]
    inlineComments: Cst[]
    startIndex: number
    floatingComments: Cst[] // not attached to any
}

// $Function
//   "fun"
//   " "
//   name: Id
//   parameters: ParameterList
//   body: FunctionDefinition
//
//     body: body
//       "{"
//       "}"
//       " "
//       Comment
//         "//"
//         " inline comment"
//       "\n\n"
//       Comment
//         "//"
//         " comment"
//       "\n"
//
//       ^^^^^^^^^^ this
//
// Comments here can be both inline (attached to node) and plain one (actually attached to the next declaration)
function extractComments([commentPoint, anchor]: [CstNode, Anchor]):
    | CommentsExtraction
    | undefined {
    const anchorIndex =
        typeof anchor === "string"
            ? childLeafIdxWithText(commentPoint, anchor)
            : anchor(commentPoint)
    if (anchorIndex === -1) {
        // No anchor, bug?
        return undefined
    }

    const actualAnchorIndex = anchorIndex + 1
    const followingLeafs = commentPoint.children.slice(actualAnchorIndex)
    if (!containsComments(followingLeafs)) {
        // no comments, no need to do anything
        return undefined
    }

    // find index where we break on the next line
    let inlineCommentsIndex =
        actualAnchorIndex +
        followingLeafs.findIndex(it => it.$ === "leaf" && it.text.includes("\n"))

    // all before, inline comments that we don't touch
    const inlineLeafs = followingLeafs.slice(0, inlineCommentsIndex - actualAnchorIndex)
    const inlineComments = filterComments(inlineLeafs)

    const inlineCommentFirstChildren = commentPoint.children.at(inlineCommentsIndex)
    if (inlineCommentFirstChildren?.$ === "leaf" && inlineCommentFirstChildren.text.includes("\n")) {
        // skip leading new lines
        inlineCommentsIndex++
    }
    // all after newline (inclusive)
    const remainingLeafs = commentPoint.children.slice(inlineCommentsIndex)
    if (remainingLeafs.length === 0) {
        return {
            comments: [],
            inlineComments: inlineComments,
            startIndex: inlineCommentsIndex,
            floatingComments: [],
        }
    }

    const lastLeaf = remainingLeafs.at(-1)
    // Comment is attached to declaration only when the last whitespace is not several line breaks
    const isAttachedTo =
        lastLeaf && lastLeaf.$ === "leaf" && !containsSeveralNewlines(lastLeaf.text)
    if (!isAttachedTo) {
        // comments are not attached, need to add a separate statement? TODO
        return {
            comments: [],
            inlineComments: [],
            startIndex: inlineCommentsIndex,
            floatingComments: remainingLeafs,
        }
    }

    const reverseDoubleNewlineIndex = [...remainingLeafs]
        .reverse()
        .findIndex(it => it.$ === "leaf" && containsSeveralNewlines(it.text))

    if (reverseDoubleNewlineIndex !== -1) {
        const index = remainingLeafs.length - reverseDoubleNewlineIndex
        return {
            comments: remainingLeafs.slice(index),
            inlineComments: inlineComments,
            startIndex: inlineCommentsIndex,
            floatingComments: remainingLeafs.slice(0, index),
        }
    }

    return {
        comments: remainingLeafs,
        inlineComments: inlineComments,
        startIndex: inlineCommentsIndex,
        floatingComments: [],
    }
}

function containsSeveralNewlines(text: string): boolean {
    const index = text.indexOf("\n")
    if (index === -1) {
        return false
    }
    return text.slice(index + 1).includes("\n")
}

const findNodeWithComments = (node: CstNode): undefined | [CstNode, string] => {
    if (node.type === "Import") {
        return [node, ";"]
    }
    if (node.type === "Contract") {
        return [node, "}"]
    }
    if (node.type === "PrimitiveTypeDecl") {
        return [node, ";"]
    }
    if (node.type === "NativeFunctionDecl") {
        return [node, ";"]
    }
    if (node.type === "AsmFunction") {
        return [node, "}"]
    }
    if (node.type === "Trait") {
        return [node, "}"]
    }
    if (node.type === "StructDecl" || node.type === "MessageDecl") {
        return [node, "}"]
    }
    if (node.type === "$Function") {
        const body = childByField(node, "body")
        if (body) {
            const innerBody = childByField(body, "body")
            if (!innerBody) {
                return [body, ";"]
            }
            return [innerBody, "}"]
        }
        return [node, ";"]
    }
    if (node.type === "Constant") {
        const body = childByField(node, "body")
        if (body) {
            return [body, ";"]
        }
    }

    const lastChildren = node.children.at(-1)
    if (!lastChildren || lastChildren.$ !== "node") return undefined
    return [lastChildren, "}"]
}

export const processDocComments = (node: Cst): Cst => {
    if (node.$ === "leaf") {
        return node
    }

    // // comment
    // const FOO: Int = 100;
    //
    // CST looks like this:
    //
    // Root
    //   "\n"
    //   Comment
    //     "//"
    //     " comment here"
    //   "\n"
    //   Comment
    //     "//"
    //     " comment here"
    //   "\n"
    //   Module
    //     items: items
    //       Constant
    //
    // And we need to extract top-level comment and attach it to next declaration
    if (node.type === "Root") {
        // Step 1: collect all nodes to Module
        const moduleIndex = childIdxByType(node, "Module")
        if (moduleIndex === -1) {
            // no Module?
            // no need to do anything
            return {
                ...node,
                children: node.children.map(it => processDocComments(it)),
            }
        }

        if (moduleIndex === 0) {
            // no nodes before Module, skip
            return {
                ...node,
                children: node.children.map(it => processDocComments(it)),
            }
        }

        const initialLeafs = node.children.slice(0, moduleIndex)
        if (!containsComments(initialLeafs)) {
            // no comments, no need to do anything
            return {
                ...node,
                children: node.children.map(it => processDocComments(it)),
            }
        }

        const lastLeaf = initialLeafs.at(-1)

        // Comment is attached to declaration only when the last whitespace is not several line breaks
        const isAttachedTo =
            lastLeaf && lastLeaf.$ === "leaf" && !containsSeveralNewlines(lastLeaf.text)
        if (!isAttachedTo) {
            // if comments are not attached, then we don't need to do anything
            return {
                ...node,
                children: node.children.map(it => processDocComments(it)),
            }
        }

        // skip top level whitespaces before comment
        let firstCommentIndex = initialLeafs.findIndex(it => isComment(it))

        const reverseDoubleNewlineIndex = [...initialLeafs]
            .reverse()
            .findIndex(it => it.$ === "leaf" && containsSeveralNewlines(it.text))

        if (reverseDoubleNewlineIndex !== -1) {
            firstCommentIndex = initialLeafs.length - reverseDoubleNewlineIndex
        }

        pendingComments = initialLeafs.slice(firstCommentIndex)

        // remove all extracted comments from Root
        const newChildren = [
            ...node.children.slice(0, firstCommentIndex),
            ...node.children.slice(moduleIndex),
        ]
        return {
            ...node,
            children: newChildren.map(it => processDocComments(it)),
        }
    }

    // items: Contract
    //   "contract"
    //   " "
    //   name: Id
    //     name: name
    //       "Foo"
    //     " "
    //   "{"
    //   "\n    "
    //   Comment
    //     "//"
    //     " comment"
    //   "\n"
    //   "}"
    //   "\n\n"
    if (node.type === "Contract" || node.type === "Trait") {
        // starting point to find any first comments
        const openBraceIndex = childLeafIdxWithText(node, "{")
        const closeBraceIndex = childLeafIdxWithText(node, "}")

        const childrenToProcess = node.children.slice(openBraceIndex + 1, closeBraceIndex)

        // all children before open brace
        const childrenBefore = node.children.slice(0, openBraceIndex + 1)
        const childrenAfter = node.children.slice(closeBraceIndex)

        // collect all nodes until some declaration
        const comments: Cst[] = []
        for (const element of childrenToProcess) {
            if (element.$ === "node" && element.type !== "Comment") {
                // found declaration
                break
            }
            comments.push(element)
        }

        if (!containsComments(comments)) {
            // no comments, no need to do anything
            return {
                ...node,
                children: node.children.map(it => processDocComments(it)),
            }
        }

        // remove all collected comments and whitespaces
        for (const _ of comments) {
            childrenToProcess.shift()
        }

        pendingComments = comments

        if (childrenToProcess.length === 0) {
            // empty contract with just comment
            childrenToProcess.push(...comments)
            pendingComments = []
        }

        const newChildren = [...childrenBefore, ...childrenToProcess, ...childrenAfter]
        return {
            ...node,
            children: newChildren.flatMap(it => processDocComments(it)),
        }
    }

    if (node.group === "contractItemDecl") {
        if (pendingComments.length > 0) {
            node.children.splice(0, 0, {
                $: "node",
                type: "DocComments",
                children: pendingComments,
                field: "doc",
                group: "",
                id: 0,
            })
            pendingComments = []
        }
    }

    // Root
    //   "\n"
    //   Module
    //     items: items
    //       Constant
    //         "const"
    //         " "
    //         name: Id
    //         type: type
    //         body: ConstantDefinition
    //           "="
    //           " "
    //           expression: IntegerLiteral
    //             value: IntegerLiteralDec
    //               digits: digits
    //                 "10"
    //           ";"
    //           " "
    //           Comment
    //             "//"
    //             " inline comment"
    //           "\n\n"
    //           Comment
    //             "//"
    //             " comment"
    //           "\n"
    //       $Function
    //         "fun"
    //         " "
    //         name: Id
    //         parameters: ParameterList
    //         body: FunctionDefinition
    //           body: body
    //             "{"
    //             "}"
    //             " "
    //             Comment
    //               "//"
    //               " inline comment"
    //             "\n\n"
    //             Comment
    //               "//"
    //               " comment"
    //             "\n"
    //       Contract
    //         "contract"
    //         " "
    //         name: Id
    //           name: name
    //             "Foo"
    //           " "
    //         "{"
    //         "}"
    //         "\n\n"
    //         Comment
    //           "//"
    //           " comment"
    //         "\n"
    //
    // Comments fore declaration are located inside previous declaration
    if (node.type === "Import" || node.group === "moduleItem") {
        if (pendingComments.length > 0) {
            node.children.splice(0, 0, {
                $: "node",
                type: "DocComments",
                children: pendingComments,
                field: "doc",
                group: "",
                id: 0,
            })
            pendingComments = []
        }
    }

    if (node.type === "items" || node.type === "declarations" || node.type === "imports") {
        const items = node.children

        let prevFieldsIndex = 0
        for (let i = 0; i < items.length; i++) {
            const item = items.at(i)

            if (item?.$ !== "node") continue

            // If there are some pending comments, we insert it as a new children
            if (pendingComments.length > 0 && item.type !== "Comment") {
                item.children.splice(0, 0, {
                    $: "node",
                    type: "DocComments",
                    children: pendingComments,
                    field: "doc",
                    group: "",
                    id: 0,
                })
                pendingComments = []
            }

            if (item.type === "Comment") {
                // this comment may be inline comment
                const children = items.slice(prevFieldsIndex, i)
                const inlineComment = !children.some(
                    it => it.$ === "leaf" && it.text.includes("\n"),
                )
                if (inlineComment) {
                    const prevItem = items.at(prevFieldsIndex)
                    if (prevItem?.$ === "node") {
                        // append inline comment to previous item
                        prevItem.children.push(item)
                        // remove comment and go back to not increment too much
                        items.splice(i, 1)
                        i--
                        continue
                    }
                }

                const nextItem = items.at(i + 1)
                if (nextItem && nextItem.$ === "leaf" && containsSeveralNewlines(nextItem.text)) {
                    // not attached to anything
                    items.splice(i - 1, 0, ...pendingComments)
                    i += pendingComments.length
                    pendingComments = []
                    continue
                }

                pendingComments.push(item)

                // remove comment and go back to not increment too much
                items.splice(i, 1)
                i--
                continue
            }

            prevFieldsIndex = i

            const found = findNodeWithComments(item)
            if (!found) {
                continue
            }

            const commentOwner = found

            const res = extractComments(commentOwner)
            if (!res) {
                continue
            }

            const {comments, startIndex, floatingComments} = res

            const owner = commentOwner[0]
            owner.children = owner.children.slice(0, startIndex)

            if (floatingComments.length > 0) {
                items.splice(i + 1, 0, ...floatingComments)
                i += floatingComments.length - 1
            }

            pendingComments.push(...comments)
        }

        if (node.type === "imports") {
            return node
        }

        // comments aren't attached to anything
        if (pendingComments.length > 0) {
            node.children.push(...pendingComments)
            pendingComments = []
        }
    }

    if (node.type === "body" || node.type === "trueBranch") {
        const statements = node.children
        let endIndex = statements.findIndex(it => it.$ === "leaf" && it.text === "}")

        let pendingComments: Cst[] = []

        for (let i = 0; i < endIndex; i++) {
            const statement = node.children.at(i)
            if (statement?.$ === "leaf") {
                continue
            }

            if (pendingComments.length > 0) {
                node.children.splice(i, 0, ...pendingComments)
                endIndex += pendingComments.length
                pendingComments = []
                continue
            }

            if (statement?.group === "statement") {
                const found = findStatementNodeWithComments(statement)
                if (!found) {
                    continue
                }

                const [owner, anchors] = found

                for (const anchor of anchors) {
                    const res = extractComments([owner, anchor])
                    if (res) {
                        if (res.inlineComments.length > 0 && owner !== statement) {
                            statement.children.push(...res.inlineComments)
                        }

                        pendingComments = res.comments
                        owner.children = owner.children.slice(0, res.startIndex)
                        if (res.inlineComments.length > 0 && owner !== statement) {
                            owner.children = owner.children.slice(
                                0,
                                owner.children.length - 1 - res.inlineComments.length,
                            )
                        }

                        if (res.floatingComments.length > 0) {
                            statements.splice(i + 1, 0, ...res.floatingComments)
                            i += res.floatingComments.length - 1
                            endIndex += res.floatingComments.length
                        }

                        break
                    }
                }
            }
        }

        if (pendingComments.length > 0) {
            node.children.splice(endIndex, 0, ...pendingComments)
        }
    }

    if (node.type === "StructDecl" || node.type === "MessageDecl") {
        const fields = childByField(node, "fields")
        if (!fields || fields.children.length === 0) {
            // nothing to do
            return {
                ...node,
                children: node.children.flatMap(it => processDocComments(it)),
            }
        }

        const startIndex = childLeafIdxWithText(node, "{") + 1
        const fieldsIndex = childIdxByField(node, "fields")

        const leadingLeafs = node.children.slice(startIndex, fieldsIndex)
        const leadingComments = filterComments(leadingLeafs)

        if (leadingComments.length === 0) {
            // nothing to do, no leading comments
            return {
                ...node,
                children: node.children.flatMap(it => processDocComments(it)),
            }
        }

        pendingComments = leadingComments
        const processedChildren = node.children.filter((_, index) => {
            if (index >= startIndex && index < fieldsIndex) {
                // remove all nodes that we take
                return false
            }
            // and keep other nodes
            return true
        })

        return {
            ...node,
            children: processedChildren.flatMap(it => processDocComments(it)),
        }
    }

    if (node.type === "fields") {
        const items = node.children

        let prevFieldsIndex = 0
        for (let i = 0; i < items.length; i++) {
            const item = items.at(i)

            if (item?.$ !== "node") continue

            // If there are some pending comments, we insert it as a new children
            if (pendingComments.length > 0 && item.type !== "Comment") {
                item.children.splice(0, 0, {
                    $: "node",
                    type: "DocComments",
                    children: pendingComments,
                    field: "doc",
                    group: "",
                    id: 0,
                })
                pendingComments = []
            }

            if (item.type === "Comment") {
                // this comment may be inline comment
                const children = items.slice(prevFieldsIndex, i)
                const inlineComment = !children.some(
                    it => it.$ === "leaf" && it.text.includes("\n"),
                )
                if (inlineComment) {
                    const prevItem = items.at(prevFieldsIndex)
                    if (prevItem?.$ === "node") {
                        // append inline comment to previous item
                        prevItem.children.push(item)
                        // remove comment and go back to not increment too much
                        items.splice(i, 1)
                        i--
                        continue
                    }
                }

                pendingComments.push(item)

                // remove comment and go back to not increment too much
                items.splice(i, 1)
                i--
                continue
            }

            prevFieldsIndex = i

            if (item.type === "StructFieldInitializer") {
                const found = findStatementNodeWithComments(item)
                if (!found) {
                    continue
                }

                const [owner, anchors] = found

                for (const anchor of anchors) {
                    const res = extractComments([owner, anchor])
                    if (res) {
                        if (res.inlineComments.length > 0 && owner !== item) {
                            item.children.push(...res.inlineComments)
                        }

                        pendingComments = res.comments
                        owner.children = owner.children.slice(0, res.startIndex)
                        if (res.inlineComments.length > 0 && owner !== item) {
                            owner.children = owner.children.slice(
                                0,
                                owner.children.length - 1 - res.inlineComments.length,
                            )
                        }
                        break
                    }
                }
            }
        }

        if (pendingComments.length > 0) {
            node.children.push(...pendingComments)
            pendingComments = []
        }
    }

    return {
        ...node,
        children: node.children.flatMap(it => processDocComments(it)),
    }
}

export type Anchor = string | ((n: CstNode) => number)

const findStatementNodeWithComments = (node: CstNode): undefined | [CstNode, Anchor[]] => {
    if (
        node.type === "StatementWhile" ||
        node.type === "StatementForEach" ||
        node.type === "StatementRepeat"
    ) {
        const body = childByField(node, "body")
        if (body) {
            return [body, ["}"]]
        }
    }

    if (node.type === "StatementBlock") {
        return [node, ["}"]]
    }

    if (node.type === "StatementTry") {
        const body = childByField(node, "body")
        const handler = childByField(node, "handler")
        if (!handler) {
            if (!body) return undefined
            return [body, ["}"]]
        }
        const handlerBody = childByField(handler, "body")
        if (handlerBody) {
            return [handlerBody, ["}"]]
        }
    }

    if (node.type === "StatementCondition") {
        const trueBranch = childByField(node, "trueBranch")
        if (!trueBranch) return undefined
        const falseBranch = childByField(node, "falseBranch")
        if (!falseBranch) {
            return [trueBranch, ["}"]]
        }
        const falseBranch2 = childByType(falseBranch, "FalseBranch")
        if (falseBranch2) {
            const body = childByField(falseBranch2, "body")
            if (body) {
                return [body, ["}"]]
            }
        }

        const falseBranchIf = childByType(falseBranch, "StatementCondition")
        if (!falseBranchIf) {
            return undefined
        }
        return findStatementNodeWithComments(falseBranchIf)
    }

    if (node.children.length > 0) {
        const child = node.children.at(-1)
        if (child && child.$ === "node") {
            return findStatementNodeWithComments(child)
        }

        return [
            node,
            [
                n => {
                    const index = [...n.children]
                        .reverse()
                        .findIndex(it => it.$ === "node" && it.type !== "Comment")
                    if (index === -1) {
                        return childLeafIdxWithText(n, ")")
                    }
                    return n.children.length - 1 - index
                },
                ";",
                "}",
            ],
        ]
    }

    return [node, [";"]]
}
