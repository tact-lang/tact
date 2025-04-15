import { throwInternalCompilerError } from "@/error/errors";
import { RelativePath } from "@/next/fs/path";
import { repeat } from "@/utils/array";

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
export const appendPath = (
    left: RelativePath,
    right: RelativePath,
): RelativePath => {
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
