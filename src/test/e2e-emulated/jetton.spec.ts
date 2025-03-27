import "@ton/test-utils";
import type { Address } from "@ton/core";
import { beginCell, Cell, toNano } from "@ton/core";
import type { SandboxContract, TreasuryContract } from "@ton/sandbox";
import { Blockchain } from "@ton/sandbox";
import type { JettonUpdateContent } from "../../benchmarks/contracts/output/jetton-minter-discoverable_JettonMinter";
import { JettonMinter } from "../../benchmarks/contracts/output/jetton-minter-discoverable_JettonMinter";
import { sendMintRaw, sendTransferRaw } from "../../benchmarks/utils/jetton";
import { JettonTester } from "./contracts/output/jetton_JettonTester";
import { JettonWallet } from "../../benchmarks/contracts/output/jetton-minter-discoverable_JettonWallet";

describe("Jetton", () => {
    let blockchain: Blockchain;

    let jettonMinter: SandboxContract<JettonMinter>;
    let jettonTester: SandboxContract<JettonTester>;

    let deployer: SandboxContract<TreasuryContract>;
    // let notDeployer: SandboxContract<TreasuryContract>;

    let defaultContent: Cell;
    let jettonWalletCode: Cell;
    let userWallet: (
        address: Address,
    ) => Promise<SandboxContract<JettonWallet>>;

    beforeAll(async () => {
        blockchain = await Blockchain.create();

        deployer = await blockchain.treasury("deployer");
        // notDeployer = await blockchain.treasury("notDeployer");

        defaultContent = beginCell().endCell();
        const msg: JettonUpdateContent = {
            $$type: "JettonUpdateContent",
            queryId: 0n,
            content: new Cell(),
        };

        jettonMinter = blockchain.openContract(
            await JettonMinter.fromInit(0n, deployer.address, defaultContent),
        );
        const deployResult = await jettonMinter.send(
            deployer.getSender(),
            { value: toNano("0.1") },
            msg,
        );

        expect(deployResult.transactions).toHaveTransaction({
            from: deployer.address,
            to: jettonMinter.address,
            deploy: true,
            success: true,
        });

        const jettonWallet = blockchain.openContract(
            await JettonWallet.fromInit(
                0n,
                deployer.address,
                jettonMinter.address,
            ),
        );
        jettonWalletCode = jettonWallet.init!.code;
        jettonTester = blockchain.openContract(
            await JettonTester.fromInit(
                jettonMinter.address,
                jettonWalletCode,
                0n,
                beginCell().asSlice(),
            ),
        );

        const testerDeployResult = await jettonTester.send(
            deployer.getSender(),
            { value: toNano("0.1") },
            null,
        );

        expect(testerDeployResult.transactions).toHaveTransaction({
            from: deployer.address,
            to: jettonTester.address,
            deploy: true,
            success: true,
        });

        userWallet = async (address: Address) => {
            return blockchain.openContract(
                JettonWallet.fromAddress(
                    await jettonMinter.getGetWalletAddress(address),
                ),
            );
        };
    });

    it("jetton receiver successfull", async () => {
        const mintResult = await sendMintRaw(
            jettonMinter.address,
            deployer,
            deployer.address,
            toNano(100000),
            toNano("0.05"),
            toNano("1"),
        );

        const deployerJettonWallet = await userWallet(deployer.address);
        const testerJettonWallet = await userWallet(jettonTester.address);

        expect(mintResult.transactions).toHaveTransaction({
            from: jettonMinter.address,
            to: deployerJettonWallet.address,
            success: true,
            endStatus: "active",
        });

        const jettonTransferAmount = toNano(1);
        const jettonTransferForwardPayload = beginCell()
            .storeUint(239, 32)
            .endCell();

        // -(external)-> deployer -(transfer)-> deployer jetton wallet --
        // -(internal transfer)-> tester jetton wallet -(transfer notification)-> tester
        const transferResult = await sendTransferRaw(
            deployerJettonWallet.address,
            deployer,
            toNano(2),
            jettonTransferAmount,
            jettonTester.address,
            deployer.address,
            null,
            toNano(1),
            jettonTransferForwardPayload,
        );

        expect(transferResult.transactions).toHaveTransaction({
            from: deployerJettonWallet.address,
            to: testerJettonWallet.address,
            success: true,
            exitCode: 0,
            outMessagesCount: 2, // notification + excesses
            op: JettonWallet.opcodes.JettonTransferInternal,
            deploy: true,
        });

        expect(transferResult.transactions).toHaveTransaction({
            from: testerJettonWallet.address,
            to: jettonTester.address,
            success: true,
            exitCode: 0,
            outMessagesCount: 1, // cashback
            op: JettonWallet.opcodes.JettonNotification,
        });

        // getters to ensure we successfully received notification and executed overriden fetch method
        const getAmount = await jettonTester.getAmount();
        expect(getAmount).toEqual(jettonTransferAmount);

        const getPayload = await jettonTester.getPayload();
        expect(getPayload).toEqualSlice(jettonTransferForwardPayload.asSlice());
    });
});
