import fs from "fs";
import { __DANGER_resetNodeId } from "../grammar/ast";
import { parse } from "../grammar/grammar";
import { join } from "path";
import { AstRenamer } from "../grammar/rename";
import { prettyPrint } from "../prettyPrinter";
import { trimTrailingCR, CONTRACTS_DIR } from "./util";
import * as assert from "assert";

const EXPECTED_DIR = join(CONTRACTS_DIR, "renamer-expected");

describe("renamer", () => {
    it.each(fs.readdirSync(CONTRACTS_DIR, { withFileTypes: true }))(
        "should have an expected content after being renamed",
        (dentry) => {
            if (!dentry.isFile()) {
                return;
            }
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
