import { toNano } from "@ton/core";
import { Blockchain, SandboxContract, TreasuryContract } from "@ton/sandbox";
import { Test } from "./contracts/output/contract-with-init-init-parameter_Test";
import "@ton/test-utils";

describe("contract-with-init-init-parameter", () => {
    let blockchain: Blockchain;
    let treasure: SandboxContract<TreasuryContract>;
    let contract: SandboxContract<Test>;

    beforeEach(async () => {
        blockchain = await Blockchain.create();
        blockchain.verbosity.print = false;
        treasure = await blockchain.treasury("treasure");

        contract = blockchain.openContract(
            await Test.fromInit({
                $$type: "Init",
                foo: 99n,
            }),
        );

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

    it("should return correct result", async () => {
        expect(await contract.getData()).toBe(99n);
    });
});
