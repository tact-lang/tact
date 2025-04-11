import { toNano } from "@ton/core";
import type { SandboxContract, TreasuryContract } from "@ton/sandbox";
import { Blockchain } from "@ton/sandbox";
import { Tester } from "./output/dump_Tester";
import "@ton/test-utils";

describe("dump builtin", () => {
    let blockchain: Blockchain;
    let treasury: SandboxContract<TreasuryContract>;
    let contract: SandboxContract<Tester>;

    beforeEach(async () => {
        blockchain = await Blockchain.create();
        blockchain.verbosity.print = false;
        treasury = await blockchain.treasury("treasury");

        contract = blockchain.openContract(await Tester.fromInit());

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

    it("should dump values correctly in a receiver", async () => {
        const result = await contract.send(
            treasury.getSender(),
            { value: toNano("10") },
            "Dump",
        );

        expect(result.transactions[1]?.debugLogs).toMatchSnapshot();
    });
});
