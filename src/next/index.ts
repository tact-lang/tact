import fs from "fs/promises";
import path from "path";
import { getParser } from "@/next/grammar";
import { TerminalLogger } from "@/cli/logger";
import { getAnsiMarkup, isColorSupported } from "@/cli/colors";
import { inspect } from 'util';

// eslint-disable-next-line @typescript-eslint/no-confusing-void-expression
const dump = (obj: unknown) => console.log(inspect(obj, { colors: true, depth: Infinity }));

const main = async () => {
    const ansi = getAnsiMarkup(isColorSupported());
    await TerminalLogger(path, "info", ansi, async (log) => {
        const sourcePath = path.join(__dirname, "wallet-v4.tact");
        const code = await fs.readFile(sourcePath, "utf8");
        log.source(sourcePath, code, (log) => {
            log.recover((log) => {
                const parse = getParser(log);
                const ast = parse(code);
                dump(ast);
            });
        });
    });
};

void main();
