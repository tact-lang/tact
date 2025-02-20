import type {
    CommonMessageInfo,
    CommonMessageInfoInternal,
    Message,
    Slice,
    StateInit,
} from "@ton/core";
import { beginCell, toNano } from "@ton/core";
import type {
    BlockchainTransaction,
    SandboxContract,
    TreasuryContract,
} from "@ton/sandbox";
import { Blockchain } from "@ton/sandbox";
import type {
    DeployComparisonMsg,
    DeployComparisonNoBodyMsg,
    DeployParamsMsg,
} from "./contracts/output/deploy_DeployContract";
import { DeployContract } from "./contracts/output/deploy_DeployContract";
import "@ton/test-utils";
import { findTransaction } from "@ton/test-utils";
import type { Maybe } from "@ton/core/dist/utils/maybe";

const counter = () => {
    let next = 0n;
    return () => next++;
};

const nextContractId = counter();

type DeployParams = {
    bounce: boolean;
    body: Slice;
    mode: bigint;
};

describe("Deploy() correctness", () => {
    let blockchain: Blockchain;
    let treasure: SandboxContract<TreasuryContract>;
    let contract: SandboxContract<DeployContract>;

    async function checkCorrectness(params: DeployParams) {
        const deployedContractId = nextContractId();
        const msgToSend: DeployParamsMsg = {
            bounce: params.bounce,
            $$type: "DeployParamsMsg",
            body: params.body,
            contractNum: deployedContractId,
            mode: params.mode,
        };
        const sendResult = await contract.send(
            treasure.getSender(),
            { value: toNano("1") },
            msgToSend,
        );
        expect(sendResult.transactions).toHaveTransaction({
            from: contract.address,
            to: (await DeployContract.fromInit(deployedContractId)).address,
            deploy: true,
        });
    }

    async function testIdenticalMessages(
        msgToSend: DeployComparisonMsg | DeployComparisonNoBodyMsg,
    ) {
        const { transactions } = await contract.send(
            treasure.getSender(),
            { value: toNano("100") },
            msgToSend,
        );

        // Obtain the transaction that executed the deploy and send functions
        const tsx = ensureTransactionIsDefined(
            findTransaction(transactions, {
                from: treasure.address,
                to: contract.address,
                success: true,
            }),
        );
        // Check that two messages were sent
        expect(tsx.outMessagesCount).toBe(2);

        // Obtain both sent messages
        const message1 = ensureMessageIsDefined(tsx.outMessages.get(0));
        const message2 = ensureMessageIsDefined(tsx.outMessages.get(1));

        // Check that their bodies are identical
        message1.body.equals(message2.body);

        // Check that their init structs are defined
        const initStruct1 = ensureInitStructIsDefined(message1.init);
        const initStruct2 = ensureInitStructIsDefined(message2.init);

        // Now check that both structs are identical
        checkIdenticalInitStructs(initStruct1, initStruct2);

        const info1 = extractMessageInfo(message1.info);
        const info2 = extractMessageInfo(message2.info);

        checkInfosAreIdentical(info1, info2);
    }

    beforeEach(async () => {
        blockchain = await Blockchain.create();
        blockchain.verbosity.print = false;
        treasure = await blockchain.treasury("treasure");

        contract = blockchain.openContract(
            await DeployContract.fromInit(nextContractId()),
        );

        const deployResult = await contract.send(
            treasure.getSender(),
            { value: toNano("10") },
            beginCell().endCell().asSlice(),
        );
        expect(deployResult.transactions).toHaveTransaction({
            from: treasure.address,
            to: contract.address,
            success: true,
            deploy: true,
        });
    });
    it("should work with any bounce flag", async () => {
        await checkCorrectness({
            bounce: true,
            body: beginCell()
                .storeStringTail("Hello world!")
                .endCell()
                .asSlice(),
            mode: 64n,
        });

        await checkCorrectness({
            bounce: false,
            body: beginCell()
                .storeStringTail("Hello world!")
                .endCell()
                .asSlice(),
            mode: 64n,
        });
    });

    it("should work with any mode", async () => {
        await checkCorrectness({
            bounce: true,
            body: beginCell()
                .storeStringTail("Hello world!")
                .endCell()
                .asSlice(),
            mode: 64n,
        });

        await checkCorrectness({
            bounce: true,
            body: beginCell()
                .storeStringTail("Hello world!")
                .endCell()
                .asSlice(),
            mode: 128n,
        });
    });

    it("should work with any body", async () => {
        await checkCorrectness({
            bounce: false,
            body: beginCell().endCell().asSlice(), // empty slice
            mode: 64n,
        });
    });

    it("should check that deploy and send produce indistinguishable messages", async () => {
        // Different bounces
        await testIdenticalMessages({
            $$type: "DeployComparisonMsg",
            bounce: true,
            body: beginCell().storeUint(3, 5).endCell().asSlice(),
            contractNum: nextContractId(),
            mode: 0n,
            value: toNano("1"),
        });
        await testIdenticalMessages({
            $$type: "DeployComparisonMsg",
            bounce: false,
            body: beginCell().storeUint(3, 5).endCell().asSlice(),
            contractNum: nextContractId(),
            mode: 0n,
            value: toNano("1"),
        });

        // Different bodies
        const bodiesToCheck = [
            beginCell().storeUint(3, 5).storeUint(8, 10).endCell().asSlice(),
            beginCell()
                .storeUint(8, 10)
                .storeStringTail("test")
                .endCell()
                .asSlice(),
            beginCell().endCell().asSlice(),
        ];
        for (const body of bodiesToCheck) {
            await testIdenticalMessages({
                $$type: "DeployComparisonMsg",
                bounce: true,
                body: body,
                contractNum: nextContractId(),
                mode: 0n,
                value: toNano("1"),
            });
        }

        // Different modes
        const modesToCheck = [0n, 1n, 2n, 16n, 32n, 64n, 65n, 66n, 80n, 96n];
        for (const mode of modesToCheck) {
            await testIdenticalMessages({
                $$type: "DeployComparisonMsg",
                bounce: true,
                body: beginCell()
                    .storeUint(8, 10)
                    .storeStringTail("test")
                    .endCell()
                    .asSlice(),
                contractNum: nextContractId(),
                mode: mode,
                value: toNano("1"),
            });
        }

        // Different values
        const valuesToCheck = [toNano("0.05"), toNano("1"), toNano("2")];
        for (const value of valuesToCheck) {
            await testIdenticalMessages({
                $$type: "DeployComparisonMsg",
                bounce: true,
                body: beginCell()
                    .storeUint(8, 10)
                    .storeStringTail("test")
                    .endCell()
                    .asSlice(),
                contractNum: nextContractId(),
                mode: 0n,
                value: value,
            });
        }

        // Checks for send and deploy with no given bodies

        // Different bounces
        await testIdenticalMessages({
            $$type: "DeployComparisonNoBodyMsg",
            bounce: true,
            contractNum: nextContractId(),
            mode: 0n,
            value: toNano("1"),
        });
        await testIdenticalMessages({
            $$type: "DeployComparisonNoBodyMsg",
            bounce: false,
            contractNum: nextContractId(),
            mode: 0n,
            value: toNano("1"),
        });

        // Different modes
        for (const mode of modesToCheck) {
            await testIdenticalMessages({
                $$type: "DeployComparisonNoBodyMsg",
                bounce: true,
                contractNum: nextContractId(),
                mode: mode,
                value: toNano("1"),
            });
        }

        // Different values
        for (const value of valuesToCheck) {
            await testIdenticalMessages({
                $$type: "DeployComparisonNoBodyMsg",
                bounce: true,
                contractNum: nextContractId(),
                mode: 0n,
                value: value,
            });
        }
    });
});

