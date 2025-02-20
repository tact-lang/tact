import type { SandboxContract, TreasuryContract } from "@ton/sandbox";
import { Blockchain } from "@ton/sandbox";
import type { Address, Cell, MessageRelaxed } from "@ton/core";
import { SendMode, storeMessageRelaxed } from "@ton/core";
import { beginCell, Dictionary, toNano } from "@ton/core";
import "@ton/test-utils";

import { getUsedGas, generateResults, printBenchmarkTable } from "../util";
import benchmarkResults from "./results.json";
import type { KeyPair } from "@ton/crypto";
import { getSecureRandomBytes, keyPairFromSeed, sign } from "@ton/crypto";
import type { InternalOperation } from "../contracts/output/wallet_Wallet";
import {
    storeInternalOperation,
    Wallet,
} from "../contracts/output/wallet_Wallet";

function validUntil(ttlMs = 1000 * 60 * 3) {
    return BigInt(Math.floor((Date.now() + ttlMs) / 1000));
}

function bufferToBigInt(buffer: Buffer): bigint {
    return BigInt("0x" + buffer.toString("hex"));
}

type MultipleAction = {
    mode: 0;
    args: WalletAction[];
};

type SendMsgAction = {
    mode: 1;
    sendMode: SendMode;
    outMsg: MessageRelaxed;
};

type ChangeSignaturePolicyAction = {
    mode: 2;
    isAllowed: boolean;
};

type AddExtensionAction = {
    mode: 3;
    extensionAddress: Address;
};

type RemoveExtensionAction = {
    mode: 4;
    extensionAddress: Address;
};

type WalletAction =
    | SendMsgAction
    | ChangeSignaturePolicyAction
    | AddExtensionAction
    | RemoveExtensionAction
    | MultipleAction;

type ActionCell = Cell;

function collectMultipleActions(actions: WalletAction[]): MultipleAction {
    return {
        mode: 0,
        args: actions,
    };
}

function createActionsSlice(actions: MultipleAction): ActionCell {
    const serializeAction = (walletAction: WalletAction): ActionCell => {
        const slice = beginCell().storeUint(walletAction.mode, 8);

        switch (walletAction.mode) {
            case 0:
                break;
            case 1:
                slice
                    .storeUint(
                        walletAction.sendMode | SendMode.IGNORE_ERRORS,
                        8,
                    )
                    .storeRef(
                        beginCell()
                            .store(storeMessageRelaxed(walletAction.outMsg))
                            .endCell(),
                    );
                break;
            case 2:
                slice.storeBit(walletAction.isAllowed);
                break;
            case 3:
                slice.storeAddress(walletAction.extensionAddress);
                break;
            case 4:
                slice.storeAddress(walletAction.extensionAddress);
                break;
            default:
                break;
        }

        return slice.endCell();
    };

    if (actions.args.length === 1) {
        return serializeAction(actions.args[0]!);
    }

    const actionSlice = beginCell().storeUint(actions.mode, 8);

    actions.args.map(serializeAction).forEach(actionSlice.storeRef);

    return actionSlice.endCell();
}

describe("Wallet Gas Tests", () => {
    let blockchain: Blockchain;
    let deployer: SandboxContract<TreasuryContract>;
    let receiver: SandboxContract<TreasuryContract>;
    let wallet: SandboxContract<Wallet>;
    let seqno: bigint;

    let keypair: KeyPair;

    const SUBWALLET_ID = 0n;
    const results = generateResults(benchmarkResults);
    const expectedResult = results.at(-1)!;

    async function sendSignedExternaldBody(actions: ActionCell) {
        const internalOperation: InternalOperation = {
            $$type: "InternalOperation",
            walletId: SUBWALLET_ID,
            validUntil: validUntil(),
            seqno,
            actions: actions.beginParse(),
        };

        const operationHash = beginCell()
            .store(storeInternalOperation(internalOperation))
            .endCell()
            .hash();

        const signature = sign(operationHash, keypair.secretKey);

        return await wallet.sendExternal({
            $$type: "SignedRequest",
            signature,
            operation: internalOperation,
        });
    }

    // each new escrow deal is new contract instance
    beforeEach(async () => {
        blockchain = await Blockchain.create();

        keypair = keyPairFromSeed(await getSecureRandomBytes(32));

        deployer = await blockchain.treasury("deployer");
        receiver = await blockchain.treasury("receiver");

        seqno = 0n;

        wallet = blockchain.openContract(
            await Wallet.fromInit(
                bufferToBigInt(keypair.publicKey),
                SUBWALLET_ID,
                Dictionary.empty(),
            ),
        );

        const deployResult = await wallet.send(
            deployer.getSender(),
            {
                value: toNano("0.05"),
            },
            {
                $$type: "Deploy",
                queryId: 0n,
            },
        );

        expect(deployResult.transactions).toHaveTransaction({
            from: deployer.address,
            to: wallet.address,
            deploy: true,
            success: true,
        });

        // top up wallet balance
        await deployer.send({
            to: wallet.address,
            value: toNano("10"),
            sendMode: SendMode.PAY_GAS_SEPARATELY,
        });
    });

    afterAll(() => {
        printBenchmarkTable(results);
    });

    it("check correctness of deploy", async () => {
        const walletSeqno = await wallet.getSeqno();

        expect(walletSeqno).toBe(seqno);

        const walletPublicKey = await wallet.getGetPublicKey();

        expect(walletPublicKey).toBe(bufferToBigInt(keypair.publicKey));

        const pluginList = await wallet.getGetPluginList();

        expect(pluginList.size).toEqual(0);
    });

    it("externalTransfer", async () => {
        const testReceiver = receiver.address;
        const forwardValue = toNano(0.001);

        const receiverBalanceBefore = (
            await blockchain.getContract(testReceiver)
        ).balance;

        const actions = collectMultipleActions([
            {
                mode: 1,
                sendMode: SendMode.PAY_GAS_SEPARATELY,
                outMsg: {
                    body: beginCell().endCell(),
                    info: {
                        type: "internal",
                        bounce: false,
                        bounced: false,
                        dest: testReceiver,
                        value: {
                            coins: forwardValue,
                        },
                        createdAt: 1,
                        createdLt: 1n,
                        forwardFee: 0n,
                        ihrDisabled: true,
                        ihrFee: 0n,
                    },
                },
            },
        ]);

        const actionsSlice = createActionsSlice(actions);

        const externalTransferSendResult =
            await sendSignedExternaldBody(actionsSlice);

        // external and transfer
        expect(externalTransferSendResult.transactions.length).toEqual(2);

        expect(externalTransferSendResult.transactions).toHaveTransaction({
            from: wallet.address,
            to: testReceiver,
            value: forwardValue,
        });

        const fee = externalTransferSendResult.transactions[1]!.totalFees.coins;

        const receiverBalanceAfter = (
            await blockchain.getContract(testReceiver)
        ).balance;
        expect(receiverBalanceAfter).toEqual(
            receiverBalanceBefore + forwardValue - fee,
        );

        const gasUsed = getUsedGas(externalTransferSendResult, true);
        expect(gasUsed).toEqual(expectedResult.gas["externalTransfer"]);
    });
});
