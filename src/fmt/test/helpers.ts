import { parseCode } from "@/fmt/cst/cst-helpers";
import { format } from "@/fmt/formatter/formatter";

export function normalizeIndentation(input: string): string {
    const lines = input.split("\n");
    if (lines.length <= 1) return input;

    const indents = lines
        .slice(1, -1)
        .filter((line) => line.trim().length > 0)
        .map((line) => /^\s*/.exec(line)?.[0]?.length ?? 0);
    const minIndent = Math.min(...indents);

    if (minIndent === 0) {
        return input;
    }

    return lines
        .map((line, index) => {
            if (index === 0) return line;
            if (minIndent > line.length) {
                return line.trimStart();
            }
            return line.slice(minIndent);
        })
        .join("\n");
}

export const test = (input: string, output: string) => {
    return (): void => {
        const normalizedInput = normalizeIndentation(input).trim();
        const normalizedOutput = normalizeIndentation(output).trim();
        const root = parseCode(normalizedInput);
        if (root === undefined) {
            throw new Error("cannot parse code");
        }

        const formatted = format(root);
        expect(formatted.trim()).toBe(normalizedOutput);
    };
};

export const intact = (input: string): (() => void) => {
    return test(input, input);
};
