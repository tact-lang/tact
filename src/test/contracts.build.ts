import { run } from "../cli";
import { basename, dirname, extname, join, relative } from "path";
import { Logger, LogLevel } from "../context/logger";
import { __DANGER__disableVersionNumber } from "../pipeline/version";
import { globSync } from "fs";
import { createVirtualFileSystem } from "../vfs/createVirtualFileSystem";
import files from "../stdlib/stdlib";
import { createNodeFileSystem } from "../vfs/createNodeFileSystem";
import { Options } from "../config/parseConfig";

const main = async () => {
    // Disable version number in packages
    __DANGER__disableVersionNumber();

    try {
        const stdlib = createVirtualFileSystem("@stdlib", files);

        const folder = __dirname;

        const contracts = globSync([
            "e2e-emulated/contracts/*.tact",
            "benchmarks/contracts/*.tact",
            "codegen/all-contracts.tact",
            "exit-codes/contracts/*.tact",
        ], { cwd: folder });

        const projects = contracts.map(contractPath => {
            const options: Options = { debug: true };
            if (contractPath.includes('inline')) {
                options.experimental = { inline: true };
            }
            return {
                name: basename(contractPath, extname(contractPath)),
                path: contractPath,
                output: join(dirname(contractPath), 'output'),
                options,
            }
        });

        const project = createNodeFileSystem(folder, false);
        
        debugger;
        const compileResult = await run({
            config: { projects },
            logger: new Logger(LogLevel.DEBUG),
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

void main();
