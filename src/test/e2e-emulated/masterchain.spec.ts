import { toNano } from "@ton/core";
import type { SandboxContract, TreasuryContract } from "@ton/sandbox";
import { Blockchain } from "@ton/sandbox";
import { MasterchainTester } from "./contracts/output/masterchain_MasterchainTester";
import "@ton/test-utils";

describe("masterchain", () => {
    let blockchain: Blockchain;
    let treasure: SandboxContract<TreasuryContract>;

    beforeEach(async () => {
        blockchain = await Blockchain.create();
        blockchain.verbosity.print = false;
        treasure = await blockchain.treasury("treasure");
    });

    //
    // Deployment and simple message receiving
    //

    it("should deploy to workchain", async () => {
        const contract = blockchain.openContract(
            await MasterchainTester.fromInit(),
        );

        const deployResult = await contract.send(
            treasure.getSender(),
            { value: toNano("10") },
            "DeployToWorkchain",
        );

        expect(deployResult.transactions).toHaveTransaction({
            from: treasure.address,
            to: contract.address,
            success: true,
            deploy: true,
        });
    });

    it("should not deploy to workchain from masterchain", async () => {
        const treasure = await blockchain.treasury("treasure", {
            workchain: -1,
        });
        const contract = blockchain.openContract(
            await MasterchainTester.fromInit(),
        );

        const deployResult = await contract.send(
            treasure.getSender(),
            { value: toNano("10") },
            "DeployToWorkchain",
        );

        expect(deployResult.transactions).toHaveTransaction({
            from: treasure.address,
            to: contract.address,
            success: false,
            deploy: true,
            exitCode: 1137,
        });
    });

    it("should deploy to masterchain from masterchain", async () => {
        const treasure = await blockchain.treasury("treasure", {
            workchain: -1,
        });
        const contract = blockchain.openContract(
            await MasterchainTester.fromInit(),
        );

        const deployResult = await contract.send(
            treasure.getSender(),
            { value: toNano("10") },
            "DeployToMasterchain",
        );

        expect(deployResult.transactions).toHaveTransaction({
            from: treasure.address,
            to: contract.address,
            success: true,
            deploy: true,
        });
    });
});
