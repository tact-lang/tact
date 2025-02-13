import type { Range} from "./range";
import { intersect, shift } from "./range";

/**
 * Show "Expected Foo, Bar" message
 */
export const showExpectedText = (expected: ReadonlySet<string>): string => {
    const result: string[] = [];
    const failures = [...expected].sort();
    for (const [idx, failure] of failures.entries()) {
        if (idx > 0) {
            if (idx === failures.length - 1) {
                result.push(failures.length > 2 ? ", or " : " or ");
            } else {
                result.push(", ");
            }
        }
        result.push(failure);
    }
    return result.join("");
};

/**
 * Concatenate template literal back into string
 */
export const showTemplate = (
    parts: readonly string[],
    subst: readonly string[],
): string => {
    const [head, ...tail] = parts;
    if (typeof head === "undefined") {
        return "";
    }
    return tail.reduce((acc, part, index) => {
        const sub = subst[index];
        return acc + sub + part;
    }, head);
};

export type Colors = {
    readonly gray: (s: string) => string;
    readonly red: (s: string) => string;
    readonly yellow: (s: string) => string;
};

const id = (s: string) => s;

const defaultColors: Colors = {
    gray: id,
    red: id,
    yellow: id,
};

export type PrintErrorParams = {
    /**
     * Rendered absolute path to source file
     */
    readonly path: string;
    /**
     * Source code
     */
    readonly code: string;
    /**
     * Rendered message
     */
    readonly message: string;
    /**
     * 0-based position range [start; end[
     */
    readonly range: Range;
    /**
     * Throw internal error
     */
    readonly onInternalError?: (error: string) => void;
    /**
     * Use colors
     */
    readonly ansiMarkup?: Colors;
};

const defaultInternalError = (message: string) => {
    throw new Error(message);
};

/**
 * Print error message in a source file
 * @param path
 * @param code
 * @param range
 * @param message
 * @param onInternalError
 */
export function printError({
    path,
    code,
    message,
    range,
    onInternalError = defaultInternalError,
    ansiMarkup: ansi = defaultColors,
}: PrintErrorParams): string {
    // Display all lines of source file
    const lines = toLines(code).flatMap((line) =>
        displayLine(line, range, ansi),
    );

    // Find first and lines lines with error message
    const firstLineNum = lines.findIndex((line) => line.hasInterval);
    const lastLineNum = lines.findLastIndex((line) => line.hasInterval);
    if (firstLineNum === -1 || lastLineNum === -1) {
        onInternalError(
            `Interval [${range.start}, ${range.end}[ is empty or out of source bounds (${code.length})`,
        );
    }

    // Expand the line range so that `contextLines` are above and below
    const rangeStart = Math.max(0, firstLineNum - contextLines);
    const rangeEnd = Math.min(lines.length - 1, lastLineNum + contextLines);

    // Pick displayed lines out of full list
    const displayedLines = lines.slice(rangeStart, rangeEnd + 1);

    // Find padding based on the line with largest line number
    const maxLineId = displayedLines.reduce((acc, line) => {
        return line.id === null ? acc : Math.max(acc, line.id);
    }, 1);
    const lineNumLength = String(maxLineId + 1).length;

    // Add line numbers and cursor to lines
    const paddedLines = displayedLines.map(({ hasInterval, id, text }) => {
        const prefix = hasInterval && id !== null ? ">" : " ";
        const paddedLineNum =
            id === null
                ? repeat(" ", lineNumLength) + "  "
                : String(id + 1).padStart(lineNumLength) + " |";
        return `${prefix} ${paddedLineNum} ${text}`;
    });

    const prefix = code.substring(0, range.start).split("");
    const lineNum = prefix.filter(isEndline).length + 1;
    const prevLineEndPos = prefix.findLastIndex(isEndline);
    const lineStartPos = prevLineEndPos === -1 ? 0 : prevLineEndPos + 1;
    const colNum = range.start - lineStartPos + 1;

    const displayLines = paddedLines.join("\n");
    return `${path}:${ansi.yellow(lineNum + ":" + colNum)} - ${message}\n${displayLines}`;
}

const displayLine = (line: Line, range: Range, colors: Colors) => {
    // Only the line that contains range.start is underlined in error message
    // Otherwise error on `while (...) {}` would display the whole loop body, for example
    const hasInterval =
        line.range.start <= range.start && range.start <= line.range.end;

    // Find the line-relative range
    const mapped = shift(intersect(range, line.range), -line.range.start);

    // All lines except with error message are displayed in gray
    if (!hasInterval) {
        return [
            {
                id: line.id,
                text: colors.gray(line.text),
                hasInterval,
                startOfError: mapped.start,
            },
        ];
    }

    // Source line with error colored
    const sourceLine = {
        id: line.id,
        text: [
            line.text.substring(0, mapped.start),
            colors.red(line.text.substring(mapped.start, mapped.end)),
            line.text.substring(mapped.end),
        ].join(""),
        hasInterval: true,
        startOfError: mapped.start,
    };

    // Wiggly line underneath it
    const underline = {
        id: null,
        text: [
            repeat(" ", mapped.start),
            "^",
            repeat("~", Math.max(0, mapped.end - mapped.start - 1)),
        ].join(""),
        hasInterval: true,
        startOfError: mapped.start,
    };

    return [sourceLine, underline];
};

const isEndline = (s: string) => s === "\n";

const repeat = (s: string, n: number): string => new Array(n + 1).join(s);

type Line = {
    id: number;
    text: string;
    range: Range;
};

/**
 * Convert code into a list of lines
 */
const toLines = (source: string): Line[] => {
    const result: Line[] = [];
    let position = 0;
    for (const [id, text] of source.split("\n").entries()) {
        result.push({
            id,
            text,
            range: {
                start: position,
                end: position + text.length,
            },
        });
        position += text.length + 1;
    }
    return result;
};

const contextLines = 1;
