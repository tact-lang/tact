import { toNano } from "@ton/core";
import type { SandboxContract, TreasuryContract } from "@ton/sandbox";
import { Blockchain } from "@ton/sandbox";
import { TestStorage } from "./output/contract-nested-struct_TestStorage";
import "@ton/test-utils";

describe("contract nested struct field", () => {
    let blockchain: Blockchain;
    let treasury: SandboxContract<TreasuryContract>;
    let contract: SandboxContract<TestStorage>;

    beforeEach(async () => {
        blockchain = await Blockchain.create();
        blockchain.verbosity.print = false;
        treasury = await blockchain.treasury("treasury");
        contract = blockchain.openContract(await TestStorage.fromInit());

        const result = await contract.send(
            treasury.getSender(),
            {
                value: toNano("10"),
            },
            null,
        );

        expect(result.transactions).toHaveTransaction({
            from: treasury.address,
            to: contract.address,
            success: true,
            deploy: true,
        });
    });

    it("should return value correctly", async () => {
        expect(await contract.getVal()).toMatchObject({
            foo: 1n,
            inner: {
                bar: false,
                text: "",
            },
        });
    });
});
