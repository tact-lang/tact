import { toNano } from "@ton/core";
import { Blockchain, SandboxContract, TreasuryContract } from "@ton/sandbox";
import { MaxCellNumberTester as TestContract } from "./contracts/output/cell-number-limits_MaxCellNumberTester";
import "@ton/test-utils";

// According to config param 43, the absolute max is 2^16 cells by default
// The test below is used to know what's the max for Tact contracts
describe("cell number limits", () => {
    let blockchain: Blockchain;
    let treasure: SandboxContract<TreasuryContract>;
    let contract: SandboxContract<TestContract>;

    beforeEach(async () => {
        blockchain = await Blockchain.create();
        blockchain.verbosity.print = false;
        treasure = await blockchain.treasury("treasure", {
            balance: 1_000_000_000n,
            resetBalanceIfZero: true,
        });
        contract = blockchain.openContract(await TestContract.fromInit());

        const deployResult = await contract.send(
            treasure.getSender(),
            { value: toNano("100000") },
            null,
        );
        expect(deployResult.transactions).toHaveTransaction({
            from: treasure.address,
            to: contract.address,
            success: true,
            deploy: true,
        });
    });

    it("should test cell number limits", async () => {
        // TODO: a test, that adds more cells to the mix.
        const sendResult = await contract.send(
            treasure.getSender(),
            { value: toNano("1") },
            null, // FIXME: ← placeholder, until issues with Fift decompiler of the contract are resolved
            // {
            //     $$type: "AddCells",
            //     number: BigInt(16), // NOTE: adjust
            // },
        );
        expect(sendResult.transactions).toHaveTransaction({
            from: treasure.address,
            to: contract.address,
            success: false,
            actionResultCode: 50,
        });
    });
});
