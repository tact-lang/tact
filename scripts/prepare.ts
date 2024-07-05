import fs from "fs";
import { decompileAll } from "@tact-lang/opcode";
import { run } from "../src/node";
import { FuncCompilationResult, funcCompile } from "../src/func/funcCompile";
import path from "path";
import { glob } from "glob";
import { verify } from "../src/verify";
import { Logger } from "../src/logger";
import { __DANGER__disableVersionNumber } from "../src/pipeline/version";

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
        for (const p of [{ path: path.join(__dirname, "/../func/") }]) {
            const recs = fs.readdirSync(p.path);
            for (const r of recs) {
                if (!r.endsWith(".fc")) {
                    continue;
                }

                // Precompile
                logger.info(`Processing ${path.join(p.path + r)}`);
                let c: FuncCompilationResult;
                try {
                    const stdlibPath = path.resolve(
                        __dirname,
                        "..",
                        "stdlib",
                        "stdlib.fc",
                    );
                    const stdlib = fs.readFileSync(stdlibPath, "utf-8");
                    const code = fs.readFileSync(p.path + r, "utf-8");
                    c = await funcCompile({
                        entries: [stdlibPath, p.path + r],
                        sources: [
                            {
                                path: stdlibPath,
                                content: stdlib,
                            },
                            {
                                path: p.path + r,
                                content: code,
                            },
                        ],
                        logger: logger,
                    });
                    if (!c.ok) {
                        logger.error(c.log);
                        throw new Error(
                            `FunC compilation failed for ${path.join(p.path, r)}`,
                        );
                    }
                } catch (e) {
                    logger.error(e as Error);
                    logger.error(`Failed for ${path.join(p.path, r)}`);
                    throw e;
                }
                fs.writeFileSync(p.path + r + ".fift", c.fift!);
                fs.writeFileSync(p.path + r + ".cell", c.output!);

                // Cell -> Fift decompiler
                const source = decompileAll({ src: c.output! });
                fs.writeFileSync(p.path + r + ".rev.fift", source);
            }
        }
    } catch (error) {
        logger.error(error as Error);
        process.exit(1);
    }
})();
