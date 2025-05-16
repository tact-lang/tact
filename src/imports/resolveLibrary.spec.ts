import { createVirtualFileSystem } from "@/vfs/createVirtualFileSystem";
import { fromString } from "@/imports/path";
import { resolveLibrary } from "@/imports/resolveLibrary";
import type { Source } from "@/imports/source";
import { step } from "@/test/allure/allure";

const project = createVirtualFileSystem("/project", {
    ["main.tact"]: "",
    ["import.tact"]: "",
    ["main.fc"]: "",
});

const mainSource: Source = {
    origin: "user",
    path: "/project/main.tact",
    code: "",
};

const stdlib = createVirtualFileSystem("@stdlib", {
    ["libs/config.tact"]: "",
    ["libs/import.tact"]: "",
});

const stdlibSource: Source = {
    origin: "stdlib",
    path: "@stdlib/libs/import.tact",
    code: "",
};

it("project file, stdlib import", async () => {
    const resolved = resolveLibrary({
        sourceFrom: mainSource,
        importPath: {
            path: fromString("config.tact"),
            language: "tact",
            type: "stdlib",
        },
        project,
        stdlib,
    });
    await step("Resolved library should match expected object", () => {
        expect(resolved).toMatchObject({
            ok: true,
            path: "@stdlib/libs/config.tact",
            origin: "stdlib",
            language: "tact",
        });
    });
});

it("project file, relative import, func", async () => {
    const resolved = resolveLibrary({
        sourceFrom: mainSource,
        importPath: {
            path: fromString("./main.fc"),
            type: "relative",
            language: "func",
        },
        project,
        stdlib,
    });
    await step("Resolved library should match expected object", () => {
        expect(resolved).toMatchObject({
            ok: true,
            path: "/project/main.fc",
            origin: "user",
            language: "func",
        });
    });
});

it("project file, relative import, tact", async () => {
    const resolved = resolveLibrary({
        sourceFrom: mainSource,
        importPath: {
            path: fromString("./import.tact"),
            language: "tact",
            type: "relative",
        },
        project,
        stdlib,
    });
    await step("Resolved library should match expected object", () => {
        expect(resolved).toMatchObject({
            ok: true,
            path: "/project/import.tact",
            origin: "user",
            language: "tact",
        });
    });
});

it("stdlib file, relative import, tact", async () => {
    const resolved = resolveLibrary({
        sourceFrom: stdlibSource,
        importPath: {
            path: fromString("./import.tact"),
            language: "tact",
            type: "relative",
        },
        project,
        stdlib,
    });

    await step("Resolved library should match expected object", () => {
        expect(resolved).toMatchObject({
            ok: true,
            path: "@stdlib/libs/import.tact",
            origin: "stdlib",
            language: "tact",
        });
    });
});
