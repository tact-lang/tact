import { glob } from "glob";
import { createVirtualFileSystem } from "../../vfs/createVirtualFileSystem";
import { Options, optionsSchema } from "../../config/parseConfig";
import { basename, dirname, extname, join } from "path";
import { createNodeFileSystem } from "../../vfs/createNodeFileSystem";
import { Logger, LogLevel } from "../../context/logger";
import { run } from "../../cli/tact";
import files from "../../stdlib/stdlib";
import { readFile } from "fs/promises";

// node.js 20+ builtin
const globSync = (globs: string[], options: { cwd: string }) => {
    return globs.flatMap((g) => glob.sync(g, options));
};

type Project = {
    name: string;
    path: string;
    output: string;
    options: Options;
}

const pragmaStart = "//@";

export const allInFolder = async (
    folder: string,
    globs: string[],
    options: Options = { debug: true }
) => {
    try {
        const stdlib = createVirtualFileSystem("@stdlib", files);

        const contracts = globSync(globs, { cwd: folder });

        const projects: Project[] = [];
        for (const contractPath of contracts) {
            const contractOptions = structuredClone(options);
            const contractCode = await readFile(join(folder, contractPath), 'utf-8');
            const [firstLine] = contractCode.split('\n');
            if (contractCode.startsWith(pragmaStart) && firstLine) {
                const pragmaOptions = optionsSchema.parse(
                    JSON.parse(firstLine.substring(pragmaStart.length))
                );
                Object.assign(contractOptions, pragmaOptions);
            }
            projects.push({
                name: basename(contractPath, extname(contractPath)),
                path: contractPath,
                output: join(dirname(contractPath), "output"),
                options,
            });
        }

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
