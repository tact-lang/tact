import { beginCell, toNano } from "@ton/core";
import type { SandboxContract, TreasuryContract } from "@ton/sandbox";
import { Blockchain } from "@ton/sandbox";
import { AsmFunctionsTester as TestContract } from "./contracts/output/asm-functions_AsmFunctionsTester";
import "@ton/test-utils";

describe("asm functions", () => {
    let blockchain: Blockchain;
    let treasure: SandboxContract<TreasuryContract>;
    let contract: SandboxContract<TestContract>;

    beforeEach(async () => {
        blockchain = await Blockchain.create();
        blockchain.verbosity.print = false;
        treasure = await blockchain.treasury("treasure");

        contract = blockchain.openContract(await TestContract.fromInit());

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

    it("should implement asm functions correctly", async () => {
        expect(await contract.getTestAsmStoreDict()).toEqual(true);
        expect(await contract.getTestAsmLoadCoins()).toEqual(true);
        expect(await contract.getTestAsmLoadCoinsMut()).toEqual(true);
        expect(
            await contract.getTestAsmLoadCoinsMutRuntime(
                beginCell().storeCoins(42n).endCell(),
            ),
        ).toEqual(42n);
        expect(await contract.getTestAsmLoadInt()).toEqual(true);
        expect(await contract.getTestAsmDebugStr()).toEqual(true);
        expect(await contract.getTestAsmCreateUseWord()).toEqual(true);

        // Struct arrangements
        expect(await contract.getTestAsmSecondToLast()).toEqual(true);
        expect(
            await contract.getTestAsmSecondToLastRuntime(
                { $$type: "Two", a: 1n, b: 2n },
                { $$type: "Two", a: 3n, b: 4n },
            ),
        ).toEqual(3n);
        expect(await contract.getTestAsmFirst()).toEqual(true);
        expect(
            await contract.getTestAsmFirstRuntime(
                {
                    $$type: "TwoInTwo",
                    a: { $$type: "Two", a: 1n, b: 2n },
                    b: { $$type: "Two", a: 3n, b: 4n },
                },
                {
                    $$type: "TwoInTwo",
                    a: { $$type: "Two", a: 5n, b: 6n },
                    b: { $$type: "Two", a: 7n, b: 8n },
                },
                {
                    $$type: "TwoInTwo",
                    a: { $$type: "Two", a: 9n, b: 10n },
                    b: { $$type: "Two", a: 11n, b: 12n },
                },
            ),
        ).toEqual(1n);
    });
});
