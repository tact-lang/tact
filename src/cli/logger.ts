import { Logger, LoggerHandlers, makeLogger } from "../error/logger-util";
import {
    printError,
    showExpectedText,
    showTemplate,
} from "../error/string-util";
import { normalize, relative, sep } from "path";
import { cwd } from "process";
import { throwInternal } from "../error/errors";
import { Colors } from "./colors";

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

export const TerminalLogger = <T>(
    verbosity: Verbosity,
    colors: Colors,
    compile: (log: Logger<string, never>) => T,
) => {
    // path is displayed relative to cwd(), so that in VSCode terminal it's a link
    const showResolvedPath = (path: string) => {
        const relativePath = normalize(relative(cwd(), path));
        const fixedPath = relativePath.startsWith(".")
            ? relativePath
            : `.${sep}${relativePath}`;
        return colors.blue(fixedPath);
    };

    const termIface: LoggerHandlers<string, never> = {
        internal: (message) => {
            console.log(
                colors.red("Internal compiler error: ") +
                    message +
                    `\nPlease report at https://github.com/tact-lang/tact/issues`,
            );
        },
        error: (message) => {
            console.log(colors.red("Error: ") + message);
        },
        warn: (message) => {
            if (verbosity === "warn" || verbosity === "info") {
                console.log(colors.yellow("Warning: ") + message);
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
        atPath: (path, message) => `${path}: ${message}`,
        atRange: (path, code, range, message) =>
            printError({
                path: showResolvedPath(path),
                code,
                message,
                range,
                onInternalError: throwInternal,
                colors,
            }),
        onExit: () => {
            // Now the only thing left to handle is ExitError, which
            // just exits the application
            process.exit(30);
        },
    };

    return makeLogger(termIface, compile);
};
