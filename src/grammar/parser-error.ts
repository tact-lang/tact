import { MatchResult } from "ohm-js";
import { ErrorDisplay } from "../error/display";
import { TactCompilationError } from "../errors";
import { getSrcInfoFromOhm, ItemOrigin, SrcInfo } from "./src-info";

const attributeSchema =
    (name: string) =>
    <T, U>({ text, sub }: ErrorDisplay<T>, handle: (t: T) => U) => ({
        duplicate: (attr: string) => {
            return handle(
                sub`Duplicate ${text(name)} attribute "${text(attr)}"`,
            );
        },
        notAbstract: () => {
            return handle(
                sub`Abstract ${text(name)} doesn't have abstract modifier`,
            );
        },
        tooAbstract: () => {
            return handle(
                sub`Non-abstract ${text(name)} has abstract modifier`,
            );
        },
    });

const getExpectedText = (expected: ReadonlySet<string>) => {
    const result: string[] = [];
    const failures = [...expected].sort();
    for (const [idx, failure] of failures.entries()) {
        if (idx > 0) {
            if (idx === failures.length - 1) {
                result.push(failures.length > 2 ? ", or " : " or ");
            } else {
                result.push(", ");
            }
        }
        result.push(failure);
    }
    return result.join("");
};

export const syntaxErrorSchema = <T, U>(
    display: ErrorDisplay<T>,
    handle: (t: T) => U,
) => {
    const { sub, text } = display;

    return {
        constant: attributeSchema("constant")(display, handle),
        function: attributeSchema("function")(display, handle),
        topLevelConstantWithAttribute: () => {
            return handle(
                sub`Module-level constants do not support attributes`,
            );
        },
        literalTooLong: () => {
            return handle(sub`Bitstring has more than 128 digits`);
        },
        extraneousComma: () => {
            return handle(
                sub`Empty parameter list should not have a dangling comma`,
            );
        },
        duplicateField: (name: string) => {
            return handle(text(`Duplicate field destructuring: "${name}"`));
        },
        restShouldBeLast: () => {
            return handle(text(`Rest parameter should be last`));
        },
        importWithBackslash: () => {
            return handle(sub`Import path can't contain "\\"`);
        },
        reservedVarPrefix: (prefix: string) => {
            return handle(text(`Variable name cannot start with "${prefix}"`));
        },
        notCallable: () => {
            return handle(sub`Expression is not callable`);
        },
        noBouncedWithoutArg: () => {
            return handle(sub`bounced() cannot be used as fallback`);
        },
        noBouncedWithString: () => {
            return handle(
                sub`bounced() cannot be used with a string literal name`,
            );
        },
        noConstantDecl: () => {
            return handle(sub`Variable definition requires an initializer`);
        },
        noFunctionDecl: () => {
            return handle(sub`Only full function defintions are allowed here`);
        },
        expected: (expects: ReadonlySet<string>) => {
            return handle(text(`Expected ${getExpectedText(expects)}`));
        },
        invalidFuncId: () => {
            return handle(sub`Invalid FunC identifier`);
        },
        reservedFuncId: () => {
            return handle(sub`Reserved FunC identifier`);
        },
        numericFuncId: () => {
            return handle(sub`FunC identifier cannot be a number`);
        },
        leadingZeroUnderscore: () => {
            return handle(sub`Numbers with leading zeroes cannot use underscores for JS compatibility`);
        },
    };
};

export type SyntaxErrors<T> = ReturnType<typeof syntaxErrorSchema<unknown, T>>;

/**
 * @deprecated
 */
export const parserErrorSchema = (display: ErrorDisplay<string>) => ({
    ...syntaxErrorSchema(display, (message) => (source: SrcInfo) => {
        throw new TactCompilationError(display.at(source, message), source);
    }),
    generic: (matchResult: MatchResult, path: string, origin: ItemOrigin) => {
        const interval = matchResult.getInterval();
        const source = getSrcInfoFromOhm(interval, path, origin);
        // eslint-disable-next-line @typescript-eslint/no-explicit-any
        const message = `Expected ${(matchResult as any).getExpectedText()}\n`;
        throw new TactCompilationError(display.at(source, message), source);
    },
});

/**
 * @deprecated
 */
export type ParserErrors = ReturnType<typeof parserErrorSchema>;
