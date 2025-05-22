import { glob } from "glob";
import { createVirtualFileSystem } from "@/vfs/createVirtualFileSystem";
import type { Mode, Options, Project } from "@/config/parseConfig";
import { basename, dirname, extname, join, resolve } from "path";
import { createNodeFileSystem } from "@/vfs/createNodeFileSystem";
import { Logger } from "@/context/logger";
import { posixNormalize } from "@/utils/filePath";
import { funcCompile } from "@/func/funcCompile";
import { Worker } from "worker_threads";
import type { WorkerInput, WorkerOutput } from "@/test/utils/worker.build";

const numThreads = parseInt(process.env.BUILD_THREADS ?? "", 10) || 4;

// node.js 20+ builtin
const globSync = (globs: string[], options: { cwd: string }) => {
    return globs.flatMap((g) => glob.sync(g, options));
};

function splitIntoParts<T>(
    n: number,
    xs: readonly T[],
): readonly (readonly T[])[] {
    const len = xs.length;
    const q = Math.floor(len / n);
    const r = len % n;

    const sizes = [...Array(r).fill(q + 1), ...Array(n - r).fill(q)].slice(
        0,
        len,
    ); // avoid extra empty groups if n > xs.length

    const splits = sizes.reduce<number[]>(
        (acc, size) => [...acc, acc[acc.length - 1] + size],
        [0],
    );

    return splits.slice(1).map((end, i) => xs.slice(splits[i], end));
}

const runWorker = (input: WorkerInput): Promise<WorkerOutput> => {
    return new Promise<WorkerOutput>((res, rej) => {
        const worker = new Worker(resolve(__dirname, "worker.build.ts"), {
            execArgv: ["-r", "ts-node/register/transpile-only"],
        });
        worker.once("message", (result) => {
            if (result && typeof result === "object" && "error" in result) {
                // eslint-disable-next-line @typescript-eslint/no-explicit-any
                rej(new Error((result as any).error));
            } else {
                res(result as WorkerOutput);
            }
        });
        worker.once("error", rej);
        worker.once("exit", (code) => {
            if (code !== 0) {
                rej(new Error(`Worker exited with code ${code}`));
            }
        });
        worker.postMessage(input);
    });
};

export const allInFolder = async (
    folder: string,
    globs: string[],
    options: Options = { debug: true, external: true },
    mode: Mode = "full",
) => {
    try {
        const contracts = globSync(globs, { cwd: folder });

        const projects: Project[] = contracts.map((contractPath) => {
            const contractOptions: Options = structuredClone(options);
            return {
                name: basename(contractPath, extname(contractPath)),
                path: contractPath,
                output: join(dirname(contractPath), "output"),
                options: contractOptions,
                mode,
            };
        });

        await runParallel(projects, folder);
    } catch (error) {
        console.error(error);
        process.exit(1);
    }
};

export const runParallel = async (
    projects: readonly Project[],
    folder: string,
) => {
    const projectGroups = splitIntoParts(numThreads, projects);

    const results = await Promise.all(
        Array.from(projectGroups.entries()).map(([id, projects]) =>
            runWorker({ id, folder, projects }),
        ),
    );

    for (const { type, message } of results.flatMap(
        (result) => result.messages,
    )) {
        console[type](message);
    }

    if (results.some((result) => !result.ok)) {
        throw new Error("Tact projects compilation failed");
    }
};

const runFuncBuild = async (folder: string, funcStdlibPath: string, globs: string[]) => {
    const contractsPaths = globSync(globs, { cwd: folder });

    const project = createNodeFileSystem(folder, false);
    const funcStdlib = createNodeFileSystem(funcStdlibPath, false);

    const contracts = contractsPaths.map((contractPath) => {
        const name = basename(contractPath, extname(contractPath));
        return {
            name,
            path: contractPath,
            output: posixNormalize(
                project.resolve(
                    dirname(contractPath),
                    "output/",
                    `${name}.boc`,
                ),
            ),
        };
    });

    const logger = new Logger();

    const compileFuncContract = async (contractInfo: {
        name: string;
        path: string;
        output: string;
    }) => {
        const importRegex = /#include\s+"([^"]+)"/g;
        const isContractRegex = /\(\)\s+recv_internal/g;

        const stdlibPath = funcStdlib.resolve("stdlib.fc");
        const stdlibCode = funcStdlib.readFile(stdlibPath).toString();

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
                posixNormalize(project.resolve(contractInfo.path)),
            ],
            sources: [
                {
                    path: stdlibPath,
                    content: stdlibCode,
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

export const allInFolderFunc = async (folder: string, funcStdlibPath: string, globs: string[]) => {
    try {
        await runFuncBuild(folder, funcStdlibPath, globs);
    } catch (error) {
        console.error(error);
        process.exit(1);
    }
};
