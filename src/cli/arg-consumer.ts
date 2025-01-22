import { Intersect } from "../utils/tricks";
import { CliErrors } from "./error-schema";

export const ArgConsumer = <T>(
    Errors: CliErrors,
    args: { [L in keyof T]?: T[L][] },
) => {
    const copy = { ...args };

    const leftover = () => Object.keys(copy);

    const single = <K extends Extract<keyof T, string>>(
        k: K,
    ): undefined | T[K] => {
        const s = copy[k] ?? [];
        if (s.length > 1) {
            Errors.duplicateArgument(k);
            return s[0];
        }
        if (s.length === 0) {
            return undefined;
        }
        // eslint-disable-next-line @typescript-eslint/no-dynamic-delete
        delete copy[k];
        return s[0];
    };

    const multiple = <K extends keyof T>(k: K): undefined | T[K][] => {
        const s = copy[k] ?? [];
        // eslint-disable-next-line @typescript-eslint/no-dynamic-delete
        delete copy[k];
        return s;
    };

    return {
        leftover,
        // TS bug
        single: single as Intersect<
            { [K in keyof T]: (k: K) => T[K] | undefined }[keyof T]
        >,
        multiple: multiple as Intersect<
            { [K in keyof T]: (k: K) => T[K][] | undefined }[keyof T]
        >,
    };
};

export type ArgConsumer<T> = ReturnType<typeof ArgConsumer<T>>;
