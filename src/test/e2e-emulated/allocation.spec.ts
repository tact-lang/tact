import { toNano } from "@ton/core";
import { Blockchain, SandboxContract, TreasuryContract } from "@ton/sandbox";
import { Test } from "./contracts/output/allocation_Test";
import "@ton/test-utils";

describe("allocation", () => {
    let blockchain: Blockchain;
    let owner: SandboxContract<TreasuryContract>;
    let contract: SandboxContract<Test>;

    beforeEach(async () => {
        blockchain = await Blockchain.create();
        owner = await blockchain.treasury("owner");

        contract = blockchain.openContract(
            await Test.fromInit(owner.address, {
                $$type: "Struct2",
                c: "",
                d: "",
                e: "",
                f: "",
            }),
        );

        const deployResult = await contract.send(
            owner.getSender(),
            {
                value: toNano(1),
            },
            { $$type: "Deploy", queryId: 0n },
        );

        expect(deployResult.transactions).toHaveTransaction({
            from: owner.address,
            to: contract.address,
            success: true,
            deploy: true,
        });
    });

    it("should deploy correctly and process SetCost message without cell overflow", async () => {
        const setCostResult = await contract.send(
            owner.getSender(),
            { value: toNano(1) },
            { $$type: "SetCost", cost: toNano("0.1") },
        );

        expect(setCostResult.transactions).toHaveTransaction({
            from: owner.address,
            to: contract.address,
            success: true,
        });
    });
});
