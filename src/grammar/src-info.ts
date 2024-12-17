import { grammar, Grammar, Interval as RawInterval } from "ohm-js";

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

const DummyGrammar: Grammar = grammar("Dummy { DummyRule = any }");
const DUMMY_INTERVAL = DummyGrammar.match("").getInterval();
export const dummySrcInfo: SrcInfo = new SrcInfo(DUMMY_INTERVAL, null, "user");

// Rename is here so that OhmSrcInfo is called SrcInfo in snapshots, as it previously did
export { AbstractSrcInfo as SrcInfo, SrcInfo as OhmSrcInfo };
