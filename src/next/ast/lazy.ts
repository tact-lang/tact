/* eslint-disable require-yield */
import type { Loc } from "@/next/ast/common";
import * as E from "@/next/types/errors";

type Result<T> = 'waiting' | 'running' | readonly [T];

export const printSym = Symbol("print");

export type Thunk<T> = {
    [printSym]: () => Result<T>
} & (() => E.WithLog<T>)

function Thunk<T>(
    force: () => E.WithLog<T>,
    onOccurs: () => E.WithLog<T>,
): Thunk<T> {
    let result: Result<T> = 'waiting';
    function* delayed() {
        if (typeof result !== 'string') {
            return result[0];
        }
        if (result === 'running') {
            return yield* onOccurs();
        }
        result = 'running';
        const output = yield* force();
        result = [output];
        return output;
    }
    // @ts-expect-error TS bug. with text field name it works
    delayed[printSym] = () => result;
    return delayed;
}

export const isThunk = (arg: object): arg is Thunk<unknown> => printSym in arg;

export const FakeThunk = <T>(t: T): Thunk<T> => {
    function* thunk() {
        return t;
    }
    // @ts-expect-error TS bug. with text field name it works
    thunk[printSym] = () => [t] as const;
    return thunk;
};

type Options<T> = {
    readonly loc: Loc,
    readonly context: readonly E.TELine[],
    readonly recover: T,
    readonly callback: (
        builder: ThunkBuilder
    ) => E.WithLog<T>
}

export type ThunkBuilder = <T>(
    options: Options<T>
) => Thunk<T>;

const makeBuilder = (allContext: readonly E.TELine[]): ThunkBuilder => {
    return function addThunk<T>(options: Options<T>): Thunk<T> {
        return Thunk(
            function force() {
                const nextBuilder = makeBuilder(
                    [...options.context, ...allContext]
                );
                return options.callback(nextBuilder);
            },
            function* onOccurs() {
                yield EOccurs(options.loc, allContext);
                return options.recover;
            },
        );
    };
};

const EOccurs = (loc: Loc, context: readonly E.TELine[]): E.TcError => ({
    loc,
    descr: [
        E.TEText(`Recursive definition`),
        ...context,
    ],
});

export const thunkBuilder = makeBuilder([]);
