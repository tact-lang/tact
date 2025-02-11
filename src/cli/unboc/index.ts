import { readFileSync } from "fs";
import { decompileAll } from "@tact-lang/opcode";
import { ArgConsumer } from "../arg-consumer";
import { ArgParser, GetParserResult } from "../arg-parser";
import { CliLogger } from "../logger";
import { UnbocErrors } from "./error-schema";
import { showCommit } from "../version";

const unbocVersion = "0.0.1";

export const main = () => {
    const Log = CliLogger();
    const Errors = UnbocErrors(Log.log);

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

const processArgs = (Errors: UnbocErrors, argv: string[]) => {
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
        .add(Parser.boolean("version", "v"))
        .add(Parser.boolean("help", "h"))
        .add(Parser.immediate).end;
};

const showHelp = () => {
    console.log(`
    Usage
      $ unboc [...flags] BOC-FILE

    Flags
      -v, --version               Print unboc version and exit
      -h, --help                  Display this text and exit

    Examples
      $ unboc --version
      ${unbocVersion}`);
};

type Args = ArgConsumer<GetParserResult<ReturnType<typeof ArgSchema>>>;

const parseArgs = (Errors: UnbocErrors, Args: Args) => {
    if (Args.single("help")) {
        if (noUnknownParams(Errors, Args)) {
            showHelp();
        }
        return;
    }

    if (Args.single("version")) {
        if (noUnknownParams(Errors, Args)) {
            console.log(unbocVersion);
            showCommit();
        }
        return;
    }

    const filePath = Args.single("immediate");
    if (filePath) {
        const boc = readFileSync(filePath);
        const disasmResult = decompileAll({ src: Buffer.from(boc) });
        console.log(disasmResult);
        return;
    }

    if (noUnknownParams(Errors, Args)) {
        showHelp();
    }
};

const noUnknownParams = (Errors: UnbocErrors, Args: Args): boolean => {
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
