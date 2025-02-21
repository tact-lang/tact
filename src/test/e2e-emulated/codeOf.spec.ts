import { toNano } from "@ton/core";
import type { SandboxContract, TreasuryContract } from "@ton/sandbox";
import { Blockchain } from "@ton/sandbox";
import { CodeOfTester } from "./contracts/output/codeOf_CodeOfTester";
import { ChildContract } from "./contracts/output/codeOf_ChildContract";
import "@ton/test-utils";

describe("codeOf", () => {
    let blockchain: Blockchain;
    let treasure: SandboxContract<TreasuryContract>;
    let contract: SandboxContract<CodeOfTester>;
    let childContract: SandboxContract<ChildContract>;

    beforeEach(async () => {
        blockchain = await Blockchain.create();
        blockchain.verbosity.print = false;
        treasure = await blockchain.treasury("treasure");
        contract = blockchain.openContract(await CodeOfTester.fromInit());
        childContract = blockchain.openContract(await ChildContract.fromInit());

        const result = await contract.send(
            treasure.getSender(),
            {
                value: toNano("10"),
            },
            null, // No specific message, sending a basic transfer
        );

        expect(result.transactions).toHaveTransaction({
            from: treasure.address,
            to: contract.address,
            success: true,
            deploy: true,
        });
    });

    it("should get self code correctly", async () => {
        const init = contract.init;
        if (!init) throw new Error("contract.init is undefined");

        expect((await contract.getSelfCode()).toString()).toEqual(
            init.code.toString(),
        );
    });

    it("should get child contract code correctly", async () => {
        const childInit = childContract.init;
        if (!childInit) throw new Error("childContract.init is undefined");

        expect((await contract.getChildCode()).toString()).toEqual(
            childInit.code.toString(),
        );
    });
});
