import fs from "fs";
import { __DANGER_resetNodeId } from "../grammar/ast";
import { prettyPrint } from "../prettyPrinter";
import { parse } from "../grammar/grammar";
import { join } from "path";
import JSONBig from "json-bigint";

describe("formatter", () => {
    it.each(fs.readdirSync(join(__dirname, "formatting", "proper")))(
        "shouldn't change proper formatting",
        (file) => {
            const filePath = join(__dirname, "formatting", "proper", file);
            const src = fs.readFileSync(filePath, "utf-8");
            const ast = parse(src, filePath, "user");
            const formatted = prettyPrint(ast);
            expect(formatted).toEqual(src);
        },
    );
    const outputDir = join(__dirname, "formatting", "output");
    fs.mkdirSync(outputDir, { recursive: true });
    it.each(fs.readdirSync(join(__dirname, "formatting", "proper")))(
        "shouldn't change AST",
        (file) => {
            const filePath = join(__dirname, "formatting", "proper", file);
            const src = fs.readFileSync(filePath, "utf-8");
            const ast = parse(src, filePath, "user");
            //TODO: change for proper recursive removal
            const astStr = JSONBig.stringify(ast).replace(/"id":[0-9]+,/g, "");

            const formatted = prettyPrint(ast);
            const fileName = join(outputDir, file);
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
