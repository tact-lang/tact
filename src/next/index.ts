import path from "path";
import { TerminalLogger } from "@/cli/logger";
import { getAnsiMarkup, isColorSupported } from "@/cli/colors";
import { ProjectReader } from "@/next/imports/reader";
import { inspect } from "util";
import { scope } from "@/next/scoping/tc2";

// eslint-disable-next-line @typescript-eslint/no-unused-vars
const dump = (obj: unknown) =>
    // eslint-disable-next-line @typescript-eslint/no-confusing-void-expression
    console.log(inspect(obj, { colors: false, depth: Infinity }));

const main = async () => {
    const ansi = getAnsiMarkup(isColorSupported());
    await TerminalLogger(path, "info", ansi, async (log) => {
        await log.recover(async (log) => {
            // TODO: new CLI based (see typegen)
            const reader = await ProjectReader(log);
            if (!reader) return;
            const result = await reader.read(
                path.join(__dirname, "example"),
                // TODO: parseImportString(root, ImportErrors(log)) when there are CLI/config loggers
                "scope2-a.tact",
            );
            if (!result) {
                return;
            }
            // dump(result.sources.length);
            // dump(result);
            scope(log, result);
        });
    });
};

void main();
