import path from "path";
import { TerminalLogger } from "@/cli/logger";
import { getAnsiMarkup, isColorSupported } from "@/cli/colors";
import { ProjectReader } from "@/next/imports/reader";

const target = "wallet-v4.tact";

const main = async () => {
    const ansi = getAnsiMarkup(isColorSupported());
    await TerminalLogger(path, "info", ansi, async (log) => {
        await log.recover(async (log) => {
            // TODO: new CLI based (see typegen)
            const reader = await ProjectReader(log);
            if (!reader) return;
            const root = await reader.read(
                path.join(__dirname, "example"),
                target,
            );
            console.log(root);
        });
    });
};

void main();