function ensureTransactionIsDefined(
    tsx: BlockchainTransaction | undefined,
): BlockchainTransaction {
    if (tsx) {
        return tsx;
    }
    throw new Error("Transaction was expected to exist");
}

function ensureMessageIsDefined(msg: Message | undefined): Message {
    if (msg) {
        return msg;
    }
    throw new Error("Message was expected to be exist");
}

function ensureInitStructIsDefined(initStruct: Maybe<StateInit>): StateInit {
    if (initStruct) {
        return initStruct;
    }
    throw new Error("Init struct was expected to exist");
}

function checkIdenticalInitStructs(
    initStruct1: StateInit,
    initStruct2: StateInit,
) {
    if (
        typeof initStruct1.code === "undefined" ||
        typeof initStruct2.code === "undefined" ||
        initStruct1.code === null ||
        initStruct2.code === null
    ) {
        throw new Error(
            "Code field was expected to be defined in both structs",
        );
    }
    expect(initStruct1.code.equals(initStruct2.code)).toBe(true);

    if (
        typeof initStruct1.data === "undefined" ||
        typeof initStruct2.data === "undefined" ||
        initStruct1.data === null ||
        initStruct2.data === null
    ) {
        throw new Error(
            "Data field was expected to be defined in both structs",
        );
    }

    expect(initStruct1.data.equals(initStruct2.data)).toBe(true);

    expect(initStruct1.libraries).toBeUndefined();
    expect(initStruct2.libraries).toBeUndefined();
    expect(initStruct1.special).toBeUndefined();
    expect(initStruct2.special).toBeUndefined();
    expect(initStruct1.splitDepth).toBeUndefined();
    expect(initStruct2.splitDepth).toBeUndefined();
}

function extractMessageInfo(
    info: CommonMessageInfo,
): CommonMessageInfoInternal {
    if (info.type === "internal") {
        return info;
    }
    throw new Error("Message was expected to be of type internal");
}

function checkInfosAreIdentical(
    info1: CommonMessageInfoInternal,
    info2: CommonMessageInfoInternal,
) {
    expect(info1.bounce).toBe(info2.bounce);
    expect(info1.bounced).toBe(info2.bounced);
    expect(info1.dest.equals(info2.dest)).toBe(true);
    expect(info1.forwardFee.toString()).toBe(info2.forwardFee.toString());
    expect(info1.src.equals(info2.src)).toBe(true);
    // We cannot compare info1.value and info2.value because their values will depend on the send-message mode used
    // and the order in which they execute in the action phase
}
