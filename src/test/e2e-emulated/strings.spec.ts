import { beginCell, toNano } from "@ton/core";
import { ContractSystem } from "@tact-lang/emulator";
import { __DANGER_resetNodeId } from "../../grammar/ast";
import { StringsTester } from "./contracts/output/strings_StringsTester";

describe("strings", () => {
    beforeEach(() => {
        __DANGER_resetNodeId();
    });
    it("should implement strings correctly", async () => {
        // Init
        const system = await ContractSystem.create();
        const treasure = system.treasure("treasure");
        const contract = system.open(await StringsTester.fromInit());
        await contract.send(treasure, { value: toNano("10") }, null);
        await system.run();

        expect(contract.abi.errors!["31733"]!.message).toStrictEqual(
            "condition can`t be...",
        );

        // Check methods
        expect(await contract.getConstantString()).toBe("test string");
        expect(await contract.getConstantStringUnicode()).toBe("привет мир 👀");
        const l =
            "привет мир 👀 привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀";
        expect(await contract.getConstantStringUnicodeLong()).toBe(l);
        expect(
            (await contract.getDynamicStringCell()).equals(
                beginCell().storeStringTail("Hello!").endCell(),
            ),
        ).toBe(true);
        expect(
            (await contract.getDynamicStringCell2()).equals(
                beginCell().storeStringTail("Hello, World!").endCell(),
            ),
        ).toBe(true);
        expect(
            (await contract.getDynamicCommentCell()).equals(
                beginCell()
                    .storeUint(0, 32)
                    .storeStringTail("Something something world!")
                    .endCell(),
            ),
        ).toBe(true);
        const l2 =
            "Hello!привет мир 👀 привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀";
        expect(
            (await contract.getDynamicCommentCellLarge()).equals(
                beginCell().storeStringTail(l2).endCell(),
            ),
        ).toBe(true);
        expect(await contract.getDynamicCommentStringLarge()).toEqual(l2);
        expect(await contract.getStringWithNumber()).toEqual(
            "Hello, your balance: 123",
        );
        expect(await contract.getStringWithLargeNumber()).toEqual(
            "Hello, your balance: 1000000000000000000000000000000000000000000000000000000000000",
        );
        expect(await contract.getStringWithNegativeNumber()).toEqual(
            "Hello, your balance: -123",
        );
        expect(await contract.getStringWithFloat()).toEqual("9.5");

        const base = await contract.getBase64();
        expect(
            base
                .beginParse()
                .loadBuffer(base.bits.length / 8)
                .toString(),
        ).toEqual("Many hands make light work.");

        const b64cases = [
            "SGVsbG8gV29ybGQ=",
            "li7dzDacuo67Jg7mtqEm2TRuOMU=",
            "FKIhdgaG5LGKiEtF1vHy4f3y700zaD6QwDS3IrNVGzNp2rY+1LFWTK6D44AyiC1n8uWz1itkYMZF0/aKDK0Yjg==",
            "AA==",
        ];
        for (const b of b64cases) {
            const s = Buffer.from(b, "base64");
            const r = await contract.getProcessBase64(b);
            const d = r.beginParse().loadBuffer(r.bits.length / 8);
            expect(d.toString("hex")).toEqual(s.toString("hex"));
        }

        expect(await contract.getStringWithEscapedChars1()).toBe(
            'test \n \n \\ \\\n "string"',
        );
        expect(await contract.getStringWithEscapedChars2()).toEqual(
            'test \n test \t test \r test \b test \f test " test \' test \\ \\\\ "_" "" test',
        );
        expect(await contract.getStringWithEscapedChars3()).toEqual(
            'test \\n test \\t test \\r test \\\\b\b test \\f test \\" test \\\' test \v \v \\\\ \\\\\\\\ \\"_\\" \\"\\" test',
        );
        expect(await contract.getStringWithEscapedChars4()).toEqual(
            "\u{2028}\u{2029} \u0044 \x41\x42\x43",
        );

        expect(await contract.getStringWithAddress()).toEqual(
            "EQBKgXCNLPexWhs2L79kiARR1phGH1LwXxRbNsCFF9doc2lN",
        );
    });
});
