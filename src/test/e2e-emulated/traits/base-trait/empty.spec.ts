import { beginCell, toNano, type Cell } from "@ton/core";
import type {
    BlockchainTransaction,
    SandboxContract,
    TreasuryContract,
} from "@ton/sandbox";
import { Blockchain } from "@ton/sandbox";
import type {
    Reply,
    Notify,
    Forward,
    DoubleForward,
    MessageAndForward,
    StateInit,
} from "./output/empty_Empty";

import { Empty } from "./output/empty_Empty";

import "@ton/test-utils";

describe("baseTrait without changing self.reservedAmount", () => {
    let blockchain: Blockchain;

    let balanceBefore: bigint;

    let treasure: SandboxContract<TreasuryContract>;
    let contract: SandboxContract<Empty>;

    const deployValue = toNano("0.05");
    const lowSendValue = toNano("0.5");

    const SendPayFwdFeesSeparately = 1n;

    const initCode: Cell = beginCell().endCell();
    const initData: Cell = beginCell().endCell();

    const init: StateInit = {
        $$type: "StateInit",
        code: initCode,
        data: initData,
    };

    const defaultBody = beginCell().storeStringRefTail("body").endCell();

    const replyMessage: Reply = {
        $$type: "Reply",
        body: defaultBody,
    };

    const notifyMessage: Notify = {
        $$type: "Notify",
        body: defaultBody,
    };

    let forwardMessage: Forward;
    let doubleForwardMessage: DoubleForward;
    let messageAndForwardMessage: MessageAndForward;

    beforeEach(async () => {
        blockchain = await Blockchain.create();
        treasure = await blockchain.treasury("treasure");

        contract = blockchain.openContract(await Empty.fromInit());

        const deployResult = await contract.send(
            treasure.getSender(),
            {value: deployValue},
            null,
        );

        expect(deployResult.transactions).toHaveTransaction({
            from: treasure.address,
            to: contract.address,
            success: true,
            deploy: true,
        });

        balanceBefore = (await blockchain.getContract(contract.address))
            .balance;

        forwardMessage = {
            $$type: "Forward",
            to: treasure.address,
            body: defaultBody,
            bounce: false,
            init: null,
        };

        doubleForwardMessage = {
            $$type: "DoubleForward",
            to: treasure.address,
            body: defaultBody,
            bounce: false,
            init: null,
        };

        messageAndForwardMessage = {
            $$type: "MessageAndForward",
            to: treasure.address,
            body: defaultBody,
            bounce: false,
            init: null,
            mode: SendPayFwdFeesSeparately,
            value: 1n,
        };
    });

    it("should send Reply message with argument of reply", async () => {
        const result = await contract.send(
            treasure.getSender(),
            {value: lowSendValue},
            replyMessage,
        );

        expect(result.transactions).toHaveTransaction({
            from: contract.address,
            to: treasure.address,
            inMessageBounceable: true,
            body: defaultBody,
        });
    });

    it("should not increase contract balance after Reply message", async () => {
        await contract.send(
            treasure.getSender(),
            {value: lowSendValue},
            replyMessage,
        );
        const balance: bigint = (await blockchain.getContract(contract.address))
            .balance;

        expect(balance).toEqual(balanceBefore);
    });

    it("should send Notify message with argument of notify", async () => {
        const result = await contract.send(
            treasure.getSender(),
            {value: lowSendValue},
            notifyMessage,
        );

        expect(result.transactions).toHaveTransaction({
            from: contract.address,
            to: treasure.address,
            inMessageBounceable: false,
            body: defaultBody,
        });
    });

    it("should not increase contract balance after Notify message", async () => {
        await contract.send(
            treasure.getSender(),
            {value: lowSendValue},
            notifyMessage,
        );

        const balance: bigint = (await blockchain.getContract(contract.address))
            .balance;

        expect(balance).toEqual(balanceBefore);
    });

    const checkForwardMessage = (
        forwardMessage: Forward | DoubleForward | MessageAndForward,
        transactions: BlockchainTransaction[],
    ) => {
        let body = beginCell().endCell();
        let initData = undefined;
        let initCode = undefined;

        if (forwardMessage.init) {
            initData = forwardMessage.init.data;
            initCode = forwardMessage.init.code;
        }

        if (forwardMessage.body) {
            body = forwardMessage.body;
        }

        expect(transactions).toHaveTransaction({
            from: contract.address,
            to: treasure.address,
            inMessageBounceable: forwardMessage.bounce,
            body: body,
            initCode: initData,
            initData: initCode,
        });
    };

    it("should send Forward message with forward arguments", async () => {
        const result = await contract.send(
            treasure.getSender(),
            {value: lowSendValue},
            forwardMessage,
        );

        checkForwardMessage(forwardMessage, result.transactions);
    });

    it("should not increase contract balance after Forward message", async () => {
        await contract.send(
            treasure.getSender(),
            {value: lowSendValue},
            forwardMessage,
        );

        const balance: bigint = (await blockchain.getContract(contract.address))
            .balance;

        expect(balance).toEqual(balanceBefore);
    });

    it("should send Forward message with forward arguments without body", async () => {
        forwardMessage.body = null;

        const result = await contract.send(
            treasure.getSender(),
            {value: lowSendValue},
            forwardMessage,
        );

        checkForwardMessage(forwardMessage, result.transactions);
    });

    it("should not increase contract balance after Forward message without body", async () => {
        forwardMessage.body = null;

        await contract.send(
            treasure.getSender(),
            {value: lowSendValue},
            forwardMessage,
        );

        const balance: bigint = (await blockchain.getContract(contract.address))
            .balance;

        expect(balance).toEqual(balanceBefore);
    });

    it("should send init with Forward message", async () => {
        forwardMessage.init = init;

        const result = await contract.send(
            treasure.getSender(),
            {value: lowSendValue},
            forwardMessage,
        );

        checkForwardMessage(forwardMessage, result.transactions);
    });

    it("should not increase contract balance after Forward message with init", async () => {
        forwardMessage.init = init;

        await contract.send(
            treasure.getSender(),
            {value: lowSendValue},
            forwardMessage,
        );

        const balance: bigint = (await blockchain.getContract(contract.address))
            .balance;

        expect(balance).toEqual(balanceBefore);
    });

    it("should send Forward message with forward arguments without body and with init", async () => {
        forwardMessage.body = null;
        forwardMessage.init = init;

        const result = await contract.send(
            treasure.getSender(),
            {value: lowSendValue},
            forwardMessage,
        );

        checkForwardMessage(forwardMessage, result.transactions);
    });

    it("should not increase contract balance after Forward message without body and with init", async () => {
        forwardMessage.body = null;
        forwardMessage.init = init;

        await contract.send(
            treasure.getSender(),
            {value: lowSendValue},
            forwardMessage,
        );

        const balance: bigint = (await blockchain.getContract(contract.address))
            .balance;

        expect(balance).toEqual(balanceBefore);
    });

    it("Should send only one message, even if Forward is called twice", async () => {
        const result = await contract.send(
            treasure.getSender(),
            {value: lowSendValue},
            doubleForwardMessage,
        );

        checkForwardMessage(doubleForwardMessage, result.transactions);

        // treasure -> contract
        // contract -> treasure
        expect(result.events.length).toEqual(2);
    });

    it("Should not increase balance when Forward is called twice", async () => {
        await contract.send(
            treasure.getSender(),
            {value: lowSendValue},
            doubleForwardMessage,
        );

        const balance: bigint = (await blockchain.getContract(contract.address))
            .balance;

        expect(balance).toEqual(balanceBefore);
    });

    it("Should send 2 messages: first with mode SendPayFwdFeesSeparately, second is forward", async () => {
        const result = await contract.send(
            treasure.getSender(),
            {value: lowSendValue},
            messageAndForwardMessage,
        );

        checkForwardMessage(messageAndForwardMessage, result.transactions);

        // treasure -> zeroContract
        // zeroContract -> treasure SendPayFwdFeesSeparately mode
        // zeroContract -> treasure  SendRemainingValue mode
        expect(result.events.length).toEqual(3);
    });

    it("Should decrease the balance when two messages are sent: the first with SendPayFwdFeesSeparately mode, and the second is a forward message.", async () => {
        await contract.send(
            treasure.getSender(),
            {value: lowSendValue},
            messageAndForwardMessage,
        );

        const balance: bigint = (await blockchain.getContract(contract.address))
            .balance;

        //  SendRemainingValue mode only calculate gas correct when it only 1 message
        expect(balance).toBeLessThan(balanceBefore);
    });
});
