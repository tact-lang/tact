import { throwInternalCompilerError } from "../../errors";

type Intersect<T> = (T extends unknown ? (x: T) => 0 : never) extends (
    x: infer R,
) => 0
    ? R
    : never;

type Unwrap<T> = T extends infer R ? { [K in keyof R]: R[K] } : never;

type Inputs<I, T extends string> = I extends { [Z in T]: infer K }
    ? K extends string
        ? Record<K, (input: I) => unknown>
        : never
    : never;
type Outputs<O> = { [K in keyof O]: (input: never) => O[K] };
type Handlers<I, O, T extends string> = Unwrap<Intersect<Inputs<I, T>>> & Outputs<O>;

export const makeMakeVisitor =
    <T extends string>(tag: T) =>
    <I>() =>
    <O>(handlers: Handlers<I, O, T>) =>
    (input: Extract<I, { [K in T]: string }>): O[keyof O] => {
        const handler = (handlers as Record<string, (input: I) => O[keyof O]>)[
            input[tag]
        ];

        // eslint-disable-next-line @typescript-eslint/no-unnecessary-condition
        if (handler) {
            return handler(input);
        } else {
            throwInternalCompilerError(
                `Reached impossible case: ${input[tag]}`,
            );
        }
    };

export const makeVisitor = makeMakeVisitor("$");