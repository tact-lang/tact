const range = (from: number, to: number) => {
    return new Array(to - from + 1).fill(0).map((_, i) => from + i);
};

export const repeat = <T>(value: T, count: number): readonly T[] => {
    return range(1, count).map(() => value);
};

export const isUndefined = <T>(t: T | undefined): t is undefined =>
    typeof t === "undefined";

export const groupBy = <T, U>(
    items: readonly T[],
    f: (t: T) => U,
): readonly (readonly T[])[] => {
    const result: T[][] = [];
    const [head, ...tail] = items;
    if (isUndefined(head)) {
        return result;
    }
    let group: T[] = [head];
    result.push(group);
    let tag: U = f(head);
    for (const item of tail) {
        const nextTag = f(item);
        if (tag === nextTag) {
            group.push(item);
        } else {
            group = [item];
            result.push(group);
            tag = nextTag;
        }
    }
    return result;
};

export const intercalate = <T>(
    items: readonly (readonly T[])[],
    value: T,
): readonly T[] => {
    const [head, ...tail] = items;
    if (isUndefined(head)) {
        return [];
    }
    const result: T[] = [...head];
    for (const item of tail) {
        result.push(value, ...item);
    }
    return result;
};
