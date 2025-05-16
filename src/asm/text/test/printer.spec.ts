import { ADD, decompileCell, PUSHINT } from "@/asm/runtime";
import { print } from "@/asm/text/printer";
import { readFileSync } from "node:fs";
import { boc } from "@/asm/runtime/util";
import { step } from "@/test/allure/allure";

describe("assembly-printer", () => {
    it("should print simple assembly", async () => {
        const instructions = [PUSHINT(10), PUSHINT(5), ADD()];

        await step("Instructions should match snapshot", () => {
            expect(print(instructions)).toMatchSnapshot();
        });
    });

    it("should print assembly", async () => {
        const instructions = decompileCell(
            boc(
                readFileSync(
                    `${__dirname}/testdata/jetton_minter_discoverable_JettonMinter.boc`,
                ).toString("hex"),
            ).asCell(),
        );

        await step("Instructions should match snapshot", () => {
            expect(print(instructions)).toMatchSnapshot();
        });
    });
});
