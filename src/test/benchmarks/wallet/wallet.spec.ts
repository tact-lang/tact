import type { SandboxContract, TreasuryContract } from "@ton/sandbox";
import { Blockchain } from "@ton/sandbox";
import {
    Address,
    Cell,
    MessageRelaxed,
    SenderArguments,
    SendMode,
    Slice,
    storeMessageRelaxed,
} from "@ton/core";
import { beginCell, Dictionary, toNano } from "@ton/core";
import "@ton/test-utils";

import { Escrow } from "../contracts/output/escrow_Escrow";
import { getUsedGas, generateResults, printBenchmarkTable } from "../util";
import benchmarkResults from "./results.json";
import {
    getSecureRandomBytes,
    KeyPair,
    keyPairFromSeed,
    sign,
} from "@ton/crypto";
import { Wallet } from "../contracts/output/wallet_Wallet";

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
    const actionSlice = beginCell().storeUint(actions.mode, 8);

    for (const action of actions.args) {
        const slice = beginCell().storeUint(actions.mode, 8);

        switch (action.mode) {
            case 0:
                break;
            case 1:
                slice
                    .storeUint(action.sendMode, 8 | SendMode.IGNORE_ERRORS)
                    .storeRef(
                        beginCell()
                            .store(storeMessageRelaxed(action.outMsg))
                            .endCell(),
                    );
                break;
            case 2:
                slice.storeBit(action.isAllowed);
                break;
            case 3:
                slice.storeAddress(action.extensionAddress);
                break;
            case 4:
                slice.storeAddress(action.extensionAddress);
                break;
            default:
                break;
        }

        actionSlice.storeRef(slice.endCell());
    }

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
        const signature = sign(actions.hash(), keypair.secretKey);

        return await wallet.sendExternal({
            $$type: "SignedRequest",
            signature,
            operation: {
                $$type: "InternalOperation",
                walletId: SUBWALLET_ID,
                validUntil: validUntil(),
                seqno,
                actions: actions.beginParse(),
            },
        });
    }

    // each new escrow deal is new contract instance
    beforeEach(async () => {
        blockchain = await Blockchain.create();

        keypair = keyPairFromSeed(await getSecureRandomBytes(32));

        deployer = await blockchain.treasury("deployer");
        receiver = await blockchain.treasury("receiver");

        seqno = 0n;

        console.log(keypair.publicKey.toString("hex"));

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
    });

    afterAll(() => {
        printBenchmarkTable(results);
    });

    it("send external signed", async () => {
        const walletSeqno = await wallet.getSeqno();

        expect(walletSeqno).toBe(seqno);
    });
});
