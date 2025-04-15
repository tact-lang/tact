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
        .add(Parser.boolean("version", "v"))
        .add(Parser.boolean("help", "h"))
        .add(Parser.immediate).end;
};

const showHelp = () => {
    console.log(`
    Usage
      $ tact-fmt [...flags] <file> or <directory>

    Flags
      -w, --write                 Write result to same file
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
      Format and rewrite all Tact files in ./sources`);
};

type Args = ArgConsumer<GetParserResult<ReturnType<typeof ArgSchema>>>;

const markup = getAnsiMarkup(Boolean(isColorSupported()));

function formatFile(filepath: string, write: boolean): boolean | undefined {
    const content = readFileOrFail(filepath);
    if (typeof content === "undefined") return undefined;

    const [res, time] = measureTime(() => formatCode(filepath, content));
    if (res.$ === "FormatCodeError") {
        console.error(`Cannot format file ${filepath}:`, res.message);
        return undefined;
    }

    const alreadyFormatted = content === res.code;

    if (write) {
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

    const filePath = Args.single("immediate");
    if (filePath) {
        const write = Args.single("write") ?? false;

        if (!fs.statSync(filePath).isFile()) {
            const files = fs.globSync("**/*.tact", {
                cwd: filePath,
                withFileTypes: false,
            });

            let wasError = false;
            for (const file of files) {
                const res = formatFile(join(filePath, file), write);
                if (typeof res === "undefined") {
                    wasError = true;
                }
            }
            if (wasError) {
                process.exit(1);
            }
            return;
        }

        const res = formatFile(filePath, write);
        if (typeof res === "undefined") {
            process.exit(1);
        }
        return;
    }

    if (noUnknownParams(Errors, Args)) {
        showHelp();
    }
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
