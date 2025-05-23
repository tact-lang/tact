import { toNano } from "@ton/core";
import type { SandboxContract, TreasuryContract } from "@ton/sandbox";
import { Blockchain } from "@ton/sandbox";
import { UnderscoreVariableTestContract } from "./output/underscore-variable_UnderscoreVariableTestContract";
import "@ton/test-utils";

describe("underscore-variable", () => {
    let blockchain: Blockchain;
    let treasury: SandboxContract<TreasuryContract>;
    let contract: SandboxContract<UnderscoreVariableTestContract>;

    beforeEach(async () => {
        blockchain = await Blockchain.create();
        blockchain.verbosity.print = false;
        treasury = await blockchain.treasury("treasury");

        contract = blockchain.openContract(
            await UnderscoreVariableTestContract.fromInit(),
        );

        const deployResult = await contract.send(
            treasury.getSender(),
            { value: toNano("10") },
            null,
        );

        expect(deployResult.transactions).toHaveTransaction({
            from: treasury.address,
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
