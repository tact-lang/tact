import { Interval as RawInterval } from "ohm-js";

export type ItemOrigin = "stdlib" | "user";

/**
 * Information about source code location (file and interval within it)
 * and the source code contents.
 */
export class SrcInfo {
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
