/* eslint-disable require-yield */
import { throwInternal } from "@/error/errors";
import type { WithLog } from "@/next/types/errors";

export type Lazy<T> = () => WithLog<T>

export const Lazy = <T>(
    callback: () => WithLog<T>,
    onOccurs: () => WithLog<T> = impossible,
): Lazy<T> => {
    let result: 'waiting' | 'running' | [T] = 'waiting';
    function* delayed() {
        if (typeof result !== 'string') {
            return result[0];
        }
        if (result === 'running') {
            return yield* onOccurs();
        }
        result = 'running';
        const output = yield* callback();
        result = [output];
        return output;
    }
    delayed.toJSON = () => {
        return result;
    };
    return delayed;
};

export const mapLazy = <T, U>(f: Lazy<T>, g: (t: T) => U): Lazy<U> => {
    return function* () {
        return g(yield* f());
    };
};

function* impossible<T>(): WithLog<T> {
    return throwInternal("Infinite loop in typechecker");
}
