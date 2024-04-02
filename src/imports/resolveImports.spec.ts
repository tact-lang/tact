import { resolveImports } from "./resolveImports";
import { createNodeFileSystem } from "../vfs/createNodeFileSystem";
import path from "path";

describe("resolveImports", () => {
    it("should resolve imports", () => {
        const project = createNodeFileSystem(
            path.resolve(__dirname, "__testdata", "project"),
        );
        const stdlib = createNodeFileSystem(
            path.resolve(__dirname, "__testdata", "stdlib"),
        );
        const resolved = resolveImports({
            project,
            stdlib,
            entrypoint: "./main.tact",
        });
        expect(resolved).toMatchObject({
            func: [
                {
                    code: "",
                    path: path.resolve(
                        __dirname,
                        "__testdata",
                        "stdlib",
                        "stdlib2.fc",
                    ),
                },
            ],
            tact: [
                {
                    code: 'import "./stdlib2.fc";',
                    path: path.resolve(
                        __dirname,
                        "__testdata",
                        "stdlib",
                        "stdlib.tact",
                    ),
                },
                {
                    code: "",
                    path: path.resolve(
                        __dirname,
                        "__testdata",
                        "project",
                        "imported.tact",
                    ),
                },
                {
                    code: 'import "../imported_from_subfolder";',
                    path: path.resolve(
                        __dirname,
                        "__testdata",
                        "project",
                        "subfolder",
                        "import_from_parent.tact",
                    ),
                },
                {
                    code: "",
                    path: path.resolve(
                        __dirname,
                        "__testdata",
                        "project",
                        "imported_from_subfolder.tact",
                    ),
                },
                {
                    code: 'import "./imported"; import "./subfolder/import_from_parent";',
                    path: path.resolve(
                        __dirname,
                        "__testdata",
                        "project",
                        "main.tact",
                    ),
                },
            ],
        });
    });
});
