import fs from "fs";
import { getParser } from "../grammar";
import { join } from "path";
import { AstComparator } from "../ast/compare";
import { CONTRACTS_DIR } from "./util";
import * as assert from "assert";
import { getAstFactory } from "../ast/ast-helpers";
import { defaultParser } from "../grammar/grammar";

describe("comparator", () => {
    it.each(fs.readdirSync(CONTRACTS_DIR, { withFileTypes: true }))(
        "AST modules of the same file must be equal",
        (dentry) => {
            if (!dentry.isFile()) {
                return;
            }
            const path = join(CONTRACTS_DIR, dentry.name);
            const code = fs.readFileSync(path, "utf-8");
            const Ast = getAstFactory();
            const { parse } = getParser(Ast, defaultParser);
            const ast1 = parse({ code, path, origin: "user" });
            const ast2 = parse({ code, path, origin: "user" });
            assert.strictEqual(
                AstComparator.make().compare(ast1, ast2),
                true,
                `The AST comparison failed for ${dentry.name}`,
            );
        },
    );
});
