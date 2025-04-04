import { beginCell, toNano, type Cell } from "@ton/core";
import type { SandboxContract, TreasuryContract } from "@ton/sandbox";
import { Blockchain, type BlockchainSnapshot } from "@ton/sandbox";
import { TraitsConstantContract } from "./output/base-trait-constant-override-1_TraitsConstantContract";
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
    let treasure: SandboxContract<TreasuryContract>;
    let contract: SandboxContract<TraitsConstantContract>;
    let zeroContract: SandboxContract<TraitsConstantContractZeroReserve>;
    let snapshot: BlockchainSnapshot;

    let balanceBeforeContractZero: bigint;
    const reserved: bigint = toNano("0.1");

    beforeEach(async () => {
        blockchain = await Blockchain.create();
        treasure = await blockchain.treasury("treasure");

        contract = blockchain.openContract(
            await TraitsConstantContract.fromInit(),
        );

        const deployResult = await contract.send(
            treasure.getSender(),
            { value: toNano("0.05") },
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
            { value: toNano("0.05") },
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

        snapshot = blockchain.snapshot();
    });

    it("should override constant correctly", async () => {
        expect(await contract.getConstant()).toEqual(reserved);
    });

    describe("reply test", () => {
        it("zeroContract", async () => {
            const replyMessage: Reply = {
                $$type: "Reply",
                body: beginCell().endCell(),
            };

            const result = await zeroContract.send(
                treasure.getSender(),
                { value: toNano("0.5") },
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

        it("contract", async () => {
            const replyMessage: Reply = {
                $$type: "Reply",
                body: beginCell().endCell(),
            };

            const result = await contract.send(
                treasure.getSender(),
                { value: toNano("0.5") },
                replyMessage,
            );

            expect(result.transactions).toHaveTransaction({
                from: contract.address,
                to: treasure.address,
                inMessageBounceable: true,
            });
            const balance: bigint = (
                await blockchain.getContract(contract.address)
            ).balance;
            expect(balance).toEqual(reserved);
        });
    });

    describe("notify test", () => {
        it("zeroContract", async () => {
            const notifyMessage: Notify = {
                $$type: "Notify",
                body: beginCell().endCell(),
            };
            const result = await zeroContract.send(
                treasure.getSender(),
                { value: toNano("0.5") },
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

        it("contract", async () => {
            const notifyMessage: Notify = {
                $$type: "Notify",
                body: beginCell().endCell(),
            };
            const result = await contract.send(
                treasure.getSender(),
                { value: toNano("0.5") },
                notifyMessage,
            );

            expect(result.transactions).toHaveTransaction({
                from: contract.address,
                to: treasure.address,
                inMessageBounceable: false,
            });
            const balance: bigint = (
                await blockchain.getContract(contract.address)
            ).balance;
            expect(balance).toEqual(reserved);
        });
    });

    describe("forward test", () => {
        beforeEach(async () => {
            await blockchain.loadFrom(snapshot);
        });

        it("should send init", async () => {
            const initCode: Cell = beginCell().endCell();
            const initData: Cell = beginCell().endCell();

            const init: StateInit = {
                $$type: "StateInit",
                code: initCode,
                data: initData,
            };

            const forwardMessage: Forward = {
                $$type: "Forward",
                to: treasure.address,
                body: beginCell().endCell(),
                bounce: false,
                init: init,
            };

            const result = await contract.send(
                treasure.getSender(),
                { value: toNano("0.5") },
                forwardMessage,
            );

            expect(result.transactions).toHaveTransaction({
                from: contract.address,
                to: treasure.address,
                initCode: initCode,
                initData: initData,
            });

            const balance: bigint = (
                await blockchain.getContract(contract.address)
            ).balance;
            expect(balance).toEqual(reserved);
        });

        describe("contract", () => {
            it("default message", async () => {
                const forwardMessage: Forward = {
                    $$type: "Forward",
                    to: treasure.address,
                    body: beginCell().endCell(),
                    bounce: false,
                    init: null,
                };

                const result = await contract.send(
                    treasure.getSender(),
                    { value: toNano("0.5") },
                    forwardMessage,
                );

                expect(result.transactions).toHaveTransaction({
                    from: contract.address,
                    to: treasure.address,
                    inMessageBounceable: false,
                });
                const balance: bigint = (
                    await blockchain.getContract(contract.address)
                ).balance;
                expect(balance).toEqual(reserved);
            });

            it("balance after < reserved, should not send message", async () => {
                const forwardMessage: Forward = {
                    $$type: "Forward",
                    to: treasure.address,
                    body: beginCell().endCell(),
                    bounce: false,
                    init: null,
                };

                const result = await contract.send(
                    treasure.getSender(),
                    { value: toNano("0.05") },
                    forwardMessage,
                );

                expect(result.transactions).toHaveTransaction({
                    from: treasure.address,
                    to: contract.address,
                    actionResultCode: 37,
                });
            });

            it("should leave all tons except of self.storageReserve", async () => {
                await contract.send(
                    treasure.getSender(),
                    { value: toNano("10") },
                    null,
                );

                const forwardMessage: Forward = {
                    $$type: "Forward",
                    to: treasure.address,
                    body: beginCell().endCell(),
                    bounce: false,
                    init: null,
                };

                const result = await contract.send(
                    treasure.getSender(),
                    { value: toNano("0.05") },
                    forwardMessage,
                );

                expect(result.transactions).toHaveTransaction({
                    from: treasure.address,
                    to: contract.address,
                    exitCode: 0,
                    actionResultCode: 0,
                });

                const balance: bigint = (
                    await blockchain.getContract(contract.address)
                ).balance;

                expect(balance).toBeGreaterThan(reserved); // 10 in fact
            });

            it("should send init with reserved value", async () => {
                const initCode: Cell = beginCell().endCell();
                const initData: Cell = beginCell().endCell();

                const init: StateInit = {
                    $$type: "StateInit",
                    code: initCode,
                    data: initData,
                };

                const forwardMessage: Forward = {
                    $$type: "Forward",
                    to: treasure.address,
                    body: beginCell().endCell(),
                    bounce: false,
                    init: init,
                };

                const result = await contract.send(
                    treasure.getSender(),
                    { value: toNano("0.5") },
                    forwardMessage,
                );

                expect(result.transactions).toHaveTransaction({
                    from: contract.address,
                    to: treasure.address,
                    inMessageBounceable: false,
                    initCode: initCode,
                    initData: initData,
                });
                const balance: bigint = (
                    await blockchain.getContract(contract.address)
                ).balance;
                expect(balance).toEqual(reserved);
            });
        });
    });

    describe("Double forward test", () => {
        it("zeroContract", async () => {
            const doubleForwardMessage: DoubleForward = {
                $$type: "DoubleForward",
                to: treasure.address,
                body: beginCell().endCell(),
                bounce: false,
                init: null,
            };

            const result = await zeroContract.send(
                treasure.getSender(),
                { value: toNano("0.5") },
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

            expect(result.events.length).toEqual(2);
        });

        it("contract", async () => {
            const doubleForwardMessage: DoubleForward = {
                $$type: "DoubleForward",
                to: treasure.address,
                body: beginCell().endCell(),
                bounce: false,
                init: null,
            };

            const result = await contract.send(
                treasure.getSender(),
                { value: toNano("0.5") },
                doubleForwardMessage,
            );

            expect(result.transactions).toHaveTransaction({
                from: treasure.address,
                to: contract.address,
                actionResultCode: 37,
            });
        });
    });

    describe("message and forward test", () => {
        it("zeroContract", async () => {
            const messageAndForwardMessage: MessageAndForward = {
                $$type: "MessageAndForward",
                to: treasure.address,
                body: beginCell().endCell(),
                bounce: false,
                init: null,
                mode: 1n,
                value: 1n,
            };

            const result = await zeroContract.send(
                treasure.getSender(),
                { value: toNano("0.5") },
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
            expect(balance).toBeLessThan(balanceBeforeContractZero);

            expect(result.events.length).toEqual(3);
        });

        it("contract", async () => {
            const messageAndForwardMessage: MessageAndForward = {
                $$type: "MessageAndForward",
                to: treasure.address,
                body: beginCell().endCell(),
                bounce: false,
                init: null,
                mode: 1n,
                value: 1n,
            };

            const result = await contract.send(
                treasure.getSender(),
                { value: toNano("5") },
                messageAndForwardMessage,
            );

            expect(result.transactions).toHaveTransaction({
                from: contract.address,
                to: treasure.address,
                inMessageBounceable: false,
            });
            const balance: bigint = (
                await blockchain.getContract(contract.address)
            ).balance;
            expect(balance).toEqual(reserved);

            expect(result.events.length).toEqual(3);
        });

        it("contract with mode 64", async () => {
            const messageAndForwardMessage: MessageAndForward = {
                $$type: "MessageAndForward",
                to: treasure.address,
                body: beginCell().endCell(),
                bounce: false,
                init: null,
                mode: 64n,
                value: 1n,
            };

            const result = await contract.send(
                treasure.getSender(),
                { value: toNano("5") },
                messageAndForwardMessage,
            );

            expect(result.transactions).toHaveTransaction({
                from: treasure.address,
                to: contract.address,
                actionResultCode: 37,
            });
        });
    });

    describe("with reserved value", () => {
        it("zeroContract", async () => {
            const reservedMessage: Reserving = {
                $$type: "Reserving",
                reserve: 0n,
                reserveMode: 4n,
                to: treasure.address,
                body: null,
                bounce: false,
                init: null,
            };

            const result = await zeroContract.send(
                treasure.getSender(),
                { value: toNano("5") },
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

            expect(balance).toEqual(balanceBeforeContractZero);
        });
        it("contract", async () => {
            const reservedMessage: Reserving = {
                $$type: "Reserving",
                reserve: 0n,
                reserveMode: 4n,
                to: treasure.address,
                body: null,
                bounce: false,
                init: null,
            };

            const result = await contract.send(
                treasure.getSender(),
                { value: toNano("5") },
                reservedMessage,
            );

            expect(result.transactions).toHaveTransaction({
                from: treasure.address,
                to: contract.address,
                success: true,
            });

            const balance: bigint = (
                await blockchain.getContract(contract.address)
            ).balance;

            expect(balance).toBeGreaterThan(balanceBeforeContractZero);
        });
    });
});
