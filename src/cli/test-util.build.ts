import { exec } from "child_process";
import { join } from "path";
import { writeFile, mkdir } from "fs/promises";
import type { Config, ConfigProject } from "../config/parseConfig";

type Result = Exited | Signaled;
type Exited = { kind: "exited"; code: number; stdout: string };
type Signaled = { kind: "signaled"; signal: NodeJS.Signals };

export const runCommand = (command: string, cwd: string = process.cwd()) => {
    const thread = exec(command, { cwd });
    return new Promise<Result>((resolve, reject) => {
        const chunks: string[] = [];
        thread.stdout?.on("data", (chunk) => {
            chunks.push(chunk);
        });
        thread.on("error", (code) => {
            reject(code);
        });
        thread.on("exit", (code, signal) => {
            if (code !== null) {
                resolve({ kind: "exited", code, stdout: chunks.join("") });
            } else if (signal !== null) {
                resolve({ kind: "signaled", signal });
            } else {
                reject(new Error("Node.js bug"));
            }
        });
    });
};

export const makeCodegen = (outputDir: string) => {
    const contract = async (name: string, code: string) => {
        await mkdir(outputDir, { recursive: true });
        const fullPath = join(outputDir, `${name}.tact`);
        await writeFile(fullPath, code);
        return fullPath;
    };

    const config = async (
        name: string,
        code: string,
        partialConfig: Pick<ConfigProject, "options" | "mode">,
    ) => {
        await mkdir(outputDir, { recursive: true });
        const outDir = outputDir;
        await writeFile(join(outDir, `${name}.tact`), code);
        const config: Config = {
            projects: [
                {
                    name,
                    path: `./${name}.tact`,
                    output: `./${name}`,
                    ...partialConfig,
                },
            ],
        };
        const configPath = join(outDir, `${name}.config.json`);
        await writeFile(configPath, JSON.stringify(config, null, 4));
        return {
            config: configPath,
            outputPath: (ext: string) =>
                join(outDir, name, `${name}_Test.${ext}`),
        };
    };

    return { contract, config };
};
