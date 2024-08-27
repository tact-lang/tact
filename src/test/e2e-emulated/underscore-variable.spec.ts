import { toNano } from "@ton/core";
import { Blockchain, SandboxContract, TreasuryContract } from "@ton/sandbox";
import { UnderscoreVariableTestContract } from "./contracts/output/underscore-variable_UnderscoreVariableTestContract";
import "@ton/test-utils";

describe("underscore-variable", () => {
    let blockchain: Blockchain;
    let treasure: SandboxContract<TreasuryContract>;
    let contract: SandboxContract<UnderscoreVariableTestContract>;

    beforeEach(async () => {
        blockchain = await Blockchain.create();
        treasure = await blockchain.treasury("treasure");

        contract = blockchain.openContract(
            await UnderscoreVariableTestContract.fromInit(),
        );

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

    it("should implement underscore variables correctly", async () => {
        // Check methods
        expect(await contract.getTest1()).toEqual(0n);
        expect(await contract.getTest2()).toEqual(12n);
        expect(await contract.getTest3()).toEqual(6n);
        expect(await contract.getTest4()).toEqual(4n);
    });
});
