import { Interval as RawInterval } from "ohm-js";

import { throwInternalCompilerError } from "../errors";

export type ItemOrigin = "stdlib" | "user";

export type LineAndColumnInfo = {
    lineNum: number;
    colNum: number;
    toString(...ranges: number[][]): string;
};

export type Interval = {
    contents: string;
    getLineAndColumnMessage(): string;
    getLineAndColumn(): LineAndColumnInfo;
    startIdx: number;
    endIdx: number;
};

// Do not export! Use isSrcInfo
const srcInfoSymbol = Symbol("src-info");

export const isSrcInfo = (t: unknown): t is SrcInfo => {
    return (
        typeof t === "object" &&
        t !== null &&
        srcInfoSymbol in t &&
        Boolean(t[srcInfoSymbol])
    );
};

export interface SrcInfo {
    file: string | null;
    contents: string;
    interval: Interval;
    origin: ItemOrigin;

    /**
     * Tag so that custom snapshot serializer can distinguish it
     */
    [srcInfoSymbol]: true;
    /**
     * toJSON method is provided, so that it's not serialized into snapshots
     */
    toJSON: () => object;
}

const isEndline = (s: string) => s === "\n";

const repeat = (s: string, n: number): string => new Array(n + 1).join(s);

type Range = {
    start: number;
    end: number;
};

const intersect = (a: Range, b: Range): Range => {
    return {
        start: Math.max(a.start, b.start),
        end: Math.min(a.end, b.end),
    };
};

const shift = (a: Range, b: number) => {
    return {
        start: a.start + b,
        end: a.end + b,
    };
};

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

/**
 * Should wrap string into ANSI codes for coloring
 */
type Colorer = (s: string) => string;

type ErrorPrinterParams = {
    /**
     * Number of context lines below and above error
     */
    contextLines: number;
    /**
     * Colorer for code with error
     */
    error: Colorer;
    /**
     * Colorer for context lines of code
     */
    context: Colorer;
};

const getErrorPrinter = ({
    error,
    context,
    contextLines,
}: ErrorPrinterParams) => {
    const displayLine = (line: Line, range: Range) => {
        // Only the line that contains range.start is underlined in error message
        // Otherwise error on `while (...) {}` would display the whole loop body, for example
        const hasInterval =
            line.range.start <= range.start && range.start < line.range.end;

        // Find the line-relative range
        const mapped = shift(intersect(range, line.range), -line.range.start);

        // All lines except with error message are displayed in gray
        if (!hasInterval) {
            return [
                {
                    id: line.id,
                    text: context(line.text),
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
                error(line.text.substring(mapped.start, mapped.end)),
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

    const show = (str: string, range: Range): string => {
        // Display all lines of source file
        const lines = toLines(str).flatMap((line) => displayLine(line, range));

        // Find first and lines lines with error message
        const firstLineNum = lines.findIndex((line) => line.hasInterval);
        const lastLineNum = lines.findLastIndex((line) => line.hasInterval);
        if (firstLineNum === -1 || lastLineNum === -1) {
            throwInternalCompilerError(
                `Interval [${range.start}, ${range.end}[ is empty or out of source bounds (${str.length})`,
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

        // Add header and concatenate lines
        const header = `Line ${firstLineNum + 1}, col ${(lines[firstLineNum]?.startOfError ?? 0) + 1}:`;
        return [header, ...paddedLines].join("\n") + "\n";
    };

    const getLineAndColumn = (str: string, range: Range) => {
        const prefix = str.substring(0, range.start).split("");
        const lineNum = prefix.filter(isEndline).length;
        const prevLineEndPos = prefix.findLastIndex(isEndline);
        const lineStartPos = prevLineEndPos === -1 ? 0 : prevLineEndPos + 1;
        const colNum = range.start - lineStartPos;

        return {
            offset: range.start,
            lineNum: lineNum + 1,
            colNum: colNum + 1,
            toString: () => show(str, range),
        };
    };

    return { show, getLineAndColumn };
};

// Default error printer. Should be initialized in entry point instead
const errorPrinter = getErrorPrinter({
    // This should be `chalk.red`
    error: (s) => s,
    // This should be `chalk.gray`
    context: (s) => s,
    contextLines: 1,
});

export const getSrcInfo = (
    sourceString: string,
    startIdx: number,
    endIdx: number,
    file: string | null,
    origin: ItemOrigin,
): SrcInfo => {
    const getLineAndColumn = () => {
        return errorPrinter.getLineAndColumn(sourceString, {
            start: startIdx,
            end: endIdx,
        });
    };

    const getLineAndColumnMessage = () => {
        return getLineAndColumn().toString();
    };

    const contents = sourceString.substring(startIdx, endIdx);

    return {
        [srcInfoSymbol]: true,
        contents: contents,
        file,
        interval: {
            contents: contents,
            startIdx: startIdx,
            endIdx: endIdx,
            getLineAndColumn,
            getLineAndColumnMessage,
        },
        origin,
        toJSON: () => ({}),
    };
};

/**
 * @deprecated
 */
export const getSrcInfoFromOhm = (
    { sourceString, startIdx, endIdx }: RawInterval,
    file: string | null,
    origin: ItemOrigin,
): SrcInfo => {
    return getSrcInfo(sourceString, startIdx, endIdx, file, origin);
};

export const dummySrcInfo: SrcInfo = getSrcInfo("", 0, 0, null, "user");
