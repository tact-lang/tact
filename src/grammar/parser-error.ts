import { MatchResult } from "ohm-js";
import { ErrorDisplay } from "../error/display";
import { locationStr, TactCompilationError, TactParseError, TactSyntaxError } from "../errors";
import { getSrcInfoFromOhm, ItemOrigin, SrcInfo } from "./src-info";

const syntaxErrorSchema = <T, U>({ text, sub }: ErrorDisplay<T>, handle: (t: T) => U) => ({
    duplicateConstantAttribute: (attr: string) => {
        return handle(sub`Duplicate constant attribute "${text(attr)}"`);
    },
    constantNotAbstract: () => {
        return handle(sub`Abstract constant doesn't have abstract modifier`);
    },
    constantIsAbstract: () => {
        return handle(sub`Non-abstract constant has abstract modifier`);
    },
    topLevelConstantWithAttribute: () => {
        return handle(sub`Module-level constants do not support attributes`);
    },
    literalTooLongHex: () => {
        return handle(sub`The hex bitstring has more than 128 digits`);
    },
    literalTooLongBin: () => {
        return handle(sub`The binary bitstring has more than 128 digits`);
    },
    extraneousCommaArgs: () => {
        return handle(sub`Empty argument list should not have a dangling comma.`);
    },
    extraneousCommaParams: () => {
        return handle(sub`Empty parameter list should not have a dangling comma.`);
    },
    duplicateField: (name: string) => {
        return handle(text(`Duplicate destructuring field: '${name}'`));
    },
    importWithBackslash: () => {
        return handle(sub`Import path can't contain "\\"`);
    },
});

const compileErrorSchema = <T, U>({ text, sub }: ErrorDisplay<T>, handle: (t: T) => U) => ({
    duplicateFunctionAttribute: (attr: string) => {
        return handle(sub`Duplicate function attribute "${text(attr)}"`);
    },
    functionNotAbstract: () => {
        return handle(sub`Abstract function doesn't have abstract modifier`);
    },
    functionIsAbstract: () => {
        return handle(sub`Non abstract function have abstract modifier`);
    },
    reservedVarPrefix: (prefix: string) => {
        return handle(text(`Variable name cannot start with "${prefix}"`));
    },
});

export const parserErrorSchema = (display: ErrorDisplay<string>) => ({
    ...syntaxErrorSchema(display, (message) => (source: SrcInfo) => {
        throw new TactSyntaxError(
            `Syntax error: ${locationStr(source)}${message}\n${source.interval.getLineAndColumnMessage()}`,
            source,
        );
    }),
    ...compileErrorSchema(display, (message) => (source: SrcInfo) => {
        const msg = `${locationStr(source)}${message}\n${source.interval.getLineAndColumnMessage()}`;
        throw new TactCompilationError(msg, source);
    }),
    generic: (
        matchResult: MatchResult,
        path: string,
        origin: ItemOrigin,
    ) => {
        const interval = matchResult.getInterval();
        const source = getSrcInfoFromOhm(interval, path, origin);
        // eslint-disable-next-line @typescript-eslint/no-explicit-any
        const message = `Parse error: expected ${(matchResult as any).getExpectedText()}\n`;
        throw new TactParseError(
            `${locationStr(source)}${message}\n${interval.getLineAndColumnMessage()}`,
            source,
        );
    },
});

export type ParserErrors = ReturnType<typeof parserErrorSchema>