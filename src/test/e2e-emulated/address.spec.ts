import { toNano } from "@ton/core";
import type { SandboxContract, TreasuryContract } from "@ton/sandbox";
import { Blockchain } from "@ton/sandbox";
import { AddressTester } from "./contracts/output/address_AddressTester";
import "@ton/test-utils";

describe("address", () => {
    let blockchain: Blockchain;
    let treasure: SandboxContract<TreasuryContract>;
    let contract: SandboxContract<AddressTester>;

    beforeEach(async () => {
        blockchain = await Blockchain.create();
        blockchain.verbosity.print = false;
        treasure = await blockchain.treasury("treasure");
        contract = blockchain.openContract(await AddressTester.fromInit());

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

    it("should implement addresses correctly", async () => {
        // Check methods
        expect((await contract.getTest1()).toRawString()).toEqual(
            "0:4a81708d2cf7b15a1b362fbf64880451d698461f52f05f145b36c08517d76873",
        );
        expect((await contract.getTest2()).toRawString()).toEqual(
            "0:4a81708d2cf7b15a1b362fbf64880451d698461f52f05f145b36c08517d76873",
        );
        expect((await contract.getTest3()).toRawString()).toEqual(
            "0:4a81708d2cf7b15a1b362fbf64880451d698461f52f05f145b36c08517d76873",
        );
    });
});
