import { beginCell, toNano, type Cell } from "@ton/core";
import type { SandboxContract, TreasuryContract } from "@ton/sandbox";
import { Blockchain } from "@ton/sandbox";
import type {
    Reply,
    Notify,
    Forward,
    DoubleForward,
    MessageAndForward,
    StateInit,
} from "./output/reserved_Reserved";

import { Reserved } from "./output/reserved_Reserved";

import "@ton/test-utils";

const setup = async () => {
    const deployValue = toNano("0.05");
    const lowSendValue = toNano("0.5");

    const SendPayFwdFeesSeparately = 1n;
    const SendRemainingValue = 64n;

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

    const blockchain: Blockchain = await Blockchain.create();
    const treasury: SandboxContract<TreasuryContract> =
        await blockchain.treasury("treasury");

    const contract: SandboxContract<Reserved> = blockchain.openContract(
        await Reserved.fromInit(),
    );

    const deployResult = await contract.send(
        treasury.getSender(),
        { value: deployValue },
        null,
    );

    expect(deployResult.transactions).toHaveTransaction({
        from: treasury.address,
        to: contract.address,
        success: true,
        deploy: true,
    });

    const reservedAmount: bigint = Reserved.storageReserve;

    const forwardMessage: Forward = {
        $$type: "Forward",
        to: treasury.address,
        body: defaultBody,
        bounce: false,
        init: null,
    };

    const doubleForwardMessage: DoubleForward = {
        $$type: "DoubleForward",
        to: treasury.address,
        body: defaultBody,
        bounce: false,
        init: null,
    };

    const messageAndForwardMessage: MessageAndForward = {
        $$type: "MessageAndForward",
        to: treasury.address,
        body: defaultBody,
        bounce: false,
        init: null,
        mode: SendPayFwdFeesSeparately,
        value: 1n,
    };

    const balanceBefore = (await blockchain.getContract(contract.address))
        .balance;

    return {
        lowSendValue,
        SendRemainingValue,
        initCode,
        initData,
        init,
        replyMessage,
        notifyMessage,
        forwardMessage,
        doubleForwardMessage,
        messageAndForwardMessage,
        blockchain,
        treasury,
        contract,
        reservedAmount,
        balanceBefore,
    };
};

