import { throwInternalCompilerError } from "../error/errors";
import { repeat } from "../utils/array";

// Witness tag. Do not use, do not export.
const pathTag = Symbol("path");

/**
 * Safe relative path
 */
export type RelativePath = {
    /**
     * Number of "../" in front of path
     */
    readonly stepsUp: number;
    /**
     * /-separated strings that go after optional ../
     */
    readonly segments: readonly string[];
    /**
     * Proof that path was created by RelativePath constructor
     */
    readonly [pathTag]: true;
};

/**
 * Constructor for relative paths
 */
const RelativePath = (
    stepsUp: number,
    segments: readonly string[],
): RelativePath => {
    if (stepsUp < 0) {
        throwInternalCompilerError("Negative number of ../ in path");
    }
    const result: RelativePath = {
        [pathTag]: true,
        stepsUp,
        segments: Object.freeze(segments),
    };
    return Object.freeze(result);
};

/**
 * Convert raw string with relative POSIX path into RelativePath
 */
export const fromString = (raw: string): RelativePath => {
    return raw.split("/").map(parseSegment).reduce(appendPath, emptyPath);
};

/**
 * Convert RelativePath to string.
 */
export const asString = ({ stepsUp, segments }: RelativePath): string => {
    return [...repeat("..", stepsUp), ...segments].join("/");
};

/**
 * Empty path, equivalent to "."
 */
export const emptyPath = RelativePath(0, []);

/**
 * Combine two relative paths
 */
const appendPath = (left: RelativePath, right: RelativePath): RelativePath => {
    const delta = right.stepsUp - left.segments.length;
    return RelativePath(left.stepsUp + Math.max(0, delta), [
        ...left.segments.slice(0, Math.max(0, -delta)),
        ...right.segments,
    ]);
};

const parseSegment = (segment: string): RelativePath => {
    if (segment === "..") {
        return RelativePath(1, []);
    }
    if (segment === "." || segment === "") {
        return emptyPath;
    }
    return RelativePath(0, [segment]);
};
