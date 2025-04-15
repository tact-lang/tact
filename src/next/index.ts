import path from "path";
import { getParser } from "@/next/grammar";
import { TerminalLogger } from "@/cli/logger";
import { getAnsiMarkup, isColorSupported } from "@/cli/colors";
import { inspect } from 'util';
import { createProxyFs } from "@/next/fs/proxy-fs";
import { fromString } from "@/imports/path";

// const target = "wallet-v4.tact";
// const target = "generic.tact";
// const target = "union.tact";
const target = "alias.tact";

// eslint-disable-next-line @typescript-eslint/no-confusing-void-expression
const dump = (obj: unknown) => console.log(inspect(obj, { colors: true, depth: Infinity }));

const main = async () => {
    const ansi = getAnsiMarkup(isColorSupported());
    await TerminalLogger(path, "info", ansi, async (log) => {
        const project = createProxyFs(
            path.join(__dirname, 'example'),
            log,
            false,
        );

        const file = project.focus(fromString(target));
        const code = await file.read();

        if (code) {
            log.source(file.getAbsolutePathForLog(), code, (log) => {
                log.recover((log) => {
                    const parse = getParser(log);
                    const ast = parse(code);
                    dump(ast);
                });
            });
        }
    });
};

void main();
