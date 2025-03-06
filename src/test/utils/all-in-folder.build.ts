import { glob } from "glob";
import { createVirtualFileSystem } from "../../vfs/createVirtualFileSystem";
import type { Options } from "../../config/parseConfig";
import { basename, dirname, extname, join } from "path";
import { createNodeFileSystem } from "../../vfs/createNodeFileSystem";
import { Logger, LogLevel } from "../../context/logger";
import { run } from "../../cli/tact";
import files from "../../stdlib/stdlib";
import { posixNormalize } from "../../utils/filePath";
import { funcCompile } from "../../func/funcCompile";

// node.js 20+ builtin
export const globSync = (globs: string[], options: { cwd: string }) => {
    return globs.flatMap((g) => glob.sync(g, options));
};

export const allInFolder = async (
    folder: string,
    globs: string[],
    options: Options = { debug: true, external: true },
) => {
    try {
        const stdlib = createVirtualFileSystem("@stdlib", files);

        const contracts = globSync(globs, { cwd: folder });

        const projects = contracts.map((contractPath) => {
            const contractOptions: Options = structuredClone(options);
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

const runFuncBuild = async (folder: string, globs: string[]) => {
    const stdlib = createVirtualFileSystem("@stdlib", files);

    const contractsPaths = globSync(globs, { cwd: folder });

    const project = createNodeFileSystem(folder, false);

    const contracts = contractsPaths.map((contractPath) => {
        const name = basename(contractPath, extname(contractPath));
        return {
            name,
            path: contractPath,
            output: posixNormalize(
                project.resolve(
                    dirname(contractPath),
                    "../output/",
                    `${name}.boc`,
                ),
            ),
        };
    });

    const logger = new Logger();

    const importRegex = /#include\s+"([^"]+)"/g;
    const isContractRegex = /\(\)\s+recv_internal/g;

    const compileFuncContract = async (contractInfo: {
        name: string;
        path: string;
        output: string;
    }) => {
        const stdlibPath = stdlib.resolve("std/stdlib.fc");
        const stdlibCode = stdlib.readFile(stdlibPath).toString();
        const stdlibExPath = stdlib.resolve("std/stdlib_ex.fc");
        const stdlibExCode = stdlib.readFile(stdlibExPath).toString();

        // we need to regex match the imports and add them to sources
        // statements like #include "params.fc";
        const contractCode = project
            .readFile(project.resolve(contractInfo.path))
            .toString();

        // skip if no recv_internal
        if (!isContractRegex.test(contractCode)) {
            return;
        }

        logger.info(`💼 Compiling FunC contract ${contractInfo.name}...`);

        const includePaths: {
            path: string;
            content: string;
        }[] = [];

        for (const [, include] of contractCode.matchAll(importRegex)) {
            if (typeof include === "undefined") {
                continue;
            }

            const includePath = project.resolve(
                dirname(contractInfo.path),
                include,
            );

            // we need this weird path hacks to make func compiler path resolution work
            const funcCompilerCompatibleInputPath = posixNormalize(
                `${project.resolve(dirname(contractInfo.path))}/${include}`,
            );

            includePaths.push({
                path: funcCompilerCompatibleInputPath,
                content: project.readFile(includePath).toString(),
            });
        }

        const funcArgs = {
            entries: [
                stdlibPath,
                stdlibExPath,
                posixNormalize(project.resolve(contractInfo.path)),
            ],
            sources: [
                {
                    path: stdlibPath,
                    content: stdlibCode,
                },
                {
                    path: stdlibExPath,
                    content: stdlibExCode,
                },
                ...includePaths,
                {
                    path: posixNormalize(project.resolve(contractInfo.path)),
                    content: project
                        .readFile(project.resolve(contractInfo.path))
                        .toString(),
                },
            ],
            logger,
        };

        const compilationResult = await funcCompile(funcArgs);

        if (!compilationResult.ok) {
            logger.error(compilationResult.log);
            return;
        }

        project.writeFile(
            project.resolve(contractInfo.output),
            compilationResult.output!,
        );
    };

    for (const contractInfo of contracts) {
        try {
            await compileFuncContract(contractInfo);
        } catch (e) {
            logger.error("FunC compiler crashed");
            logger.error(e as Error);
            continue;
        }
    }
};

export const allInFolderFunc = async (folder: string, globs: string[]) => {
    try {
        await runFuncBuild(folder, globs);
    } catch (error) {
        console.error(error);
        process.exit(1);
    }
};