describe("baseTrait with changing self.storageReserve to 0.1 ton", () => {
    beforeEach(async () => {});

    it("should send Reply message with argument of reply", async () => {
        const { contract, treasury, lowSendValue, replyMessage } =
            await setup();

        const result = await contract.send(
            treasury.getSender(),
            { value: lowSendValue },
            replyMessage,
        );

        expect(result.transactions).toHaveTransaction({
            from: contract.address,
            to: treasury.address,
            inMessageBounceable: true,
            body: replyMessage.body!,
        });
    });

    it("should reserve contract balance after Reply message", async () => {
        const {
            contract,
            treasury,
            lowSendValue,
            replyMessage,
            reservedAmount,
            blockchain,
        } = await setup();

        await contract.send(
            treasury.getSender(),
            { value: lowSendValue },
            replyMessage,
        );
        const balance: bigint = (await blockchain.getContract(contract.address))
            .balance;

        expect(balance).toEqual(reservedAmount);
    });

    it("should send Notify message with argument of notify", async () => {
        const { contract, treasury, lowSendValue, notifyMessage } =
            await setup();

        const result = await contract.send(
            treasury.getSender(),
            { value: lowSendValue },
            notifyMessage,
        );

        expect(result.transactions).toHaveTransaction({
            from: contract.address,
            to: treasury.address,
            inMessageBounceable: false,
            body: notifyMessage.body!,
        });
    });

    it("should reserve contract balance after Notify message", async () => {
        const {
            contract,
            treasury,
            lowSendValue,
            notifyMessage,
            reservedAmount,
            blockchain,
        } = await setup();

        await contract.send(
            treasury.getSender(),
            { value: lowSendValue },
            notifyMessage,
        );

        const balance: bigint = (await blockchain.getContract(contract.address))
            .balance;

        expect(balance).toEqual(reservedAmount);
    });

    it("should send Forward message with forward arguments", async () => {
        const { contract, treasury, lowSendValue, forwardMessage } =
            await setup();

        const result = await contract.send(
            treasury.getSender(),
            { value: lowSendValue },
            forwardMessage,
        );

        expect(result.transactions).toHaveTransaction({
            from: contract.address,
            to: treasury.address,
            inMessageBounceable: forwardMessage.bounce,
            body: forwardMessage.body!,
            initCode: undefined,
            initData: undefined,
        });
    });

    it("should reserve contract balance after Forward message", async () => {
        const {
            contract,
            treasury,
            lowSendValue,
            forwardMessage,
            reservedAmount,
            blockchain,
        } = await setup();

        await contract.send(
            treasury.getSender(),
            { value: lowSendValue },
            forwardMessage,
        );

        const balance: bigint = (await blockchain.getContract(contract.address))
            .balance;

        expect(balance).toEqual(reservedAmount);
    });

    it("should send Forward message with forward arguments without body", async () => {
        const { contract, treasury, lowSendValue, forwardMessage } =
            await setup();

        forwardMessage.body = null;

        const result = await contract.send(
            treasury.getSender(),
            { value: lowSendValue },
            forwardMessage,
        );

        expect(result.transactions).toHaveTransaction({
            from: contract.address,
            to: treasury.address,
            inMessageBounceable: forwardMessage.bounce,
            body: beginCell().endCell(),
            initCode: undefined,
            initData: undefined,
        });
    });

    it("should reserve contract balance after Forward message without body", async () => {
        const {
            contract,
            treasury,
            lowSendValue,
            forwardMessage,
            reservedAmount,
            blockchain,
        } = await setup();

        forwardMessage.body = null;

        await contract.send(
            treasury.getSender(),
            { value: lowSendValue },
            forwardMessage,
        );

        const balance: bigint = (await blockchain.getContract(contract.address))
            .balance;

        expect(balance).toEqual(reservedAmount);
    });

    it("should send init with Forward message", async () => {
        const { contract, treasury, lowSendValue, forwardMessage, init } =
            await setup();
        forwardMessage.init = init;

        const result = await contract.send(
            treasury.getSender(),
            { value: lowSendValue },
            forwardMessage,
        );

        expect(result.transactions).toHaveTransaction({
            from: contract.address,
            to: treasury.address,
            inMessageBounceable: forwardMessage.bounce,
            body: forwardMessage.body!,
            initCode: init.code,
            initData: init.data,
        });
    });

    it("should reserve contract balance after Forward message with init", async () => {
        const {
            contract,
            treasury,
            lowSendValue,
            forwardMessage,
            reservedAmount,
            blockchain,
            init,
        } = await setup();

        forwardMessage.init = init;

        await contract.send(
            treasury.getSender(),
            { value: lowSendValue },
            forwardMessage,
        );

        const balance: bigint = (await blockchain.getContract(contract.address))
            .balance;

        expect(balance).toEqual(reservedAmount);
    });

    it("should send Forward message with forward arguments without body and with init", async () => {
        const { contract, treasury, lowSendValue, forwardMessage, init } =
            await setup();

        forwardMessage.body = null;
        forwardMessage.init = init;

        const result = await contract.send(
            treasury.getSender(),
            { value: lowSendValue },
            forwardMessage,
        );

        expect(result.transactions).toHaveTransaction({
            from: contract.address,
            to: treasury.address,
            inMessageBounceable: forwardMessage.bounce,
            body: beginCell().endCell(),
            initCode: init.code,
            initData: init.data,
        });
    });

    it("should reserve contract balance after Forward message without body and with init", async () => {
        const {
            contract,
            treasury,
            lowSendValue,
            forwardMessage,
            reservedAmount,
            blockchain,
            init,
        } = await setup();

        forwardMessage.body = null;
        forwardMessage.init = init;

        await contract.send(
            treasury.getSender(),
            { value: lowSendValue },
            forwardMessage,
        );

        const balance: bigint = (await blockchain.getContract(contract.address))
            .balance;

        expect(balance).toEqual(reservedAmount);
    });

    it("should send any message when Forward is called twice", async () => {
        const { contract, treasury, lowSendValue, doubleForwardMessage } =
            await setup();

        const result = await contract.send(
            treasury.getSender(),
            { value: lowSendValue },
            doubleForwardMessage,
        );

        expect(result.transactions).toHaveTransaction({
            from: treasury.address,
            to: contract.address,
            success: false,
        });

        expect(result.events.length).toEqual(1); // only treasury -> contract
    });

    it("should send 2 messages: first with mode SendPayFwdFeesSeparately, second is forward", async () => {
        const { contract, treasury, lowSendValue, messageAndForwardMessage } =
            await setup();

        const result = await contract.send(
            treasury.getSender(),
            { value: lowSendValue },
            messageAndForwardMessage,
        );

        expect(result.transactions).toHaveTransaction({
            from: contract.address,
            to: treasury.address,
            inMessageBounceable: messageAndForwardMessage.bounce,
            body: messageAndForwardMessage.body!,
            initCode: undefined,
            initData: undefined,
        });

        // treasury -> contract
        // contract -> treasury SendPayFwdFeesSeparately mode
        // contract -> treasury  SendRemainingValue mode
        expect(result.events.length).toEqual(3);
    });

    it("should reserve even if 2 messages are sent.", async () => {
        const {
            contract,
            treasury,
            lowSendValue,
            messageAndForwardMessage,
            reservedAmount,
            blockchain,
        } = await setup();

        await contract.send(
            treasury.getSender(),
            { value: lowSendValue },
            messageAndForwardMessage,
        );

        const balance: bigint = (await blockchain.getContract(contract.address))
            .balance;

        //  SendRemainingValue mode only calculate gas correct when it only 1 message
        expect(balance).toEqual(reservedAmount);
    });

    it("should not reserve if the balance before our message was greater than storageReserve", async () => {
        const {
            contract,
            treasury,
            lowSendValue,
            forwardMessage,
            reservedAmount,
            blockchain,
        } = await setup();

        await contract.send(
            treasury.getSender(),
            { value: reservedAmount },
            null,
        );

        await contract.send(
            treasury.getSender(),
            { value: lowSendValue },
            forwardMessage,
        );

        const balance = await blockchain.getContract(contract.address);
        expect(balance).not.toEqual(reservedAmount);
    });

    it("should failed when we have balance < storageReserved", async () => {
        const {
            contract,
            treasury,
            balanceBefore,
            forwardMessage,
            reservedAmount,
        } = await setup();

        const result = await contract.send(
            treasury.getSender(),
            { value: reservedAmount - balanceBefore - 1n },
            forwardMessage,
        );

        expect(result.transactions).toHaveTransaction({
            from: treasury.address,
            to: contract.address,
            success: false,
        });

        expect(result.events.length).toEqual(1); // only treasury -> contract
    });
});
