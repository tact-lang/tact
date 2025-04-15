import { ArgConsumer } from "@/cli/arg-consumer";
import type { GetParserResult } from "@/cli/arg-parser";
import { ArgParser } from "@/cli/arg-parser";
import { CliLogger } from "@/cli/logger";
import { showCommit } from "@/cli/version";
import { FormatterErrors } from "@/cli/tact-fmt/error-schema";
import * as fs from "fs";
import { formatCode } from "@/fmt/fmt";
import { writeFileSync } from "fs";

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
      $ tact-fmt [...flags] TACT-FILE

    Flags
      -w, --write                 Write result to same file
      -v, --version               Print tact-fmt version and exit
      -h, --help                  Display this text and exit

    Examples
      $ tact-fmt --version
      ${fmtVersion}`);
};

type Args = ArgConsumer<GetParserResult<ReturnType<typeof ArgSchema>>>;

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
        const fileContent = fs.readFileSync(filePath, "utf8");
        const res = formatCode(filePath, fileContent);
        if (res.$ === "FormatCodeError") {
            console.error(res.message);
            process.exit(1);
        }

        if (Args.single("write")) {
            writeFileSync(filePath, res.code);
        } else {
            console.log(res.code);
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
