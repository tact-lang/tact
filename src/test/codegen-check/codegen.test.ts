import type { Options } from "@/config/config";
import { run } from "@/cli/tact";
import { Logger, LogLevel } from "@/context/logger";
import { createVirtualFileSystem } from "@/vfs/createVirtualFileSystem";
import files from "@/stdlib/stdlib";
import { createNodeFileSystem } from "@/vfs/createNodeFileSystem";
import path from "path";
import * as fs from "fs";

describe("codegen", () => {
    it(`should correctly generate FunC code`, async () => {
        const fileName = `main.tact`;
        const options: Options = {};

        const project = createNodeFileSystem(
            path.resolve(__dirname, "contracts"),
            false,
        );
        const result = await run({
            config: {
                projects: [
                    {
                        name: "main",
                        path: `./${fileName}`,
                        output: `./output/`,
                        options,
                    },
                ],
            },
            logger: new Logger(LogLevel.NONE),
            project: project,
            stdlib: createVirtualFileSystem("@stdlib", files),
        });

        const pathFuncCode = project.resolve(
            `./output/`,
            `main_MainContract.fc`,
        );
        const content = fs.readFileSync(pathFuncCode).toString();

        expect(result.ok).toBe(true);
        expect(content).toMatchSnapshot();
    });
});
