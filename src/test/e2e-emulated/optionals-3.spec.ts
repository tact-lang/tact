import { toNano } from "@ton/core";
import { Blockchain, SandboxContract, TreasuryContract } from "@ton/sandbox";
import { Opt5 } from "./contracts/output/optionals-3_Opt5";
import "@ton/test-utils";

describe("optionals", () => {
    let blockchain: Blockchain;
    let treasure: SandboxContract<TreasuryContract>;
    let contract: SandboxContract<Opt5>;

    beforeEach(async () => {
        blockchain = await Blockchain.create();
        blockchain.verbosity.print = false;
        treasure = await blockchain.treasury("treasure");

        contract = blockchain.openContract(await Opt5.fromInit());

        const deployResult = await contract.send(
            treasure.getSender(),
            { value: toNano("10") },
            null,
        );

        expect(deployResult.transactions).toHaveTransaction({
            from: treasure.address,
            to: contract.address,
            success: true,
            deploy: true,
        });
    });

    it("should calculate correct result", async () => {
        expect(await contract.getTest1()).toEqual(true);
        expect(await contract.getTest2()).toEqual(true);
        expect(await contract.getTest3()).toEqual(false);
    });
});
