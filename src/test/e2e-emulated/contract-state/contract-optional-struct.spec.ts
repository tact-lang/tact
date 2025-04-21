import { toNano } from "@ton/core";
import type { SandboxContract, TreasuryContract } from "@ton/sandbox";
import { Blockchain } from "@ton/sandbox";
import { TestGetterOptional } from "./output/contract-optional-struct_TestGetterOptional";
import { TestGetterOptional as TestGetterOptional2 } from "./output/contract-optional-struct-2_TestGetterOptional";
import { TestGetterOptional as TestGetterOptional3 } from "./output/contract-optional-struct-3_TestGetterOptional";
import "@ton/test-utils";

describe("contract optional struct field", () => {
    let blockchain: Blockchain;
    let treasury: SandboxContract<TreasuryContract>;
    let contract: SandboxContract<TestGetterOptional>;
    let contract2: SandboxContract<TestGetterOptional2>;
    let contract3: SandboxContract<TestGetterOptional3>;

    beforeEach(async () => {
        blockchain = await Blockchain.create();
        blockchain.verbosity.print = false;
        treasury = await blockchain.treasury("treasury");
        contract = blockchain.openContract(await TestGetterOptional.fromInit());
        contract2 = blockchain.openContract(
            await TestGetterOptional2.fromInit(),
        );
        contract3 = blockchain.openContract(
            await TestGetterOptional3.fromInit(),
        );

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

        const result2 = await contract2.send(
            treasury.getSender(),
            {
                value: toNano("10"),
            },
            null,
        );

        expect(result2.transactions).toHaveTransaction({
            from: treasury.address,
            to: contract2.address,
            success: true,
            deploy: true,
        });

        const result3 = await contract3.send(
            treasury.getSender(),
            {
                value: toNano("10"),
            },
            null,
        );

        expect(result3.transactions).toHaveTransaction({
            from: treasury.address,
            to: contract3.address,
            success: true,
            deploy: true,
        });
    });

    it("should return value correctly", async () => {
        expect(await contract.getS()).toMatchObject({ a: 1n, b: 2n });
        expect(await contract2.getS()).toMatchObject({
            a: 1n,
            b: 2n,
            c: { a: 10n },
        });
        expect(await contract3.getS()).toEqual(null);
    });
});
