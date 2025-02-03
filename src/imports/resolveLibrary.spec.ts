import { createVirtualFileSystem } from "../vfs/createVirtualFileSystem";
import { fromString } from "./path";
import { resolveLibrary } from "./resolveLibrary";
import { Source } from "./source";

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

it("project file, stdlib import", () => {
    const resolved = resolveLibrary({
        sourceFrom: mainSource,
        sourceRef: {
            path: fromString("config.tact"),
            language: "tact",
            type: "stdlib",
        },
        project,
        stdlib,
    });
    expect(resolved).toMatchObject({
        ok: true,
        path: "@stdlib/libs/config.tact",
        origin: "stdlib",
        language: "tact",
    });
});

it("project file, relative import, func", () => {
    const resolved = resolveLibrary({
        sourceFrom: mainSource,
        sourceRef: {
            path: fromString("./main.fc"),
            type: "relative",
            language: "func",
        },
        project,
        stdlib,
    });
    expect(resolved).toMatchObject({
        ok: true,
        path: "/project/main.fc",
        origin: "user",
        language: "func",
    });
});

it("project file, relative import, tact", () => {
    const resolved = resolveLibrary({
        sourceFrom: mainSource,
        sourceRef: {
            path: fromString("./import.tact"),
            language: "tact",
            type: "relative",
        },
        project,
        stdlib,
    });
    expect(resolved).toMatchObject({
        ok: true,
        path: "/project/import.tact",
        origin: "user",
        language: "tact",
    });
});

it("stdlib file, relative import, tact", () => {
    const resolved = resolveLibrary({
        sourceFrom: stdlibSource,
        sourceRef: {
            path: fromString("./import.tact"),
            language: "tact",
            type: "relative",
        },
        project,
        stdlib,
    });

    expect(resolved).toMatchObject({
        ok: true,
        path: "@stdlib/libs/import.tact",
        origin: "stdlib",
        language: "tact",
    });
});
