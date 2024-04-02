import fs from "fs";
import { decompileAll } from "@tact-lang/opcode";
import { run } from "../src/node";
import { build } from "../src/pipeline/build";
import { FuncCompilationResult, funcCompile } from "../src/func/funcCompile";
import path from "path";
import { ConfigProject } from "../src/config/parseConfig";
import { createNodeFileSystem } from "../src/vfs/createNodeFileSystem";
import { glob } from "glob";
import { verify } from "../src/verify";
import { consoleLogger } from "../src/logger";
import { __DANGER__disableVersionNumber } from "../src/pipeline/version";

// Read cases
(async () => {
    // Disable version number in packages
    __DANGER__disableVersionNumber();

    // Compile projects
    if (!(await run({ configPath: __dirname + "/../tact.config.json" }))) {
        console.error("Tact projects compilation failed");
        process.exit(1);
    }

    // Verify projects
    for (const pkgPath of glob.sync(
        path.normalize(
            path.resolve(__dirname, "..", "examples", "output", "*.pkg"),
        ),
    )) {
        const res = await verify({ pkg: fs.readFileSync(pkgPath, "utf-8") });
        if (!res.ok) {
            console.error("Failed to verify " + pkgPath + ": " + res.error);
            process.exit(1);
        }
    }

    // Compile test contracts
    for (const p of [
        { path: path.resolve(__dirname, "..", "src", "test", "contracts") },
    ]) {
        const recs = fs.readdirSync(p.path);
        for (const r of recs) {
            if (!r.endsWith(".tact")) {
                continue;
            }

            const config: ConfigProject = {
                name: r.slice(0, r.length - ".tact".length),
                path: "./" + r,
                output: "./output/",
            };
            const stdlib = "@stdlib";
            const project = createNodeFileSystem(p.path, false);
            await build({
                config,
                stdlib,
                project,
            });
        }
    }

    // Compile func files
    for (const p of [{ path: __dirname + "/../func/" }]) {
        const recs = fs.readdirSync(p.path);
        for (const r of recs) {
            if (!r.endsWith(".fc")) {
                continue;
            }

            // Precompile
            console.log("Processing " + p.path + r);
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
                    logger: consoleLogger,
                });
                if (!c.ok) {
                    console.error(c.log);
                    process.exit(1);
                }
            } catch (e) {
                console.error(e);
                console.error("Failed");
                process.exit(1);
            }
            fs.writeFileSync(p.path + r + ".fift", c.fift!);
            fs.writeFileSync(p.path + r + ".cell", c.output!);

            // Cell -> Fift decompiler
            const source = decompileAll({ src: c.output! });
            fs.writeFileSync(p.path + r + ".rev.fift", source);
        }
    }
})();
