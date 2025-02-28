/**
 * Range of source code positions
 * 0-based
 * `end` points to position just after the end of range
 */
export type Range = {
    start: number;
    end: number;
};

/**
 * Intersect ranges
 */
export const intersect = (a: Range, b: Range): Range => {
    return {
        start: Math.max(a.start, b.start),
        end: Math.min(a.end, b.end),
    };
};

/**
 * Shift both sides of range by scalar
 */
export const shift = (a: Range, b: number) => {
    return {
        start: a.start + b,
        end: a.end + b,
    };
};
