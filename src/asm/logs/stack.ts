export type Stack = StackElement[]

export type StackElement =
    | {readonly $: "Null"}
    | {readonly $: "NaN"}
    | {readonly $: "Integer"; readonly value: bigint}
    | {readonly $: "Cell"; readonly boc: string}
    | {
          readonly $: "Slice"
          readonly hex: string
          readonly startBit: number
          readonly endBit: number
          readonly startRef: number
          readonly endRef: number
      }
    | {readonly $: "Builder"; readonly hex: string}
    | {readonly $: "Continuation"; readonly name: string}
    | {readonly $: "Address"; readonly value: string}
    | {readonly $: "Tuple"; readonly elements: StackElement[]}
    | {readonly $: "Unknown"; readonly value: string}

export const serializeStack = (stack: Stack): string => {
    return "[" + stack.map(it => serializeStackElement(it)).join(" ") + "]"
}

export const serializeStackElement = (element: StackElement): string => {
    switch (element.$) {
        case "Null":
            return "()"
        case "NaN":
            return "NaN"
        case "Integer":
            return element.value.toString()
        case "Tuple":
            return "[ " + element.elements.map(it => serializeStackElement(it)).join(" ") + " ]"
        case "Unknown":
            return element.value
        case "Cell":
            return "C{" + element.boc + "}"
        case "Continuation":
            return "Cont{" + element.name + "}"
        case "Builder":
            return "BC{" + element.hex + "}"
        case "Slice":
            if (element.startBit === 0 && element.endBit === 0) {
                return "CS{" + element.hex + "}"
            }
            return (
                "CS{Cell{" +
                element.hex +
                "} bits:" +
                element.startBit +
                ".." +
                element.endBit +
                ";" +
                "refs:" +
                element.startRef +
                ".." +
                element.endRef +
                "}"
            )
        case "Address":
            return "CS{" + element.value + "}"
        default:
            return ""
    }
}
