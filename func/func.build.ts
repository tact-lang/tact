import fs from "fs";
import { decompileAll } from "@tact-lang/opcode";
import {
    FuncCompilationResult,
    funcCompile,
} from "../src/090-func/funcCompile";
import path from "path";
import { Logger } from "../src/010-pipeline/logger";
import { __DANGER__disableVersionNumber } from "../src/010-pipeline/version";
import { stdlibPath } from "../src/040-imports/path";

const funcPath = path.join(__dirname, "..", "func");

// Read cases
void (async () => {
    // Disable version number in packages
    __DANGER__disableVersionNumber();

    const logger = new Logger();

    try {
        // Compile func files
        for (const file of fs.readdirSync(funcPath)) {
            if (!file.endsWith(".fc")) {
                continue;
            }

            // Precompile
            const funcFileFullPath = path.join(funcPath, file);
            logger.info(`Processing ${funcFileFullPath}`);
            let c: FuncCompilationResult;
            try {
                const stdlibFuncPath = path.resolve(stdlibPath, "stdlib.fc");
                const stdlib = fs.readFileSync(stdlibFuncPath, "utf-8");
                const code = fs.readFileSync(funcFileFullPath, "utf-8");
                c = await funcCompile({
                    entries: [stdlibFuncPath, funcFileFullPath],
                    sources: [
                        {
                            path: stdlibFuncPath,
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
    } catch (error) {
        logger.error(error as Error);
        process.exit(1);
    }
})();
