import type { Logger, LoggerHandlers } from "../error/logger-util";
import { makeLogger } from "../error/logger-util";
import {
    printError,
    showExpectedText,
    showTemplate,
} from "../error/string-util";
import { cwd } from "process";
import { throwInternal } from "../error/errors";
import type { AnsiMarkup } from "./colors";
import type * as path from "path";

export const CliLogger = () => {
    let hadErrors = false;

    const log = (message: string) => {
        hadErrors = true;
        console.log(message);
    };

    return {
        log,
        hadErrors: () => hadErrors,
    };
};

export type Verbosity = "error" | "warn" | "info";

type PathApi = typeof path;

export const TerminalLogger = <T>(
    pathApi: PathApi,
    verbosity: Verbosity,
    ansi: AnsiMarkup,
    compile: (log: Logger<string, never>) => T,
) => {
    // path is displayed relative to cwd(), so that in VSCode terminal it's a link
    const showResolvedPath = (path: string) => {
        const relativePath = pathApi.normalize(pathApi.relative(cwd(), path));
        const fixedPath = relativePath.startsWith(".")
            ? relativePath
            : `.${pathApi.sep}${relativePath}`;
        return ansi.blue(fixedPath);
    };

    const termIface: LoggerHandlers<string, never> = {
        internal: (message) => {
            console.log(
                ansi.red("Internal compiler error: ") +
                    message +
                    `\nPlease report at https://github.com/tact-lang/tact/issues`,
            );
        },
        error: (message) => {
            console.log(ansi.red("Error: ") + message);
        },
        warn: (message) => {
            if (verbosity === "warn" || verbosity === "info") {
                console.log(ansi.yellow("Warning: ") + message);
            }
        },
        info: (message) => {
            if (verbosity === "info") {
                console.log(message);
            }
        },
        text: (parts, ...subst) => showTemplate(parts, subst),
        path: showResolvedPath,
        locatedId: (id) => id,
        expected: showExpectedText,
        atPath: (path, message) => `${showResolvedPath(path)}: ${message}`,
        atRange: (path, code, range, message) =>
            printError({
                path: showResolvedPath(path),
                code,
                message,
                range,
                onInternalError: throwInternal,
                ansiMarkup: ansi,
            }),
        onExit: () => {
            // Now the only thing left to handle is ExitError, which
            // just exits the application
            process.exit(30);
        },
    };

    return makeLogger(termIface, compile);
};
