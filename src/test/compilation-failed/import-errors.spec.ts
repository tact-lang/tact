import { join } from "path";
import { createSingleFileConfig, run } from "@/cli/tact";
import { createNodeFileSystem } from "@/vfs/createNodeFileSystem";
import { Logger, LogLevel } from "@/context/logger";
import { createVirtualFileSystem } from "@/vfs/createVirtualFileSystem";
import * as Stdlib from "@/stdlib/stdlib";
import { readFileSync } from "fs";

it("symlinks are not allowed", async () => {
    const result = await run({
        config: createSingleFileConfig(`symlink-parent.tact`, "./output"),
        logger: new Logger(LogLevel.NONE),
        project: createNodeFileSystem(join(__dirname, "contracts")),
        stdlib: createVirtualFileSystem("@stdlib", Stdlib.files),
    });
    expect(result.ok).toBe(false);
    const message = result.error.map((err) => err.message).join("; ");
    expect(message).toContain(
        "is a symbolic link which are not processed by Tact to forbid out-of-project-root accesses via symlinks",
    );
});

it("should fail on duplicate imports", async () => {
    const result = await run({
        config: {
            projects: [
                {
                    name: "duplicate-import",
                    path: "./duplicate-import.tact",
                    output: "./output",
                },
            ],
        },
        logger: new Logger(LogLevel.NONE),
        project: createVirtualFileSystem(
            "/",
            {
                "duplicate-import.tact": readFileSync(
                    join(__dirname, "contracts", "duplicate-import.tact"),
                ).toString("base64"),
                "duplicate-import-helper.tact": readFileSync(
                    join(__dirname, "contracts", "duplicate-import-helper.tact"),
                ).toString("base64"),
            },
            false,
        ),
        stdlib: createVirtualFileSystem("@stdlib", Stdlib.files),
    });
    expect(result.ok).toBe(false);
    const message = result.error.map((err) => err.message).join("; ");
    expect(message).toMatchSnapshot();
});
