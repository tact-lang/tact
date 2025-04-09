import { beginCell, toNano, type Cell } from "@ton/core";
import type { SandboxContract, TreasuryContract } from "@ton/sandbox";
import { Blockchain } from "@ton/sandbox";
import {
    TraitsConstantContract,
    TraitsConstantContract_errors_backward,
} from "./output/base-trait-constant-override-1_TraitsConstantContract";
import { TraitsConstantContractZeroReserve } from "./output/base-trait-constant-override-1_TraitsConstantContractZeroReserve";
import type {
    Reply,
    Notify,
    Forward,
    DoubleForward,
    MessageAndForward,
    Reserving,
    StateInit,
} from "./output/base-trait-constant-override-1_TraitsConstantContract";
import "@ton/test-utils";

describe("base-trait-constant-override-1", () => {
    let blockchain: Blockchain;

    const reserved: bigint = TraitsConstantContract.storageReserve;

    let treasure: SandboxContract<TreasuryContract>;
    let contract: SandboxContract<TraitsConstantContract>;
    let zeroContract: SandboxContract<TraitsConstantContractZeroReserve>; // contract with storageReserve = 0

    let balanceBeforeContractZero: bigint;
    const deployValue = toNano("0.05");
    const lowSendValue = toNano("0.5");
    const highSendValue = toNano("10");
    const NotEnoughToncoin =
        TraitsConstantContract_errors_backward["Not enough Toncoin"];

    const SendRemainingValue = 64n;
    const SendPayFwdFeesSeparately = 1n;

    const ReserveExact = 0n;
    const ReserveAddOriginalBalance = 4n;

    const initCode: Cell = beginCell().endCell();
    const initData: Cell = beginCell().endCell();

    beforeEach(async () => {
        blockchain = await Blockchain.create();
        treasure = await blockchain.treasury("treasure");

        contract = blockchain.openContract(
            await TraitsConstantContract.fromInit(),
        );

        const deployResult = await contract.send(
            treasure.getSender(),
            { value: deployValue },
            null,
        );

        expect(deployResult.transactions).toHaveTransaction({
            from: treasure.address,
            to: contract.address,
            success: true,
            deploy: true,
        });

        zeroContract = blockchain.openContract(
            await TraitsConstantContractZeroReserve.fromInit(),
        );

        const deployResultZero = await zeroContract.send(
            treasure.getSender(),
            { value: deployValue },
            null,
        );

        expect(deployResultZero.transactions).toHaveTransaction({
            from: treasure.address,
            to: zeroContract.address,
            success: true,
            deploy: true,
        });

        balanceBeforeContractZero = (
            await blockchain.getContract(zeroContract.address)
        ).balance;
    });

    it("should override constant correctly", async () => {
        // Verifying that the storageReserve constant is correctly overridden
        // and returns the expected value
        expect(await contract.getConstant()).toEqual(reserved);
    });

    it("Reply / zeroContract", async () => {
        const replyMessage: Reply = {
            $$type: "Reply",
            body: beginCell().endCell(),
        };

        // Send a Reply message to the contract with zero reserve
        // and verify it correctly sends a reply message to the treasury
        const result = await zeroContract.send(
            treasure.getSender(),
            { value: lowSendValue },
            replyMessage,
        );

        expect(result.transactions).toHaveTransaction({
            from: zeroContract.address,
            to: treasure.address,
            inMessageBounceable: true,
        });

        const balance: bigint = (
            await blockchain.getContract(zeroContract.address)
        ).balance;

        expect(balance).toEqual(balanceBeforeContractZero);
    });

    it("Reply / contract", async () => {
        const replyMessage: Reply = {
            $$type: "Reply",
            body: beginCell().endCell(),
        };

        // Send a Reply message to the contract
        // and verify that after sending the reply message, the balance equals the reserved amount
        const result = await contract.send(
            treasure.getSender(),
            { value: lowSendValue },
            replyMessage,
        );

        expect(result.transactions).toHaveTransaction({
            from: contract.address,
            to: treasure.address,
            inMessageBounceable: true,
        });
        const balance: bigint = (await blockchain.getContract(contract.address))
            .balance;

        expect(balance).toEqual(reserved);
    });

    it("Notify / zeroContract", async () => {
        const notifyMessage: Notify = {
            $$type: "Notify",
            body: beginCell().endCell(),
        };

        // Send a Notify message to the contract with zero reserve
        // and verify that a non-bounceable message is sent
        const result = await zeroContract.send(
            treasure.getSender(),
            { value: lowSendValue },
            notifyMessage,
        );

        expect(result.transactions).toHaveTransaction({
            from: zeroContract.address,
            to: treasure.address,
            inMessageBounceable: false,
        });

        const balance: bigint = (
            await blockchain.getContract(zeroContract.address)
        ).balance;

        expect(balance).toEqual(balanceBeforeContractZero);
    });

    it("Notify / contract", async () => {
        const notifyMessage: Notify = {
            $$type: "Notify",
            body: beginCell().endCell(),
        };

        // Send a Notify message to the main contract
        // and verify that after sending, the balance equals the reserved amount
        const result = await contract.send(
            treasure.getSender(),
            { value: lowSendValue },
            notifyMessage,
        );

        expect(result.transactions).toHaveTransaction({
            from: contract.address,
            to: treasure.address,
            inMessageBounceable: false,
        });

        const balance: bigint = (await blockchain.getContract(contract.address))
            .balance;

        expect(balance).toEqual(reserved);
    });

    it("Forward / should send init", async () => {
        const initCode: Cell = beginCell().endCell();
        const initData: Cell = beginCell().endCell();

        const init: StateInit = {
            $$type: "StateInit",
            code: initCode,
            data: initData,
        };

        // Create a Forward message with initialization and verify
        // that the message is sent with init code and data
        const forwardMessage: Forward = {
            $$type: "Forward",
            to: treasure.address,
            body: beginCell().endCell(),
            bounce: false,
            init: init,
        };

        const result = await contract.send(
            treasure.getSender(),
            { value: lowSendValue },
            forwardMessage,
        );

        expect(result.transactions).toHaveTransaction({
            from: contract.address,
            to: treasure.address,
            initCode: initCode,
            initData: initData,
        });

        const balance: bigint = (await blockchain.getContract(contract.address))
            .balance;

        expect(balance).toEqual(reserved);
    });

    it("Forward / contact / default message", async () => {
        const forwardMessage: Forward = {
            $$type: "Forward",
            to: treasure.address,
            body: beginCell().endCell(),
            bounce: false,
            init: null,
        };

        const result = await contract.send(
            treasure.getSender(),
            { value: lowSendValue },
            forwardMessage,
        );

        expect(result.transactions).toHaveTransaction({
            from: contract.address,
            to: treasure.address,
            inMessageBounceable: false,
        });

        const balance: bigint = (await blockchain.getContract(contract.address))
            .balance;

        expect(balance).toEqual(reserved);
    });

    it("Forward / contract / balance after < reserved, should not send message", async () => {
        const forwardMessage: Forward = {
            $$type: "Forward",
            to: treasure.address,
            body: beginCell().endCell(),
            bounce: false,
            init: null,
        };

        // Try to send a message with insufficient balance
        // and verify that a NotEnoughToncoin error is thrown
        const result = await contract.send(
            treasure.getSender(),
            { value: reserved - deployValue - 1n }, // because we want balance < reserved
            forwardMessage,
        );

        expect(result.transactions).toHaveTransaction({
            from: treasure.address,
            to: contract.address,
            actionResultCode: NotEnoughToncoin,
        });
    });

    it("Forward/ contract / should leave all tons except of self.storageReserve", async () => {
        await contract.send(
            treasure.getSender(),
            { value: highSendValue },
            null,
        );

        const forwardMessage: Forward = {
            $$type: "Forward",
            to: treasure.address,
            body: beginCell().endCell(),
            bounce: false,
            init: null,
        };

        // Send another message and verify
        // that the balance after sending the message is not equal reserved amount
        const result = await contract.send(
            treasure.getSender(),
            { value: lowSendValue },
            forwardMessage,
        );

        expect(result.transactions).toHaveTransaction({
            from: treasure.address,
            to: contract.address,
            exitCode: 0,
            actionResultCode: 0,
        });

        const balance: bigint = (await blockchain.getContract(contract.address))
            .balance;

        expect(balance).not.toEqual(reserved); // 10 in fact
    });

    it("Forward/ zeroContract / should send init", async () => {
        const init: StateInit = {
            $$type: "StateInit",
            code: initCode,
            data: initData,
        };

        // Create a Forward message with init and verify
        // that after sending, we send Remaining Value
        const forwardMessage: Forward = {
            $$type: "Forward",
            to: treasure.address,
            body: beginCell().endCell(),
            bounce: false,
            init: init,
        };

        const result = await zeroContract.send(
            treasure.getSender(),
            { value: lowSendValue },
            forwardMessage,
        );

        expect(result.transactions).toHaveTransaction({
            from: zeroContract.address,
            to: treasure.address,
            inMessageBounceable: false,
            initCode: initCode,
            initData: initData,
        });

        const balance: bigint = (
            await blockchain.getContract(zeroContract.address)
        ).balance;

        expect(balance).toEqual(balanceBeforeContractZero);
    });

    it("Forward/ contract / should send init", async () => {
        const init: StateInit = {
            $$type: "StateInit",
            code: initCode,
            data: initData,
        };

        // Create a Forward message with init and verify
        // that after sending, the balance equals the reserved amount
        const forwardMessage: Forward = {
            $$type: "Forward",
            to: treasure.address,
            body: beginCell().endCell(),
            bounce: false,
            init: init,
        };

        const result = await contract.send(
            treasure.getSender(),
            { value: lowSendValue },
            forwardMessage,
        );

        expect(result.transactions).toHaveTransaction({
            from: contract.address,
            to: treasure.address,
            inMessageBounceable: false,
            initCode: initCode,
            initData: initData,
        });

        const balance: bigint = (await blockchain.getContract(contract.address))
            .balance;

        expect(balance).toEqual(reserved);
    });

    it("DoubleForward/ zeroContract / tests double forwarding", async () => {
        const doubleForwardMessage: DoubleForward = {
            $$type: "DoubleForward",
            to: treasure.address,
            body: beginCell().endCell(),
            bounce: false,
            init: null,
        };

        // Test sending a DoubleForward message to the contract with zero reserve
        // and ensure that the balance remains unchanged and contract send only 1 message
        const result = await zeroContract.send(
            treasure.getSender(),
            { value: lowSendValue },
            doubleForwardMessage,
        );

        expect(result.transactions).toHaveTransaction({
            from: zeroContract.address,
            to: treasure.address,
            inMessageBounceable: false,
        });

        const balance: bigint = (
            await blockchain.getContract(zeroContract.address)
        ).balance;

        expect(balance).toEqual(balanceBeforeContractZero);

        // treasure -> zeroContract
        // zeroContract -> treasure
        expect(result.events.length).toEqual(2);
    });

    it("DoubleForward/ contract / test double forwarding", async () => {
        const doubleForwardMessage: DoubleForward = {
            $$type: "DoubleForward",
            to: treasure.address,
            body: beginCell().endCell(),
            bounce: false,
            init: null,
        };

        // Test sending a DoubleForward message to the main contract
        // and ensure that an error occurs due to insufficient funds
        const result = await contract.send(
            treasure.getSender(),
            { value: lowSendValue },
            doubleForwardMessage,
        );

        expect(result.transactions).toHaveTransaction({
            from: treasure.address,
            to: contract.address,
            actionResultCode: NotEnoughToncoin,
        });
    });

    it("MessageAndForward/ zeroContract / test message sending with forward", async () => {
        const messageAndForwardMessage: MessageAndForward = {
            $$type: "MessageAndForward",
            to: treasure.address,
            body: beginCell().endCell(),
            bounce: false,
            init: null,
            mode: SendPayFwdFeesSeparately,
            value: 1n,
        };

        // Send a MessageAndForward message to the contract with zero reserve
        // and verify that balance decreased
        const result = await zeroContract.send(
            treasure.getSender(),
            { value: lowSendValue },
            messageAndForwardMessage,
        );

        expect(result.transactions).toHaveTransaction({
            from: zeroContract.address,
            to: treasure.address,
            inMessageBounceable: false,
        });

        const balance: bigint = (
            await blockchain.getContract(zeroContract.address)
        ).balance;

        //  SendRemainingValue mode only calculate gas correct when it only 1 message
        expect(balance).toBeLessThan(balanceBeforeContractZero);

        // treasure -> zeroContract
        // zeroContract -> treasure SendPayFwdFeesSeparately mode
        // zeroContract -> treasure  SendRemainingValue mode
        expect(result.events.length).toEqual(3);
    });

    it("MessageAndForward/ contract / test message sending with forward", async () => {
        const messageAndForwardMessage: MessageAndForward = {
            $$type: "MessageAndForward",
            to: treasure.address,
            body: beginCell().endCell(),
            bounce: false,
            init: null,
            mode: SendPayFwdFeesSeparately,
            value: 1n,
        };

        // Send a MessageAndForward message to the contract
        // and verify that balance equals reserved amount
        const result = await contract.send(
            treasure.getSender(),
            { value: highSendValue },
            messageAndForwardMessage,
        );

        expect(result.transactions).toHaveTransaction({
            from: contract.address,
            to: treasure.address,
            inMessageBounceable: false,
        });

        const balance: bigint = (await blockchain.getContract(contract.address))
            .balance;

        expect(balance).toEqual(reserved);

        // treasure -> contract
        // contract -> treasure SendPayFwdFeesSeparately mode
        // contract -> treasure   SendRemainingBalance mode with reserve
        expect(result.events.length).toEqual(3);
    });

    it("MessageAndForward/ contract / with mode SendRemainingValue", async () => {
        const messageAndForwardMessage: MessageAndForward = {
            $$type: "MessageAndForward",
            to: treasure.address,
            body: beginCell().endCell(),
            bounce: false,
            init: null,
            mode: SendRemainingValue,
            value: 0n,
        };

        // Send a MessageAndForward message with mode SendRemainingValue
        // and verify that an error occurs due to insufficient funds
        const result = await contract.send(
            treasure.getSender(),
            { value: highSendValue },
            messageAndForwardMessage,
        );

        expect(result.transactions).toHaveTransaction({
            from: treasure.address,
            to: contract.address,
            actionResultCode: NotEnoughToncoin,
        });
    });

    it("Reserving/ zeroContract test", async () => {
        const reservedMessage: Reserving = {
            $$type: "Reserving",
            reserve: lowSendValue,
            reserveMode: ReserveExact,
            to: treasure.address,
            body: null,
            bounce: false,
            init: null,
        };

        // Send a Reserving message to the contract with zero reserve
        // and verify that rawReserve(X, 0) and  SendRemainingValue mode will calculate incorrectly
        const result = await zeroContract.send(
            treasure.getSender(),
            { value: highSendValue },
            reservedMessage,
        );

        expect(result.transactions).toHaveTransaction({
            from: treasure.address,
            to: zeroContract.address,
            success: true,
        });

        const balance: bigint = (
            await blockchain.getContract(zeroContract.address)
        ).balance;

        expect(balance).toBeGreaterThan(lowSendValue);
    });
    it("Reserving/ contract test", async () => {
        const reservedMessage: Reserving = {
            $$type: "Reserving",
            reserve: ReserveExact,
            reserveMode: ReserveAddOriginalBalance,
            to: treasure.address,
            body: null,
            bounce: false,
            init: null,
        };

        // Send a Reserving message to the main contract
        // and verify that the balance increased ( it calculate gas incorrectly )
        const result = await contract.send(
            treasure.getSender(),
            { value: highSendValue },
            reservedMessage,
        );

        expect(result.transactions).toHaveTransaction({
            from: treasure.address,
            to: contract.address,
            success: true,
        });

        const balance: bigint = (await blockchain.getContract(contract.address))
            .balance;

        expect(balance).toBeGreaterThan(balanceBeforeContractZero);
    });
});
