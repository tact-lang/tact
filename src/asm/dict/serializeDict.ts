import {CodeBuilder} from "../runtime/builder"

//
// Tree Build
//

export function findCommonPrefix(src: string[], startPos = 0) {
    // Corner cases
    if (src.length === 0) {
        return ""
    }

    const first = src[0]
    if (first === undefined) return ""

    let r = first.slice(startPos)

    for (let i = 1; i < src.length; i++) {
        const s = src[i]
        if (s === undefined) {
            break
        }
        while (s.indexOf(r, startPos) !== startPos) {
            r = r.substring(0, r.length - 1)

            if (r === "") {
                return r
            }
        }
    }

    return r
}

function pad(src: string, size: number) {
    while (src.length < size) {
        src = "0" + src
    }
    return src
}

type Node<T> =
    | {
          type: "fork"
          left: Edge<T>
          right: Edge<T>
      }
    | {
          type: "leaf"
          value: T
      }

type Edge<T> = {
    label: string
    node: Node<T>
}

function forkMap<T>(src: Map<string, T>, prefixLen: number) {
    const left = new Map<string, T>()
    const right = new Map<string, T>()

    for (const [key, value] of src.entries()) {
        if (key[prefixLen] === "0") {
            left.set(key, value)
        } else {
            right.set(key, value)
        }
    }

    return {left, right}
}

function buildNode<T>(src: Map<string, T>, prefixLen: number): Node<T> {
    if (src.size === 1) {
        const first = [...src.values()][0]
        if (!first) {
            throw new Error("impossible")
        }
        return {type: "leaf", value: first}
    }
    const {left, right} = forkMap(src, prefixLen)

    return {
        type: "fork",
        left: buildEdge(left, prefixLen + 1),
        right: buildEdge(right, prefixLen + 1),
    }
}

function buildEdge<T>(src: Map<string, T>, prefixLen = 0): Edge<T> {
    const label = findCommonPrefix([...src.keys()], prefixLen)
    return {
        label,
        node: buildNode(src, label.length + prefixLen),
    }
}

export function buildTree<T>(src: Map<bigint, T>, keyLength: number) {
    const converted = new Map<string, T>()
    for (const k of src.keys()) {
        const padded = pad(k.toString(2), keyLength)
        converted.set(padded, src.get(k)!)
    }

    return buildEdge(converted)
}

//
// Serialization
//

export function writeLabelShort(src: string, to: CodeBuilder) {
    // Header
    to.storeBit(0)

    // Unary length
    for (let i = 0; i < src.length; i++) {
        to.storeBit(1)
    }
    to.storeBit(0)

    // Value
    if (src.length > 0) {
        to.storeUint(BigInt("0b" + src), src.length)
    }
    return to
}

function labelShortLength(src: string) {
    return 1 + src.length + 1 + src.length
}

export function writeLabelLong(src: string, keyLength: number, to: CodeBuilder) {
    // Header
    to.storeBit(1)
    to.storeBit(0)

    // Length
    let length = Math.ceil(Math.log2(keyLength + 1))
    to.storeUint(src.length, length)

    // Value
    if (src.length > 0) {
        to.storeUint(BigInt("0b" + src), src.length)
    }
    return to
}

function labelLongLength(src: string, keyLength: number) {
    return 1 + 1 + Math.ceil(Math.log2(keyLength + 1)) + src.length
}

export function writeLabelSame(
    value: number | boolean,
    length: number,
    keyLength: number,
    to: CodeBuilder,
) {
    // Header
    to.storeBit(1)
    to.storeBit(1)

    // Value
    to.storeBit(value)

    // Length
    const lenLen = Math.ceil(Math.log2(keyLength + 1))
    to.storeUint(length, lenLen)
}

function labelSameLength(keyLength: number) {
    return 1 + 1 + 1 + Math.ceil(Math.log2(keyLength + 1))
}

function isSame(src: string) {
    if (src.length === 0 || src.length === 1) {
        return true
    }
    for (let i = 1; i < src.length; i++) {
        if (src[i] !== src[0]) {
            return false
        }
    }
    return true
}

export function detectLabelType(src: string, keyLength: number) {
    let kind: "short" | "long" | "same" = "short"
    let kindLength = labelShortLength(src)

    let longLength = labelLongLength(src, keyLength)
    if (longLength < kindLength) {
        kindLength = longLength
        kind = "long"
    }

    if (isSame(src)) {
        let sameLength = labelSameLength(keyLength)
        if (sameLength < kindLength) {
            kind = "same"
        }
    }

    return kind
}

function writeLabel(src: string, keyLength: number, to: CodeBuilder) {
    const type = detectLabelType(src, keyLength)
    if (type === "short") {
        writeLabelShort(src, to)
    } else if (type === "long") {
        writeLabelLong(src, keyLength, to)
    } else if (type === "same") {
        writeLabelSame(src[0] === "1", src.length, keyLength, to)
    }
}

function writeNode<T>(
    src: Node<T>,
    keyLength: number,
    serializer: (src: T, cell: CodeBuilder) => void,
    to: CodeBuilder,
) {
    if (src.type === "leaf") {
        serializer(src.value, to)
    }

    if (src.type === "fork") {
        const leftBuilder = new CodeBuilder()
        const rightBuilder = new CodeBuilder()

        writeEdge(src.left, keyLength - 1, serializer, leftBuilder)
        writeEdge(src.right, keyLength - 1, serializer, rightBuilder)

        to.storeRef(leftBuilder.asCell())
        to.storeRef(rightBuilder.asCell())

        // save dictionary info collected for left and right cells
        to.pushDictionaryInfo(...leftBuilder.getDictionaryInfo())
        to.pushDictionaryInfo(...rightBuilder.getDictionaryInfo())
    }
}

function writeEdge<T>(
    src: Edge<T>,
    keyLength: number,
    serializer: (src: T, cell: CodeBuilder) => void,
    to: CodeBuilder,
) {
    writeLabel(src.label, keyLength, to)
    writeNode(src.node, keyLength - src.label.length, serializer, to)
}

export function serializeDict<T>(
    src: Map<bigint, T>,
    keyLength: number,
    serializer: (src: T, cell: CodeBuilder) => void,
    to: CodeBuilder,
) {
    const tree = buildTree<T>(src, keyLength)
    writeEdge(tree, keyLength, serializer, to)
}
