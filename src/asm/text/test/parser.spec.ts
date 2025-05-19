import { decompileCell } from "@/asm/runtime";
import { print } from "@/asm/text/printer";
import { readFileSync } from "node:fs";
import { parse } from "@/asm/text/parse";
import { boc } from "@/asm/runtime/util";
import { attachment, step } from "@/test/allure/allure";
import { ContentType } from "allure-js-commons";

describe("assembly-parser", () => {
    it("should parse simple assembly", async () => {
        const code = `
            PUSHINT 10
            PUSHINT 5
            ADD
        `;
        await attachment("Code", code, ContentType.TEXT);
        const res = parse("test.asm", code);
        if (res.$ === "ParseFailure") {
            throw new Error("unexpected parser error");
        }
        await step("Instructions should match snapshot", () => {
            expect(print(res.instructions)).toMatchSnapshot();
        });
    });

    it("should parse assembly with raw pushref", async () => {
        const code = `
            PUSHREF x{71}
        `;
        await attachment("Code", code, ContentType.TEXT);
        const res = parse("test.asm", code);
        if (res.$ === "ParseFailure") {
            throw new Error("unexpected parser error");
        }

        await step("Instructions should match snapshot", () => {
            expect(print(res.instructions)).toMatchSnapshot();
        });
    });

    it("should parse assembly with invalid raw pushref", async () => {
        const code = `
            PUSHREF x{22221}
        `;
        await attachment("Code", code, ContentType.TEXT);
        const res = parse("test.asm", code);
        if (res.$ === "ParseFailure") {
            throw new Error("unexpected parser error");
        }

        await step("Instructions should match snapshot", () => {
            expect(print(res.instructions)).toMatchSnapshot();
        });
    });

    it("should parse and print assembly", async () => {
        const instructions = decompileCell(
            boc(
                readFileSync(
                    `${__dirname}/testdata/jetton_minter_discoverable_JettonMinter.boc`,
                ).toString("hex"),
            ).asCell(),
        );
        const assembly = print(instructions);

        const res = parse("test.asm", assembly);
        if (res.$ === "ParseFailure") {
            throw new Error("unexpected parser error");
        }

        const assembly2 = print(res.instructions);

        await attachment("Decompiled Assembly", assembly, ContentType.TEXT);
        await attachment(
            "Parsed and Re-Printed Assembly",
            assembly2,
            ContentType.TEXT,
        );

        await step("Should match decompiled and re-parsed assembly", () => {
            expect(assembly2).toEqual(assembly);
        });
    });

    it("should not parse assembly with error", async () => {
        const code = `
            PUSHINT 10 ,
            PUSHINT 5
            ADD
        `;
        await attachment("Code", code, ContentType.TEXT);
        const res = parse("test.asm", code);
        if (res.$ === "ParseSuccess") {
            throw new Error("unexpected parser success");
        }

        await step("Should produce parse error", () => {
            expect(res.error.toString()).toMatchSnapshot();
        });
    });

    it("should give an error for malformed assembly", async () => {
        const code = `
            PUSHINT // no arg
            PUSHINT 5
            ADD
        `;
        await attachment("Code", code, ContentType.TEXT);
        const res = parse("test.asm", code);
        if (res.$ === "ParseSuccess") {
            throw new Error("unexpected parser success");
        }

        await step("Should produce parse error", () => {
            expect(res.error.toString()).toMatchSnapshot();
        });
    });
});
