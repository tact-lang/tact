import { MatchResult } from "ohm-js";
import { ErrorDisplay } from "../../error/display";
import { TactCompilationError } from "../../error/errors";
import { syntaxErrorSchema } from "../parser-error";
import { SrcInfo } from "../src-info";
import { getSrcInfoFromOhm } from "./src-info";
import { ItemOrigin } from "../../imports/source";

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
