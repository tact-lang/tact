import fs from "fs";
import { join } from "path";
import { AstRenamer } from "../src/050-grammar/rename";
import { prettyPrint } from "../src/prettyPrinter";
import { trimTrailingCR, CONTRACTS_DIR } from "./util";
import * as assert from "assert";
import { getParser } from "../src/050-grammar";
import { getAstFactory } from "../src/050-grammar/ast";
import { defaultParser } from "../src/050-grammar/grammar";

const EXPECTED_DIR = join(CONTRACTS_DIR, "renamer-expected");

describe("renamer", () => {
    it.each(fs.readdirSync(CONTRACTS_DIR, { withFileTypes: true }))(
        "should have an expected content after being renamed",
        (dentry) => {
            if (!dentry.isFile()) {
                return;
            }
            const ast = getAstFactory();
            const { parse } = getParser(ast, defaultParser);
            const expectedFilePath = join(EXPECTED_DIR, dentry.name);
            const expected = fs.readFileSync(expectedFilePath, "utf-8");
            const filePath = join(CONTRACTS_DIR, dentry.name);
            const src = fs.readFileSync(filePath, "utf-8");
            const inAst = parse(src, filePath, "user");
            const outAst = AstRenamer.make().renameModule(inAst);
            const got = prettyPrint(outAst);
            assert.strictEqual(
                trimTrailingCR(got),
                trimTrailingCR(expected),
                `AST comparison after renamed failed for ${dentry.name}`,
            );
        },
    );
});
