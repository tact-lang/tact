import { IncrementContract } from "./output/increment_IncrementContract";
import { Blockchain, SandboxContract, TreasuryContract } from "@ton/sandbox";
import { toNano } from "@ton/core";
import "@ton/test-utils";

describe("increment", () => {
    let blockchain: Blockchain;
    let treasure: SandboxContract<TreasuryContract>;
    let contract: SandboxContract<IncrementContract>;

    beforeEach(async () => {
        blockchain = await Blockchain.create();
        blockchain.verbosity.print = false;
        treasure = await blockchain.treasury("treasure");
        contract = blockchain.openContract(await IncrementContract.fromInit());

        const result = await contract.send(
            treasure.getSender(),
            { value: toNano("10") },
            { $$type: "Deploy", queryId: 0n },
        );

        expect(result.transactions).toHaveTransaction({
            from: treasure.address,
            to: contract.address,
            success: true,
            deploy: true,
        });
    });

    it("should deploy", async () => {});

    it("should increment", async () => {
        await contract.send(
            treasure.getSender(),
            {
                value: toNano("10"),
            },
            {
                $$type: "Increment",
                key: 0n,
                value: -1232n,
            },
        );

        const counters = await contract.getCounters();
        expect(counters.size).toEqual(1);
        expect(counters.get(0n)).toEqual(-1232n);
    });
});
