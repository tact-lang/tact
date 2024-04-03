import { createVirtualFileSystem } from "../vfs/createVirtualFileSystem";
import { resolveLibrary } from "./resolveLibrary";

describe("resolveLibrary", () => {
    it("should resolve imports", () => {
        const project = createVirtualFileSystem("/project", {
            ["main.tact"]: "",
            ["import.tact"]: "",
            ["main.fc"]: "",
        });
        const stdlib = createVirtualFileSystem("@stdlib", {
            ["libs/config.tact"]: "",
            ["libs/config/import.tact"]: "",
        });

        // Resolve stdlib import
        let resolved = resolveLibrary({
            path: "/project/main.tact",
            name: "@stdlib/config",
            project,
            stdlib,
        });
        if (!resolved.ok) {
            throw Error("Unable to resolve library");
        }
        expect(resolved.path).toBe("@stdlib/libs/config.tact");
        expect(resolved.source).toBe("stdlib");
        expect(resolved.kind).toBe("tact");

        // Resolve import func file
        resolved = resolveLibrary({
            path: "/project/main.tact",
            name: "./main.fc",
            project,
            stdlib,
        });
        if (!resolved.ok) {
            throw Error("Unable to resolve library");
        }
        expect(resolved.path).toBe("/project/main.fc");
        expect(resolved.source).toBe("project");
        expect(resolved.kind).toBe("func");

        // Resolve import tact file
        resolved = resolveLibrary({
            path: "/project/main.tact",
            name: "./import",
            project,
            stdlib,
        });
        if (!resolved.ok) {
            throw Error("Unable to resolve library");
        }
        expect(resolved.path).toBe("/project/import.tact");
        expect(resolved.source).toBe("project");
        expect(resolved.kind).toBe("tact");

        // Resolve import tact file
        resolved = resolveLibrary({
            path: "/project/main.tact",
            name: "./import.tact",
            project,
            stdlib,
        });
        if (!resolved.ok) {
            throw Error("Unable to resolve library");
        }
        expect(resolved.path).toBe("/project/import.tact");
        expect(resolved.source).toBe("project");
        expect(resolved.kind).toBe("tact");

        // Resolve import internal stdlib file
        resolved = resolveLibrary({
            path: "@stdlib/libs/import.tact",
            name: "./config/import",
            project,
            stdlib,
        });
        if (!resolved.ok) {
            throw Error("Unable to resolve library");
        }
        expect(resolved.path).toBe("@stdlib/libs/config/import.tact");
        expect(resolved.source).toBe("stdlib");
        expect(resolved.kind).toBe("tact");
    });
});
