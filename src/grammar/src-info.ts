import { Interval as RawInterval } from "ohm-js";

export type ItemOrigin = "stdlib" | "user";

export type LineAndColumnInfo = {
    lineNum: number;
    colNum: number;
    toString(...ranges: number[][]): string;
}  

export type AbstractInterval = {
    contents: string;
    getLineAndColumnMessage(): string;
    getLineAndColumn(): LineAndColumnInfo;
    startIdx: number;
    endIdx: number;
};

interface AbstractSrcInfo {
    file: string | null;
    contents: string;
    interval: AbstractInterval;
    origin: ItemOrigin;
}

/**
 * Information about source code location (file and interval within it)
 * and the source code contents.
 */
class SrcInfo implements AbstractSrcInfo {
    readonly #interval: RawInterval;
    readonly #file: string | null;
    readonly #origin: ItemOrigin;

    constructor(
        interval: RawInterval,
        file: string | null,
        origin: ItemOrigin,
    ) {
        this.#interval = interval;
        this.#file = file;
        this.#origin = origin;
    }

    get file() {
        return this.#file;
    }

    get contents() {
        return this.#interval.contents;
    }

    get interval() {
        return this.#interval;
    }

    get origin() {
        return this.#origin;
    }
}

export const dummySrcInfo: AbstractSrcInfo = {
    contents: '',
    file: null,
    interval: {
        contents: '',
        startIdx: 0,
        endIdx: 0,
        getLineAndColumn: () => ({
            colNum: 1,
            lineNum: 1,
            toString: () => {
                throw new Error();
            },
        }),
        getLineAndColumnMessage: () => 'Line 1, col 1:\n> 1 | \n      ^\n',
    },
    origin: 'user',
};

// Rename is here so that OhmSrcInfo is called SrcInfo in snapshots, as it previously did
export { AbstractSrcInfo as SrcInfo, SrcInfo as OhmSrcInfo };
