import fs from "fs";
import { __DANGER_resetNodeId } from "../grammar/ast";
import { prettyPrint } from "../prettyPrinter";
import { parse } from "../grammar/grammar";
import { join } from "path";
import * as assert from "assert";
import JSONBig from "json-bigint";

const TEST_DIR = join(__dirname, "contracts");

function trimTrailingCR(input: string): string {
    return input.replace(/\n+$/, "");
}

describe("formatter", () => {
    it.each(fs.readdirSync(TEST_DIR, { withFileTypes: true }))(
        "shouldn't change proper formatting",
        (dentry) => {
            if (!dentry.isFile()) {
                return;
            }
            const filePath = join(TEST_DIR, dentry.name);
            const src = trimTrailingCR(fs.readFileSync(filePath, "utf-8"));
            const ast = parse(src, filePath, "user");
            const formatted = trimTrailingCR(prettyPrint(ast));
            assert.strictEqual(
                formatted,
                src,
                `The formatted AST comparison failed for ${dentry.name}`,
            );
        },
    );

    const outputDir = join(TEST_DIR, "pretty-printer-output");
    fs.mkdirSync(outputDir, { recursive: true });
    it.each(fs.readdirSync(TEST_DIR, { withFileTypes: true }))(
        "shouldn't change AST",
        (dentry) => {
            if (!dentry.isFile()) {
                return;
            }
            const filePath = join(TEST_DIR, dentry.name);
            const src = fs.readFileSync(filePath, "utf-8");
            const ast = parse(src, filePath, "user");
            //TODO: change for proper recursive removal
            const astStr = JSONBig.stringify(ast).replace(/"id":[0-9]+,/g, "");

            const formatted = prettyPrint(ast);
            const fileName = join(outputDir, dentry.name);
            fs.openSync(fileName, "w");
            fs.writeFileSync(fileName, formatted, { flag: "w" });
            const astFormatted = parse(formatted, fileName, "user");
            //TODO: change for proper recursive removal
            const astFormattedStr = JSONBig.stringify(astFormatted).replace(
                /"id":[0-9]+,/g,
                "",
            );
            expect(astFormattedStr).toEqual(astStr);
        },
    );
});
