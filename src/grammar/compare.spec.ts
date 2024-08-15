import fs from "fs";
import { __DANGER_resetNodeId } from "../grammar/ast";
import { parse } from "../grammar/grammar";
import { join } from "path";
import { AstComparator } from "./compare";
import * as assert from "assert";

const TEST_DIR = join(__dirname, "..", "test", "contracts");

describe("comparator", () => {
    it.each(fs.readdirSync(TEST_DIR, { withFileTypes: true }))(
        "AST modules of the same file must be equal",
        (dentry) => {
            if (!dentry.isFile()) {
                return;
            }
            const filePath = join(TEST_DIR, dentry.name);
            const src = fs.readFileSync(filePath, "utf-8");
            const ast1 = parse(src, filePath, "user");
            const ast2 = parse(src, filePath, "user");
            assert.strictEqual(
                AstComparator.make().compare(ast1, ast2),
                true,
                `The AST comparison failed for ${dentry.name}`,
            );
        },
    );
});
