import path from "path";
import { TerminalLogger } from "@/cli/logger";
import { getAnsiMarkup, isColorSupported } from "@/cli/colors";
import { ProjectReader } from "@/next/imports/reader";
import { fromString } from "@/imports/path";
import { inspect } from 'util';
// eslint-disable-next-line @typescript-eslint/no-confusing-void-expression
const dump = (obj: unknown) => console.log(inspect(obj, { colors: false, depth: Infinity }));

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
                {
                    language: 'tact',
                    type: 'relative',
                    path: fromString("mutual1.tact"),
                },
            );
            if (result) {
                dump(result.sources.length);
            }
        });
    });
};

void main();
