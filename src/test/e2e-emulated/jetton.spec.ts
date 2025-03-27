import "@ton/test-utils";
import type { Address } from "@ton/core";
import { beginCell, Cell, toNano } from "@ton/core";
import type { SandboxContract, TreasuryContract } from "@ton/sandbox";
import { Blockchain } from "@ton/sandbox";
import type { JettonUpdateContent } from "../../benchmarks/contracts/output/jetton-minter-discoverable_JettonMinter";
import { JettonMinter } from "../../benchmarks/contracts/output/jetton-minter-discoverable_JettonMinter";
import {
    deployFuncJettonMinter,
    getJettonWalletRaw,
    loadFunCJettonsBoc,
    sendMintRaw,
    sendTransferRaw,
} from "../../benchmarks/utils/jetton";
import type { JettonNotification } from "./contracts/output/jetton_JettonTester";
import {
    JettonTester,
    storeJettonNotification,
} from "./contracts/output/jetton_JettonTester";
import { JettonWallet } from "../../benchmarks/contracts/output/jetton-minter-discoverable_JettonWallet";
import { JettonResolverOverridenTester } from "./contracts/output/jetton_JettonResolverOverridenTester";

describe("Jetton stdlib", () => {
    let blockchain: Blockchain;

    let jettonMinter: SandboxContract<JettonMinter>;
    let jettonMinterFuncAddress: Address;
    let jettonReceiverTester: SandboxContract<JettonTester>;
    let jettonResolverOverridenTester: SandboxContract<JettonResolverOverridenTester>;

    let deployer: SandboxContract<TreasuryContract>;
    // let notDeployer: SandboxContract<TreasuryContract>;

    let defaultContent: Cell;
    let jettonWalletCode: Cell;
    let userWallet: (
        address: Address,
    ) => Promise<SandboxContract<JettonWallet>>;

    beforeEach(async () => {
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
        jettonReceiverTester = blockchain.openContract(
            await JettonTester.fromInit(
                jettonMinter.address,
                jettonWalletCode,
                0n,
                beginCell().asSlice(),
            ),
        );

        const testerDeployResult = await jettonReceiverTester.send(
            deployer.getSender(),
            { value: toNano("0.1") },
            null,
        );

        expect(testerDeployResult.transactions).toHaveTransaction({
            from: deployer.address,
            to: jettonReceiverTester.address,
            deploy: true,
            success: true,
        });

        const { bocWallet } = loadFunCJettonsBoc();

        const { minterAddress, result } =
            await deployFuncJettonMinter(deployer);

        expect(result.transactions).toHaveTransaction({
            from: deployer.address,
            to: minterAddress,
            deploy: true,
        });

        jettonMinterFuncAddress = minterAddress;

        // since we want to test FunC resolve, we need FunC jetton wallet code
        jettonResolverOverridenTester = blockchain.openContract(
            await JettonResolverOverridenTester.fromInit(
                jettonMinterFuncAddress,
                Cell.fromBoc(bocWallet)[0]!,
            ),
        );

        const deployResolverResult = await jettonResolverOverridenTester.send(
            deployer.getSender(),
            { value: toNano("0.1") },
            null,
        );

        expect(deployResolverResult.transactions).toHaveTransaction({
            from: deployer.address,
            to: jettonResolverOverridenTester.address,
            deploy: true,
        });

        userWallet = async (address: Address) => {
            return blockchain.openContract(
                JettonWallet.fromAddress(
                    await jettonMinter.getGetWalletAddress(address),
                ),
            );
        };
    });

    it("jetton receiver should accept correct transfer notification", async () => {
        const mintResult = await sendMintRaw(
            jettonMinter.address,
            deployer,
            deployer.address,
            toNano(100000),
            toNano("0.05"),
            toNano("1"),
        );

        const deployerJettonWallet = await userWallet(deployer.address);
        const testerJettonWallet = await userWallet(
            jettonReceiverTester.address,
        );

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
            jettonReceiverTester.address,
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
            to: jettonReceiverTester.address,
            success: true,
            exitCode: 0,
            outMessagesCount: 1, // cashback
            op: JettonWallet.opcodes.JettonNotification,
        });

        // getters to ensure we successfully received notification and executed overriden fetch method
        const getAmount = await jettonReceiverTester.getAmount();
        expect(getAmount).toEqual(jettonTransferAmount);

        const getPayload = await jettonReceiverTester.getPayload();
        expect(getPayload).toEqualSlice(jettonTransferForwardPayload.asSlice());
    });

    it("jetton receiver should reject malicious transfer notification", async () => {
        const msg: JettonNotification = {
            $$type: "JettonNotification",
            queryId: 0n,
            amount: toNano(1),
            forwardPayload: beginCell().storeUint(239, 32).asSlice(),
            sender: deployer.address,
        };

        const msgCell = beginCell()
            .store(storeJettonNotification(msg))
            .endCell();

        const maliciousSendResult = await deployer.send({
            to: jettonReceiverTester.address,
            value: toNano(1),
            body: msgCell,
        });

        expect(maliciousSendResult.transactions).toHaveTransaction({
            from: deployer.address,
            to: jettonReceiverTester.address,
            success: false,
            exitCode: JettonTester.errors["Incorrect sender"],
        });

        const getAmount = await jettonReceiverTester.getAmount();
        expect(getAmount).toEqual(0n);

        const getPayload = await jettonReceiverTester.getPayload();
        expect(getPayload).toEqualSlice(beginCell().asSlice());
    });

    it("jetton resolver should correctly resolve FunC jetton wallet", async () => {
        const deployerFunCJettonWalletAddressFromMinter =
            await getJettonWalletRaw(
                jettonMinterFuncAddress,
                blockchain,
                deployer.address,
            );

        const deployerFunCJettonWalletAddressFromResolver =
            await jettonResolverOverridenTester.getJettonWallet(
                deployer.address,
            );

        expect(deployerFunCJettonWalletAddressFromMinter).toEqualAddress(
            deployerFunCJettonWalletAddressFromResolver,
        );
    });
});
