import type { ReadonlySetLike } from "./isSubsetOf";
import { isSubsetOf } from "./isSubsetOf";

// Tests are adapted from:
// https://github.com/zloirock/core-js/blob/227a758ef96fa585a66cc1e89741e7d0bb696f48/tests/unit-global/es.set.is-subset-of.js

describe("isSubsetOf", () => {
    /* eslint-disable @typescript-eslint/no-explicit-any */
    let s1: Set<any>;
    let s2: ReadonlySetLike<unknown>;

    it("should implement isSubsetOf correctly", () => {
        s1 = new Set([1]);
        s2 = new Set([1, 2, 3]);
        expect(isSubsetOf(s1, s2)).toBe(true);

        s1 = new Set([1]);
        s2 = new Set([2, 3, 4]);
        expect(isSubsetOf(s1, s2)).toBe(false);

        s1 = new Set([1, 2, 3]);
        s2 = new Set([5, 4, 3, 2, 1]);
        expect(isSubsetOf(s1, s2)).toBe(true);

        s1 = new Set([1, 2, 3]);
        s2 = new Set([5, 4, 3, 2]);
        expect(isSubsetOf(s1, s2)).toBe(false);

        s1 = new Set([1]);
        s2 = createSetLike([1, 2, 3]);
        expect(isSubsetOf(s1, s2)).toBe(true);

        s1 = new Set([1]);
        s2 = createSetLike([2, 3, 4]);
        expect(isSubsetOf(s1, s2)).toBe(false);

        s1 = new Set([1, 2, 3]);
        s2 = createSetLike([5, 4, 3, 2, 1]);
        expect(isSubsetOf(s1, s2)).toBe(true);

        s1 = new Set([1, 2, 3]);
        s2 = createSetLike([5, 4, 3, 2]);
        expect(isSubsetOf(s1, s2)).toBe(false);

        s1 = new Set([1, 2, 3]);
        s2 = new Set([1]);
        expect(isSubsetOf(s1, s2)).toBe(false);

        s1 = new Set([1, 2, 3]);
        s2 = new Set();
        expect(isSubsetOf(s1, s2)).toBe(false);

        s1 = new Set();
        s2 = new Set([1, 2, 3]);
        expect(isSubsetOf(s1, s2)).toBe(true);
    });
});

// Helper functions are adapted from:
// https://github.com/zloirock/core-js/blob/227a758ef96fa585a66cc1e89741e7d0bb696f48/tests/helpers/helpers.js

function createSetLike<T>(elements: T[]): ReadonlySetLike<T> {
    return {
        size: elements.length,
        has(value: T): boolean {
            return includes(elements, value);
        },
        keys(): Iterator<T> {
            return createIterator(elements);
        },
    };
}

function includes<T>(target: T[], wanted: T) {
    return target.some((element) => element === wanted);
}

function createIterator<T>(elements: T[]): Iterator<T> {
    let index = 0;
    const iterator = {
        called: false,
        /* eslint-disable @typescript-eslint/no-explicit-any */
        next(): IteratorResult<any> {
            iterator.called = true;
            return {
                value: elements[index++],
                done: index > elements.length,
            };
        },
    };
    return iterator;
}
