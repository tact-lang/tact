import { Intersect } from "../utils/tricks";

export const ArgConsumer = <T>(args: { [L in keyof T]?: T[L][] }) => {
    const copy = { ...args };

    const isEmpty = () => Object.keys(copy).length === 0;

    const single = <K extends keyof T>(k: K): undefined | T[K] => {
        const s = (copy[k] ?? []);
        if (s.length > 1) {
            throw new Error('Should be 1');
        }
        if (s.length === 0) {
            return undefined;
        }
        // eslint-disable-next-line @typescript-eslint/no-dynamic-delete
        delete copy[k];
        return s[0];
    };

    const multiple = <K extends keyof T>(k: K): undefined | T[K] => {
        const s = (copy[k] ?? []);
        // eslint-disable-next-line @typescript-eslint/no-dynamic-delete
        delete copy[k];
        // TS bug
        return s as never;
    };

    return {
        isEmpty,
        // TS bug
        single: single as Intersect<{ [K in keyof T]: (k: K) => T[K] | undefined }[keyof T]>,
        multiple: multiple as Intersect<{ [K in keyof T]: (k: K) => T[K][] | undefined }[keyof T]>,
    };
};

export type ArgConsumer<T> = ReturnType<typeof ArgConsumer<T>>;
