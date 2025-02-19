import { join } from "path";
import { createSingleFileConfig, run } from "../../cli/tact";
import { createNodeFileSystem } from "../../vfs/createNodeFileSystem";
import { Logger, LogLevel } from "../../context/logger";
import { createVirtualFileSystem } from "../../vfs/createVirtualFileSystem";
import files from "../../stdlib/stdlib";

it("symlinks are not allowed", async () => {
    const result = await run({
        config: createSingleFileConfig(`symlink-parent.tact`, "./output"),
        logger: new Logger(LogLevel.NONE),
        project: createNodeFileSystem(join(__dirname, "contracts")),
        stdlib: createVirtualFileSystem("@stdlib", files),
    });
    expect(result.ok).toBe(false);
    const message = result.error.map((err) => err.message).join("; ");
    expect(message).toContain(
        "is a symbolic link which are not processed by Tact to forbid out-of-project-root accesses via symlinks",
    );
});
