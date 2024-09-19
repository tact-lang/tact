import { toNano } from "@ton/core";
import { Blockchain, SandboxContract, TreasuryContract } from "@ton/sandbox";
import { LaikaContract } from "./contracts/output/traits_LaikaContract";
import "@ton/test-utils";

describe("traits", () => {
    let blockchain: Blockchain;
    let treasure: SandboxContract<TreasuryContract>;
    let contract: SandboxContract<LaikaContract>;

    beforeEach(async () => {
        blockchain = await Blockchain.create();
        blockchain.verbosity.print = false;
        treasure = await blockchain.treasury("treasure");

        contract = blockchain.openContract(await LaikaContract.fromInit());

        const deployResult = await contract.send(
            treasure.getSender(),
            { value: toNano("0.5") },
            null,
        );

        expect(deployResult.transactions).toHaveTransaction({
            from: treasure.address,
            to: contract.address,
            success: true,
            deploy: true,
        });
    });

    it("should implement traits correctly", async () => {
        // Check the contract's behavior after deployment
        expect(await contract.getSay()).toBe("I am a Laika and I say Woof");
    });
});
