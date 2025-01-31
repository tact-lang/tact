import { glob } from "glob";
import { createVirtualFileSystem } from "../../vfs/createVirtualFileSystem";
import { Options } from "../../config/parseConfig";
import { basename, dirname, extname, join } from "path";
import { createNodeFileSystem } from "../../vfs/createNodeFileSystem";
import { Logger, LogLevel } from "../../context/logger";
import { run } from "../../cli/tact";
import files from "../../stdlib/stdlib";

// node.js 20+ builtin
const globSync = (globs: string[], options: { cwd: string }) => {
    return globs.flatMap((g) => glob.sync(g, options));
};

export const allInFolder = async (
    folder: string,
    globs: string[],
    options: Options = { debug: true },
) => {
    try {
        const stdlib = createVirtualFileSystem("@stdlib", files);

        const contracts = globSync(globs, { cwd: folder });

        const projects = contracts.map((contractPath) => {
            const contractOptions: Options = structuredClone(options);
            if (contractPath.includes("inline")) {
                contractOptions.experimental = { inline: true };
            }
            if (contractPath.includes("external")) {
                contractOptions.external = true;
            }
            return {
                name: basename(contractPath, extname(contractPath)),
                path: contractPath,
                output: join(dirname(contractPath), "output"),
                options: contractOptions,
            };
        });

        const project = createNodeFileSystem(folder, false);

        const compileResult = await run({
            config: { projects },
            logger: new Logger(LogLevel.INFO),
            project,
            stdlib,
        });
        if (!compileResult.ok) {
            throw new Error("Tact projects compilation failed");
        }
    } catch (error) {
        console.error(error);
        process.exit(1);
    }
};
