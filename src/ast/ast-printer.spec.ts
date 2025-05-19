import fs from "fs";
import { prettyPrint } from "@/ast/ast-printer";
import { getParser } from "@/grammar";
import { join } from "path";
import * as assert from "assert";
import { getAstFactory } from "@/ast/ast-helpers";
import { attachment, step } from "@/test/allure/allure";
import { ContentType } from "allure-js-commons";

const contractsDir = join(__dirname, "contracts");

const stringify = (obj: unknown): string => {
    return JSON.stringify(obj, (key, value) =>
        typeof value === "bigint" ? value.toString() : value,
    );
};

function trimTrailingCR(input: string): string {
    return input.replace(/\n+$/, "");
}

const contracts = fs
    .readdirSync(contractsDir, { withFileTypes: true })
    .flatMap((dentry) => {
        if (!dentry.isFile()) {
            return [];
        }
        return [[dentry.name, join(contractsDir, dentry.name)] as const];
    });

describe.each(contracts)("%s", (_, path) => {
    it("shouldn't change proper formatting", () => {
        const Ast = getAstFactory();
        const { parse } = getParser(Ast);
        const code = trimTrailingCR(fs.readFileSync(path, "utf-8"));
        const ast = parse({ code, path, origin: "user" });
        const formatted = trimTrailingCR(prettyPrint(ast));
        assert.strictEqual(
            formatted,
            code,
            `The formatted AST comparison failed for ${path}`,
        );
    });

    it("shouldn't change AST", async () => {
        const Ast = getAstFactory();
        const { parse } = getParser(Ast);
        const code = fs.readFileSync(path, "utf-8");
        const ast = parse({ code, path, origin: "user" });
        await attachment("Code", code, ContentType.TEXT);

        //TODO: change for proper recursive removal
        const astStr = stringify(ast).replace(/"id":[0-9]+,/g, "");

        const formattedCode = prettyPrint(ast);
        const astFormatted = parse({
            code: formattedCode,
            path,
            origin: "user",
        });

        await attachment("Formatted code", formattedCode, ContentType.TEXT);
        await attachment("AST of Code", astStr, ContentType.JSON);

        //TODO: change for proper recursive removal
        const astFormattedStr = stringify(astFormatted).replace(
            /"id":[0-9]+,/g,
            "",
        );
        await attachment(
            "AST of Formatted Code",
            astFormattedStr,
            ContentType.JSON,
        );
        await step("AST string should be equal", () => {
            expect(astFormattedStr).toEqual(astStr);
        });
    });
});
