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
} from "./output/negative_Negative";

import { Negative } from "./output/negative_Negative";

import "@ton/test-utils";

import { setStoragePrices } from "@/test/e2e-emulated/traits/base-trait/gasUtils";

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

    const defaultBody: Cell = beginCell().storeStringRefTail("body").endCell();

    const replyMessage: Reply = {
        $$type: "Reply",
        body: defaultBody,
    };

    const notifyMessage: Notify = {
        $$type: "Notify",
        body: defaultBody,
    };

    const blockchain: Blockchain = await Blockchain.create();

    const config = blockchain.config;

    blockchain.setConfig(
        setStoragePrices(config, {
            unix_time_since: 0,
            bit_price_ps: 0n,
            cell_price_ps: 0n,
            mc_bit_price_ps: 0n,
            mc_cell_price_ps: 0n,
        }),
    );

    const treasury: SandboxContract<TreasuryContract> =
        await blockchain.treasury("treasury");

    const contract: SandboxContract<Negative> = blockchain.openContract(
        await Negative.fromInit(),
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

    const balanceBefore = (await blockchain.getContract(contract.address))
        .balance;

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

    return {
        deployValue,
        lowSendValue,
        SendPayFwdFeesSeparately,
        SendRemainingValue,
        initCode,
        initData,
        init,
        defaultBody,
        replyMessage,
        notifyMessage,
        forwardMessage,
        doubleForwardMessage,
        messageAndForwardMessage,
        blockchain,
        treasury,
        contract,
        balanceBefore,
    };
};

describe("baseTrait with changing storageReserve to -1 (negative case)", () => {
    // The same logic as in the empty case
    beforeEach(async () => {});

    it("should send Reply message with argument of reply", async () => {
        const { contract, replyMessage, lowSendValue, defaultBody, treasury } =
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
            body: defaultBody,
        });
    });

    it("should not increase contract balance after Reply message", async () => {
        const {
            contract,
            treasury,
            lowSendValue,
            replyMessage,
            blockchain,
            balanceBefore,
        } = await setup();
        await contract.send(
            treasury.getSender(),
            { value: lowSendValue },
            replyMessage,
        );
        const balance: bigint = (await blockchain.getContract(contract.address))
            .balance;

        expect(balance).toEqual(balanceBefore);
    });

    it("should send Notify message with argument of notify", async () => {
        const { contract, treasury, lowSendValue, notifyMessage, defaultBody } =
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
            body: defaultBody,
        });
    });

    it("should not increase contract balance after Notify message", async () => {
        const {
            contract,
            treasury,
            lowSendValue,
            notifyMessage,
            blockchain,
            balanceBefore,
        } = await setup();
        await contract.send(
            treasury.getSender(),
            { value: lowSendValue },
            notifyMessage,
        );

        const balance: bigint = (await blockchain.getContract(contract.address))
            .balance;

        expect(balance).toEqual(balanceBefore);
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
        });
    });

    it("should not increase contract balance after Forward message", async () => {
        const {
            contract,
            treasury,
            lowSendValue,
            forwardMessage,
            blockchain,
            balanceBefore,
        } = await setup();
        await contract.send(
            treasury.getSender(),
            { value: lowSendValue },
            forwardMessage,
        );

        const balance: bigint = (await blockchain.getContract(contract.address))
            .balance;

        expect(balance).toEqual(balanceBefore);
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
        });
    });

    it("should not increase contract balance after Forward message without body", async () => {
        const {
            contract,
            treasury,
            lowSendValue,
            forwardMessage,
            blockchain,
            balanceBefore,
        } = await setup();
        forwardMessage.body = null;

        await contract.send(
            treasury.getSender(),
            { value: lowSendValue },
            forwardMessage,
        );

        const balance: bigint = (await blockchain.getContract(contract.address))
            .balance;

        expect(balance).toEqual(balanceBefore);
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

    it("should not increase contract balance after Forward message with init", async () => {
        const {
            contract,
            treasury,
            lowSendValue,
            forwardMessage,
            init,
            blockchain,
            balanceBefore,
        } = await setup();
        forwardMessage.init = init;

        await contract.send(
            treasury.getSender(),
            { value: lowSendValue },
            forwardMessage,
        );

        const balance: bigint = (await blockchain.getContract(contract.address))
            .balance;

        expect(balance).toEqual(balanceBefore);
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
            initCode: init.code,
            initData: init.data,
        });
    });

    it("should not increase contract balance after Forward message without body and with init", async () => {
        const {
            contract,
            treasury,
            lowSendValue,
            forwardMessage,
            init,
            blockchain,
            balanceBefore,
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

        expect(balance).toEqual(balanceBefore);
    });

    it("should send only one message, even if Forward is called twice", async () => {
        const { contract, treasury, lowSendValue, doubleForwardMessage } =
            await setup();
        const result = await contract.send(
            treasury.getSender(),
            { value: lowSendValue },
            doubleForwardMessage,
        );

        expect(result.transactions).toHaveTransaction({
            from: contract.address,
            to: treasury.address,
            inMessageBounceable: doubleForwardMessage.bounce,
            body: doubleForwardMessage.body!,
        });

        // treasury -> contract
        // contract -> treasury
        expect(result.events.length).toEqual(2);
    });

    it("should not increase balance when Forward is called twice", async () => {
        const {
            contract,
            treasury,
            lowSendValue,
            doubleForwardMessage,
            blockchain,
            balanceBefore,
        } = await setup();
        await contract.send(
            treasury.getSender(),
            { value: lowSendValue },
            doubleForwardMessage,
        );

        const balance: bigint = (await blockchain.getContract(contract.address))
            .balance;

        expect(balance).toEqual(balanceBefore);
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
        });

        // treasury -> contract
        // contract -> treasury SendPayFwdFeesSeparately mode
        // contract -> treasury  SendRemainingValue mode
        expect(result.events.length).toEqual(3);
    });

    it("should decrease the balance when two messages are sent: the first with SendPayFwdFeesSeparately mode, and the second is a forward message.", async () => {
        const {
            contract,
            treasury,
            lowSendValue,
            messageAndForwardMessage,
            blockchain,
            balanceBefore,
        } = await setup();
        await contract.send(
            treasury.getSender(),
            { value: lowSendValue },
            messageAndForwardMessage,
        );

        const balance: bigint = (await blockchain.getContract(contract.address))
            .balance;

        //  SendRemainingValue mode only calculate gas correct when it only 1 message
        expect(balance).toBeLessThan(balanceBefore);
    });

    it("should send only one message and not fail during the action phase", async () => {
        const {
            contract,
            treasury,
            lowSendValue,
            messageAndForwardMessage,
            SendRemainingValue,
        } = await setup();
        messageAndForwardMessage.mode = SendRemainingValue;

        const result = await contract.send(
            treasury.getSender(),
            { value: lowSendValue },
            messageAndForwardMessage,
        );

        expect(result.transactions).toHaveTransaction({
            from: treasury.address,
            to: contract.address,
            success: true,
        });

        // treasury -> contract
        // contract -> treasury  SendRemainingValue mode
        expect(result.events.length).toEqual(2);
    });
});
