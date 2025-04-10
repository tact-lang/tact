import { run } from "@/cli/tact";
import { Logger, LogLevel } from "@/context/logger";
import { createVirtualFileSystem } from "@/vfs/createVirtualFileSystem";
import * as Stdlib from "@/stdlib/stdlib";
import { createNodeFileSystem } from "@/vfs/createNodeFileSystem";
import path from "path";
import * as fs from "fs";

describe("codegen", () => {
    it(`should correctly generate .pkg file: Windows uses Unix-like paths`, async () => {
        const output = "./output/";
        const project = createNodeFileSystem(
            path.resolve(__dirname, "test-contracts"),
            false,
        );
        await run({
            config: {
                projects: [
                    {
                        name: "packaging",
                        path: "./packaging.tact",
                        output,
                        options: {},
                    },
                ],
            },
            logger: new Logger(LogLevel.NONE),
            project: project,
            stdlib: createVirtualFileSystem("@stdlib", Stdlib.files),
        });

        const pathAbiFile = project.resolve(output, "packaging_Echo.pkg");
        const content = fs.readFileSync(pathAbiFile).toString();

        expect(content).toMatchSnapshot();
    });
});
