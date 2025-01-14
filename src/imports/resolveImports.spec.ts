import { resolveImports } from "./resolveImports";
import { createNodeFileSystem } from "../vfs/createNodeFileSystem";
import path from "path";
import { getParser } from "../grammar";
import { getAstFactory } from "../ast/ast";
import { defaultParser } from "../grammar/grammar";
import { projectPath, stdlibPath } from "./__testdata/cases.build";

describe("resolveImports", () => {
    it("should resolve imports", () => {
        const ast = getAstFactory();
        const resolved = resolveImports({
            project: createNodeFileSystem(projectPath),
            stdlib: createNodeFileSystem(stdlibPath),
            entrypoint: "./main.tact",
            parser: getParser(ast, defaultParser),
        });
        expect(resolved).toMatchObject({
            func: [
                {
                    code: "",
                    path: path.join(stdlibPath, "stdlib2.fc"),
                },
            ],
            tact: [
                {
                    code: 'import "./stdlib2.fc";',
                    path: path.join(stdlibPath, "stdlib.tact"),
                },
                {
                    code: "",
                    path: path.join(projectPath, "imported.tact"),
                },
                {
                    code: 'import "../imported_from_subfolder";',
                    path: path.join(
                        projectPath,
                        "subfolder",
                        "import_from_parent.tact",
                    ),
                },
                {
                    code: "",
                    path: path.join(
                        projectPath,
                        "imported_from_subfolder.tact",
                    ),
                },
                {
                    code: 'import "./imported"; import "./subfolder/import_from_parent";',
                    path: path.join(projectPath, "main.tact"),
                },
            ],
        });
    });
});
