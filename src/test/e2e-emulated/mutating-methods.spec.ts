import { beginCell, BitString, Dictionary, toNano } from "@ton/core";
import { Blockchain, SandboxContract, TreasuryContract } from "@ton/sandbox";
import { Tester } from "./contracts/output/mutating-methods_Tester";
import "@ton/test-utils";

describe("bugs", () => {
    let blockchain: Blockchain;
    let treasure: SandboxContract<TreasuryContract>;
    let contract: SandboxContract<Tester>;

    beforeEach(async () => {
        blockchain = await Blockchain.create();
        blockchain.verbosity.print = false;
        treasure = await blockchain.treasury("treasure");

        contract = blockchain.openContract(await Tester.fromInit());

        const deployResult = await contract.send(
            treasure.getSender(),
            { value: toNano("10") },
            null,
        );

        expect(deployResult.transactions).toHaveTransaction({
            from: treasure.address,
            to: contract.address,
            success: true,
            deploy: true,
        });
    });

    it("should implement mutating method chaining correctly", async () => {
        // Ensure initial transaction works as expected
        const initialResult = await contract.send(
            treasure.getSender(),
            { value: toNano("1") },
            null,
        );

        expect(initialResult.transactions).toHaveTransaction({
            from: treasure.address,
            to: contract.address,
            success: true,
        });

        // Check contract methods
        expect(await contract.getTest1()).toBe(0n);
        expect(await contract.getTest2()).toBe(0n);
        expect(await contract.getTest3()).toBe(6n);
        expect(await contract.getTest4()).toBe(24n);
        expect(await contract.getTest5()).toBe(97n);
        expect(await contract.getTest7()).toBe(42n);
        expect(await contract.getTest8()).toBe(5n);
        expect(await contract.getTest9()).toBe(5n);

        // Test `extends mutates` function with optional self param
        {
            // Non-empty dictionary
            const d = Dictionary.empty(
                Dictionary.Keys.Uint(8),
                Dictionary.Values.BitString(12),
            );
            d.set(1, new BitString(Buffer.from("1234", "hex"), 0, 12));
            const c = beginCell().storeDictDirect(d).endCell();
            const c2 = await contract.getTest10(c);
            const d2 = c2
                ?.beginParse()
                .loadDictDirect(
                    Dictionary.Keys.Uint(8),
                    Dictionary.Values.BitString(12),
                );
            expect(d2?.size).toBe(2);
            expect(d2?.get(1)?.toString()).toBe("123");
            expect(d2?.get(123)?.toString()).toBe("456");
        }
        {
            // Empty dictionary
            const c = await contract.getTest10(null);
            const d = c
                ?.beginParse()
                .loadDictDirect(
                    Dictionary.Keys.Uint(8),
                    Dictionary.Values.BitString(12),
                );
            expect(d?.size).toBe(1);
            expect(d?.get(123)?.toString()).toBe("456");
        }

        expect(await contract.getTest11(1n)).toBe(6n);
        expect(await contract.getTest11(2n)).toBe(12n);
    });
});
