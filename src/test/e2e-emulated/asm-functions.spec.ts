import { toNano } from "@ton/core";
import { Blockchain, SandboxContract, TreasuryContract } from "@ton/sandbox";
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
        expect(await contract.getTestAsmLoadInt()).toEqual(true);
        expect(await contract.getTestAsmDebugStr()).toEqual(true);
    });
});
