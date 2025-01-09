import fs from "fs";
import { decompileAll } from "@tact-lang/opcode";
import { run } from "../src/node";
import { FuncCompilationResult, funcCompile } from "../src/func/funcCompile";
import path from "path";
import { glob } from "glob";
import { verify } from "../src/verify";
import { Logger } from "../src/010-pipeline/logger";
import { __DANGER__disableVersionNumber } from "../src/010-pipeline/version";

// Read cases
void (async () => {
    // Disable version number in packages
    __DANGER__disableVersionNumber();

    const logger = new Logger();

    try {
        // Compile projects
        const compileResult = await run({
            configPath: path.join(__dirname, "..", "tact.config.json"),
        });
        if (!compileResult.ok) {
            throw new Error("Tact projects compilation failed");
        }

        // Verify projects
        for (const pkgPath of glob.sync(
            path.normalize(
                path.resolve(__dirname, "..", "examples", "output", "*.pkg"),
            ),
        )) {
            const res = await verify({
                pkg: fs.readFileSync(pkgPath, "utf-8"),
            });
            if (!res.ok) {
                throw new Error(`Failed to verify ${pkgPath}: ${res.error}`);
            }
        }

        // Compile func files
        for (const p of [{ path: path.join(__dirname, "..", "func") }]) {
            const files = fs.readdirSync(p.path);
            for (const file of files) {
                if (!file.endsWith(".fc")) {
                    continue;
                }

                // Precompile
                const funcFileFullPath = path.join(p.path, file);
                logger.info(`Processing ${funcFileFullPath}`);
                let c: FuncCompilationResult;
                try {
                    const stdlibPath = path.resolve(
                        __dirname,
                        "..",
                        "stdlib",
                        "stdlib.fc",
                    );
                    const stdlib = fs.readFileSync(stdlibPath, "utf-8");
                    const code = fs.readFileSync(funcFileFullPath, "utf-8");
                    c = await funcCompile({
                        entries: [stdlibPath, funcFileFullPath],
                        sources: [
                            {
                                path: stdlibPath,
                                content: stdlib,
                            },
                            {
                                path: funcFileFullPath,
                                content: code,
                            },
                        ],
                        logger,
                    });
                    if (!c.ok) {
                        logger.error(c.log);
                        throw new Error(
                            `FunC compilation failed for ${funcFileFullPath}`,
                        );
                    }
                } catch (e) {
                    logger.error(e as Error);
                    logger.error(`Failed for ${funcFileFullPath}`);
                    throw e;
                }
                fs.writeFileSync(funcFileFullPath + ".fift", c.fift!);
                fs.writeFileSync(funcFileFullPath + ".cell", c.output!);

                // Cell -> Fift decompiler
                const source = decompileAll({ src: c.output! });
                fs.writeFileSync(funcFileFullPath + ".rev.fift", source);
            }
        }
    } catch (error) {
        logger.error(error as Error);
        process.exit(1);
    }
})();
