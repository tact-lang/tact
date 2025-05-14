import { beginCell, toNano } from "@ton/core";
import type { SandboxContract, TreasuryContract } from "@ton/sandbox";
import { Blockchain } from "@ton/sandbox";
import { Test } from "./output/serialization_Test";
import "@ton/test-utils";

describe("serialization", () => {
    let blockchain: Blockchain;
    let treasury: SandboxContract<TreasuryContract>;
    let contract: SandboxContract<Test>;

    beforeEach(async () => {
        blockchain = await Blockchain.create();
        blockchain.verbosity.print = false;
        treasury = await blockchain.treasury("treasury");

        contract = blockchain.openContract(await Test.fromInit());

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

        const result = await contract.send(
            treasury.getSender(),
            { value: toNano("10") },
            {
                $$type: "Foo",
                slice: beginCell().asSlice(),
                builder: null,
                string: "null",
            },
        );

        expect(result.transactions).toHaveTransaction({
            success: true,
        });
    });

    it("should deploy", () => {});
});
