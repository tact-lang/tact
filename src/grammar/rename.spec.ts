import fs from "fs";
import { __DANGER_resetNodeId } from "../grammar/ast";
import { parse } from "../grammar/grammar";
import { join } from "path";
import { AstRenamer } from "./rename";
import { prettyPrint } from "../prettyPrinter";
import * as assert from "assert";

const TEST_DIR = join(__dirname, "..", "test", "contracts");
const EXPECTED_DIR = join(TEST_DIR, "renamer-expected");

function trimTrailingCR(input: string): string {
    return input.replace(/\n+$/, "");
}

describe("renamer", () => {
    it.each(fs.readdirSync(TEST_DIR, { withFileTypes: true }))(
        "should have an expected content after being renamed",
        (dentry) => {
            if (!dentry.isFile()) {
                return;
            }
            const expectedFilePath = join(EXPECTED_DIR, dentry.name);
            const expected = fs.readFileSync(expectedFilePath, "utf-8");
            const filePath = join(TEST_DIR, dentry.name);
            const src = fs.readFileSync(filePath, "utf-8");
            const inAst = parse(src, filePath, "user");
            const outAst = AstRenamer.make().rename(inAst);
            const got = prettyPrint(outAst);
            assert.strictEqual(
                trimTrailingCR(got),
                trimTrailingCR(expected),
                `AST comparison after renamed failed for ${dentry.name}`,
            );
        },
    );
});
