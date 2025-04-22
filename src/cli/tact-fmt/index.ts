import { ArgConsumer } from "@/cli/arg-consumer";
import type { GetParserResult } from "@/cli/arg-parser";
import { ArgParser } from "@/cli/arg-parser";
import { CliLogger } from "@/cli/logger";
import { showCommit } from "@/cli/version";
import { FormatterErrors } from "@/cli/tact-fmt/error-schema";
import * as fs from "fs";
import { formatCode } from "@/fmt/fmt";
import path, { join } from "path";
import { getAnsiMarkup, isColorSupported } from "@/cli/colors";
import { glob } from "glob";
import { cwd } from "process";

const fmtVersion = "0.0.1";

export const main = () => {
    const Log = CliLogger();
    const Errors = FormatterErrors(Log.log);

    try {
        const argv = process.argv.slice(2);
        processArgs(Errors, argv);
    } catch (e) {
        Errors.unexpected(e);
    }

    if (Log.hadErrors()) {
        // https://nodejs.org/docs/v20.12.1/api/process.html#exit-codes
        process.exit(30);
    }
};

const processArgs = (Errors: FormatterErrors, argv: string[]) => {
    const Parser = ArgParser(Errors);
    const getArgs = ArgSchema(Parser);

    const match = getArgs(argv);
    if (match.kind === "ok") {
        const Args = ArgConsumer(Errors, match.value);

        parseArgs(Errors, Args);
    } else {
        showHelp();
    }
};

const ArgSchema = (Parser: ArgParser) => {
    return Parser.tokenizer
        .add(Parser.boolean("write", "w"))
        .add(Parser.boolean("check", "c"))
        .add(Parser.boolean("version", "v"))
        .add(Parser.boolean("help", "h"))
        .add(Parser.immediate).end;
};

const showHelp = () => {
    console.log(`
    Usage
      $ tact-fmt [...flags] <files> or <directories>

    Flags
      -w, --write                 Write result to same file
      -c, --check                 Check if the given files are formatted
      -v, --version               Print tact-fmt version and exit
      -h, --help                  Display this text and exit

    Examples
      $ tact-fmt --version
      ${fmtVersion}

      $ tact-fmt file.tact
      Format and output the result to stdout

      $ tact-fmt -w file.tact
      Format and rewrite file.tact

      $ tact-fmt -w ./sources
      Format and rewrite all Tact files in ./sources

      $ tact-fmt -w ./sources ./scripts
      Format and rewrite all Tact files in ./sources and ./scripts`);
};

type Args = ArgConsumer<GetParserResult<ReturnType<typeof ArgSchema>>>;

const markup = getAnsiMarkup(Boolean(isColorSupported()));

type FormatMode = "format" | "format-and-write" | "check";

function formatFile(filepath: string, mode: FormatMode): boolean | undefined {
    const content = readFileOrFail(filepath);
    if (typeof content === "undefined") return undefined;

    const [res, time] = measureTime(() => formatCode(filepath, content));
    if (res.$ === "FormatCodeError") {
        console.error(
            `Cannot format file ${path.relative(cwd(), filepath)}:`,
            res.message,
        );
        return undefined;
    }

    const alreadyFormatted = content === res.code;
    if (mode === "check") {
        if (alreadyFormatted) {
            return true;
        }
        console.log(`[${markup.yellow("warn")}]`, path.basename(filepath));
        return false;
    }

    if (mode === "format-and-write") {
        console.log(
            markup.gray(path.basename(filepath)),
            `${time.toFixed(0)}ms`,
            status(content, res.code),
        );
        fs.writeFileSync(filepath, res.code);

        return alreadyFormatted;
    } else {
        console.log(res.code);
    }
    return alreadyFormatted;
}

function status(before: string, after: string) {
    if (before !== after) {
        return "(reformatted)";
    }
    return "(unchanged)";
}

function measureTime<T>(fn: () => T): [T, number] {
    const startTime = performance.now();
    const result = fn();
    const endTime = performance.now();
    const time = endTime - startTime;
    return [result, time];
}

const parseArgs = (Errors: FormatterErrors, Args: Args) => {
    if (Args.single("help")) {
        if (noUnknownParams(Errors, Args)) {
            showHelp();
        }
        return;
    }

    if (Args.single("version")) {
        if (noUnknownParams(Errors, Args)) {
            console.log(fmtVersion);
            showCommit();
        }
        return;
    }

    const write = Args.single("write") ?? false;
    const onlyCheck = Args.single("check") ?? false;

    if (write && onlyCheck) {
        Errors.checkAndWrite();
        process.exit(1);
    }

    const filePaths = Args.multiple("immediate") ?? [];
    if (filePaths.length === 0) {
        if (noUnknownParams(Errors, Args)) {
            showHelp();
        }
        return;
    }

    const mode = onlyCheck ? "check" : write ? "format-and-write" : "format";
    if (mode === "check") {
        console.log("Checking formatting...");
    }

    const filesToFormat = collectFilesToFormat(filePaths);

    let someFileCannotBeFormatted = false;
    let allFormatted = true;
    for (const file of filesToFormat) {
        const res = formatFile(file, mode);
        if (typeof res === "undefined") {
            someFileCannotBeFormatted = true;
        } else {
            allFormatted &&= res;
        }
    }

    if (onlyCheck) {
        if (!allFormatted) {
            console.log(
                "Code style issues found in the above file. Run tact-fmt with --write to fix.",
            );
            process.exit(1);
        } else {
            console.log("All Tact files use official code style!");
        }
    }

    if (someFileCannotBeFormatted) {
        process.exit(1);
    }
};

const collectFilesToFormat = (paths: string[]): string[] => {
    return paths.flatMap((path) => {
        if (!fs.statSync(path).isFile()) {
            return globSync(["**/*.tact"], { cwd: path }).map((file) =>
                join(path, file),
            );
        } else {
            return path;
        }
    });
};

const noUnknownParams = (Errors: FormatterErrors, Args: Args): boolean => {
    const leftoverArgs = Args.leftover();

    if (leftoverArgs.length === 0) {
        return true;
    }

    for (const argument of leftoverArgs) {
        Errors.unexpectedArgument(argument);
    }
    showHelp();
    return false;
};

function readFileOrFail(filePath: string): string | undefined {
    try {
        return fs.readFileSync(filePath, "utf8");
    } catch (e) {
        const error = e as Error;
        console.error(`Cannot read file: ${error.message}`);
        return undefined;
    }
}

const globSync = (globs: string[], options: { cwd: string }) => {
    return globs.flatMap((g) => glob.sync(g, options));
};

// void main();®
