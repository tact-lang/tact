import fs from "fs";
import { getParser } from "../grammar";
import { join } from "path";
import { AstComparator } from "../grammar/compare";
import { CONTRACTS_DIR } from "./util";
import * as assert from "assert";
import { getAstFactory } from "../grammar/ast";

describe("comparator", () => {
    it.each(fs.readdirSync(CONTRACTS_DIR, { withFileTypes: true }))(
        "AST modules of the same file must be equal",
        (dentry) => {
            if (!dentry.isFile()) {
                return;
            }
            const filePath = join(CONTRACTS_DIR, dentry.name);
            const src = fs.readFileSync(filePath, "utf-8");
            const Ast = getAstFactory();
            const { parse } = getParser(Ast);
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
