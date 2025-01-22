import { glob, readFile, writeFile } from "fs/promises";
import { parse, ParserOptions } from "@babel/parser";
import generate from "@babel/generator";
import { dirname, extname, join, relative, resolve } from "path";
import * as t from "@babel/types";

const main = async () => {
    for await (const file of glob("./dist/**/*.{js,ts}")) {
        const fullPath = join(__dirname, file);
        const source = await readFile(fullPath, "utf-8");
        const options: ParserOptions =
            extname(file) === ".ts"
                ? {
                      sourceType: "module",
                      plugins: ["typescript"],
                  }
                : {
                      sourceType: "script",
                  };
        const ast = parse(source, options);
        let wasChanged = false;
        for (const node of ast.program.body) {
            if (t.isVariableDeclaration(node)) {
                const declaration = node.declarations[0];
                if (node.declarations.length !== 1 || !declaration) {
                    continue;
                }
                const init = declaration.init;
                if (!t.isCallExpression(init)) {
                    continue;
                }
                const callee = init.callee;
                if (!t.isIdentifier(callee) || callee.name !== "require") {
                    continue;
                }
                const importLiteral = init.arguments[0];
                if (init.arguments.length !== 1 || !importLiteral) {
                    return;
                }
                if (!t.isStringLiteral(importLiteral)) {
                    return;
                }
                if (transformLiteral(fullPath, importLiteral)) {
                    wasChanged = true;
                }
            } else if (t.isImportDeclaration(node)) {
                if (transformLiteral(fullPath, node.source)) {
                    wasChanged = true;
                }
            }
        }
        if (wasChanged) {
            await writeFile(
                fullPath,
                generate(ast, {
                    retainLines: true,
                    comments: true,
                }).code,
            );
        }
    }
};

const transformLiteral = (fullPath: string, importLiteral: t.StringLiteral) => {
    const importedName = importLiteral.value;
    if (!importedName.startsWith("@/")) {
        return false;
    }
    const result = relative(
        dirname(fullPath),
        join(__dirname, "dist", importedName.substring(2)),
    );
    importLiteral.value = !result.startsWith(".") ? "./" + result : result;
    return true;
};

void main();
