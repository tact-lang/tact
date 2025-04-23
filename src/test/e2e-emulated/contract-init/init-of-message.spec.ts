import { toNano } from "@ton/core";
import type { SandboxContract, TreasuryContract } from "@ton/sandbox";
import { Blockchain } from "@ton/sandbox";
import type { InitData } from "./output/init-of-message_Test";
import { Test } from "./output/init-of-message_Test";
import "@ton/test-utils";

describe("init-of-message", () => {
    let blockchain: Blockchain;
    let treasury: SandboxContract<TreasuryContract>;
    let contract: SandboxContract<Test>;

    beforeEach(async () => {
        blockchain = await Blockchain.create();
        blockchain.verbosity.print = false;
        treasury = await blockchain.treasury("treasury");

        const msg: InitData = {
            $$type: "InitData",
            seller: treasury.address,
            nonce: 0n,
        };
        contract = blockchain.openContract(await Test.fromInit(msg));

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

    it("should deploy when given a message as init", async () => {});
});
