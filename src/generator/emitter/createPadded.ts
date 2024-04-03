import { trimIndent } from "../../utils/text";

export function createPadded(src: string) {
    return trimIndent(src)
        .split("\n")
        .map((v) => " ".repeat(4) + v)
        .join("\n");
}
