import { toNano } from "@ton/core";
import type { SandboxContract, TreasuryContract } from "@ton/sandbox";
import { Blockchain } from "@ton/sandbox";
import { Test } from "./contracts/output/receiver-early-return_Test";
import "@ton/test-utils";

describe("receiver-early-return", () => {
    let blockchain: Blockchain;
    let treasure: SandboxContract<TreasuryContract>;
    let contract: SandboxContract<Test>;
    const amount = toNano("0.5");

    beforeEach(async () => {
        blockchain = await Blockchain.create();
        blockchain.verbosity.print = false;
        treasure = await blockchain.treasury("treasure");

        contract = blockchain.openContract(await Test.fromInit(42n));

        const deployResult = await contract.send(
            treasure.getSender(),
            { value: amount },
            null,
        );

        expect(deployResult.transactions).toHaveTransaction({
            from: treasure.address,
            to: contract.address,
            success: true,
            deploy: true,
        });

        expect(await contract.getGetX()).toStrictEqual(42n);
    });

    it("early return should result in a contract state change", async () => {
        await contract.send(
            treasure.getSender(),
            { value: amount },
            {
                $$type: "Msg",
                earlyReturn: true,
            },
        );
        expect(await contract.getGetX()).toStrictEqual(43n);
    });

    it("no early return should result in a different contract state change", async () => {
        await contract.send(
            treasure.getSender(),
            { value: amount },
            {
                $$type: "Msg",
                earlyReturn: false,
            },
        );
        expect(await contract.getGetX()).toStrictEqual(44n);
    });
});
