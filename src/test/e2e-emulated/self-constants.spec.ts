import { toNano } from "@ton/core";
import { Blockchain, SandboxContract, TreasuryContract } from "@ton/sandbox";
import { ConstantTester } from "./contracts/output/self-constants_ConstantTester";
import "@ton/test-utils";

describe("self-constants", () => {
    let blockchain: Blockchain;
    let treasure: SandboxContract<TreasuryContract>;
    let contract: SandboxContract<ConstantTester>;

    beforeEach(async () => {
        blockchain = await Blockchain.create();
        blockchain.verbosity.print = false;
        treasure = await blockchain.treasury("treasure");

        contract = blockchain.openContract(await ConstantTester.fromInit());

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

    it("should implement self constants correctly", async () => {
        expect(await contract.getB()).toEqual(42n);
        expect(await contract.getC2()).toEqual(51n);
        expect(await contract.getValue()).toEqual(60n);
        expect(await contract.getTraitB()).toEqual(42n);
        expect(await contract.getTraitC2()).toEqual(51n);
    });
});
