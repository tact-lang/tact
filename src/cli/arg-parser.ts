import type { Unwrap } from "../utils/tricks";
import type { CliErrors } from "./error-schema";

type Token<K, V> = Parser<[K, V]>;
type Parser<T> = (argv: Argv) => Match<T>;
type Match<T> = MatchOk<T> | MatchFail | MatchError;
type MatchOk<T> = { kind: "ok"; value: T; rest: Argv };
type MatchFail = { kind: "fail" };
type MatchError = { kind: "error"; rest: Argv };
type Argv = string[];
type NotIn<K, T> = [K] extends [keyof T] ? never : K;
type TokenMap<T> = { [K in keyof T]?: T[K][] };
type TokensPublic<T> = {
    add: <K extends string, V>(
        token: Token<NotIn<K, T>, V>,
    ) => TokensPrivate<T & Record<K, V>>;
    end: Parser<Unwrap<TokenMap<T>>>;
};
type TokensPrivate<T> = TokensNext<T> & TokensPublic<T>;
type TokensNext<T> = {
    next: Parser<(obj: TokenMap<T>) => void>;
};

export type ArgParser = ReturnType<typeof ArgParser>;
export type GetParserResult<T> = [T] extends [
    (...args: never[]) => Match<TokenMap<infer U>>,
]
    ? U
    : never;

const iterationLimit = 10000;

export const ArgParser = (E: CliErrors) => {
    const immediate: Token<"immediate", string> = (argv) => {
        const [head, ...rest] = argv;
        if (typeof head === "undefined" || head.startsWith("-")) {
            return { kind: "fail" };
        }
        return { kind: "ok", value: ["immediate", head], rest };
    };

    const boolean =
        <K extends string>(
            longName: K,
            shortName: string | undefined,
        ): Token<K, true> =>
        (argv) => {
            const [head, ...rest] = argv;
            if (typeof head === "undefined") {
                return { kind: "fail" };
            }
            const isLongMatch = head === "--" + longName;
            const isShortMatch =
                typeof shortName !== "undefined" && head === "-" + shortName;
            if (isLongMatch || isShortMatch) {
                return { kind: "ok", value: [longName, true], rest };
            }
            return { kind: "fail" };
        };

    const string =
        <K extends string>(
            longName: K,
            shortName: string | undefined,
            argName: string,
        ): Token<K, string> =>
        (argv) => {
            const result = boolean(longName, shortName)(argv);
            if (result.kind !== "ok") {
                return result;
            }
            const [head, ...rest] = result.rest;
            if (typeof head === "undefined" || head.startsWith("-")) {
                E.argumentHasParameter(argv[0]!, argName);
                return { kind: "error", rest: result.rest };
            }
            return { ...result, value: [result.value[0], head], rest };
        };

    const makeTokenizer = <T>(
        next: TokensPrivate<T>["next"],
    ): TokensPrivate<T> => ({
        next,
        add: <K extends string, V>(token: Token<NotIn<K, T>, V>) => {
            return makeTokenizer<T & Record<K, V>>((argv) => {
                const res1 = token(argv);
                if (res1.kind === "ok") {
                    return {
                        ...res1,
                        value: (obj) => {
                            const [key, value] = res1.value;
                            // TS can't figure out V is still V
                            (obj[key] = obj[key] || []).push(value as never);
                        },
                    };
                }
                return next(argv);
            });
        },
        end: (argv) => {
            const result: TokenMap<T> = {};
            let hadErrors = false;
            for (let i = 0; i < iterationLimit; ++i) {
                if (argv.length === 0) {
                    if (!hadErrors) {
                        // TS can't handle identity transform
                        return {
                            kind: "ok",
                            value: result as Unwrap<TokenMap<T>>,
                            rest: [],
                        };
                    } else {
                        return { kind: "error", rest: [] };
                    }
                } else {
                    const res = next(argv);
                    if (res.kind === "error") {
                        hadErrors = true;
                        argv = res.rest;
                    } else if (res.kind === "ok") {
                        // TS can't handle identity transform
                        res.value(result as Unwrap<TokenMap<T>>);
                        argv = res.rest;
                    } else {
                        throw new Error("Unhandled failure");
                    }
                }
            }
            throw new Error("Iteration limit reached");
        },
    });

    // eslint-disable-next-line @typescript-eslint/ban-types
    const tokenizer = makeTokenizer<{}>((argv) => {
        const [head, ...rest] = argv;
        E.unexpectedArgument(head);
        return { kind: "error", rest };
    });

    return {
        immediate,
        boolean,
        string,
        tokenizer,
    };
};
