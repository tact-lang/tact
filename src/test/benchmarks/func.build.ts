import { __DANGER__disableVersionNumber } from "../../pipeline/version";
import { promises as fs } from "fs";
import { glob } from "glob";
import path, { basename, dirname, extname, join } from "path";
import files from "../../stdlib/stdlib";
import { createVirtualFileSystem } from "../../vfs/createVirtualFileSystem";
import { createNodeFileSystem } from "../../vfs/createNodeFileSystem";
import { funcCompile } from "../../func/funcCompile";
import { posixNormalize } from "../../utils/filePath";
import { Logger } from "../../context/logger";

const globSync = (globs: string[], options: { cwd: string }) => {
    return globs.flatMap((g) => glob.sync(g, options));
};

const allInFolderFunc = async (folder: string, globs: string[]) => {
    try {
        const stdlib = createVirtualFileSystem("@stdlib", files);

        const contractsPaths = globSync(globs, { cwd: folder });

        const contracts = contractsPaths.map((contractPath) => {
            const name = basename(contractPath, extname(contractPath));
            return {
                name,
                path: contractPath,
                output: join(
                    dirname(contractPath),
                    "../../output/func",
                    `${name}.boc`,
                ),
            };
        });

        const project = createNodeFileSystem(folder, false);
        const logger = new Logger();

        const importRegex = /#include\s+"([^"]+)"/g;
        const isContractRegex = /\(\)\s+recv_internal/g;

        for (const contractInfo of contracts) {
            try {
                const stdlibPath = stdlib.resolve("std/stdlib.fc");
                const stdlibCode = stdlib.readFile(stdlibPath).toString();
                const stdlibExPath = stdlib.resolve("std/stdlib_ex.fc");
                const stdlibExCode = stdlib.readFile(stdlibExPath).toString();

                // i need to regex match the imports and add the stdlib path to them
                // statements like #include "params.fc";
                const contractCode = project
                    .readFile(project.resolve(contractInfo.path))
                    .toString();

                if (!isContractRegex.test(contractCode)) {
                    continue;
                }

                logger.info(
                    `💼 Compiling FunC contract ${contractInfo.name}...`,
                );

                let match;
                const includes: string[] = [];
                while ((match = importRegex.exec(contractCode)) !== null) {
                    includes.push(match[1]!);
                }

                const includePaths = includes.map((include) => {
                    return posixNormalize(
                        project.resolve(
                            path.join(dirname(contractInfo.path), include),
                        ),
                    );
                });

                const funcArgs = {
                    entries: [
                        stdlibPath,
                        stdlibExPath,
                        // ...includePaths,
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
                        ...includePaths.map((includePath) => ({
                            path: includePath,
                            content: project.readFile(includePath).toString(),
                        })),
                        {
                            path: posixNormalize(
                                project.resolve(contractInfo.path),
                            ),
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

                    continue;
                }

                project.writeFile(
                    project.resolve(contractInfo.output),
                    compilationResult.output!,
                );
            } catch (e) {
                logger.error("FunC compiler crashed");
                logger.error(e as Error);
                continue;
            }
        }
    } catch (error) {
        console.error(error);
        process.exit(1);
    }
};

const main = async () => {
    // Disable version number in packages
    __DANGER__disableVersionNumber();

    const outputDir = path.join(__dirname, "contracts/output/func");
    try {
        await fs.access(outputDir);
        await fs.rm(outputDir, { recursive: true, force: true });
    } catch {
        // Directory does not exist, no need to remove
    }

    await allInFolderFunc(__dirname, ["contracts/func/**/*.fc"]);
};

void main();
