import type { Address, TransactionDescriptionGeneric } from "@ton/core";
import { beginCell, Cell, external, toNano } from "@ton/core";
import type {
    SandboxContract,
    SmartContractTransaction,
    TreasuryContract,
} from "@ton/sandbox";
import { Blockchain, internal } from "@ton/sandbox";
import { ReceiverTester } from "./contracts/output/receiver-precedence_ReceiverTester";
import { Calculator } from "./contracts/output/receiver-precedence_Calculator";
import "@ton/test-utils";
import { AllReceiverTester } from "./contracts/output/receiver-precedence_AllReceiverTester";
import { BinaryAndSliceReceiverTester } from "./contracts/output/receiver-precedence_BinaryAndSliceReceiverTester";
import { BinaryReceiverTester } from "./contracts/output/receiver-precedence_BinaryReceiverTester";
import { CommentAndBinaryAndSliceReceiverTester } from "./contracts/output/receiver-precedence_CommentAndBinaryAndSliceReceiverTester";
import { CommentAndBinaryReceiverTester } from "./contracts/output/receiver-precedence_CommentAndBinaryReceiverTester";
import { CommentAndSliceReceiverTester } from "./contracts/output/receiver-precedence_CommentAndSliceReceiverTester";
import { CommentAndStringAndBinaryAndSliceReceiverTester } from "./contracts/output/receiver-precedence_CommentAndStringAndBinaryAndSliceReceiverTester";
import { CommentAndStringAndBinaryReceiverTester } from "./contracts/output/receiver-precedence_CommentAndStringAndBinaryReceiverTester";
import { CommentAndStringAndSliceReceiverTester } from "./contracts/output/receiver-precedence_CommentAndStringAndSliceReceiverTester";
import { CommentAndStringReceiverTester } from "./contracts/output/receiver-precedence_CommentAndStringReceiverTester";
import { CommentReceiverTester } from "./contracts/output/receiver-precedence_CommentReceiverTester";
import { EmptyAndBinaryAndSliceReceiverTester } from "./contracts/output/receiver-precedence_EmptyAndBinaryAndSliceReceiverTester";
import { EmptyAndBinaryReceiverTester } from "./contracts/output/receiver-precedence_EmptyAndBinaryReceiverTester";
import { EmptyAndCommentAndBinaryAndSliceReceiverTester } from "./contracts/output/receiver-precedence_EmptyAndCommentAndBinaryAndSliceReceiverTester";
import { EmptyAndCommentAndBinaryReceiverTester } from "./contracts/output/receiver-precedence_EmptyAndCommentAndBinaryReceiverTester";
import { EmptyAndCommentAndSliceReceiverTester } from "./contracts/output/receiver-precedence_EmptyAndCommentAndSliceReceiverTester";
import { EmptyAndCommentAndStringAndBinaryReceiverTester } from "./contracts/output/receiver-precedence_EmptyAndCommentAndStringAndBinaryReceiverTester";
import { EmptyAndCommentAndStringAndSliceReceiverTester } from "./contracts/output/receiver-precedence_EmptyAndCommentAndStringAndSliceReceiverTester";
import { EmptyAndCommentAndStringReceiverTester } from "./contracts/output/receiver-precedence_EmptyAndCommentAndStringReceiverTester";
import { EmptyAndCommentReceiverTester } from "./contracts/output/receiver-precedence_EmptyAndCommentReceiverTester";
import { EmptyAndSliceReceiverTester } from "./contracts/output/receiver-precedence_EmptyAndSliceReceiverTester";
import { EmptyAndStringAndBinaryAndSliceReceiverTester } from "./contracts/output/receiver-precedence_EmptyAndStringAndBinaryAndSliceReceiverTester";
import { EmptyAndStringAndBinaryReceiverTester } from "./contracts/output/receiver-precedence_EmptyAndStringAndBinaryReceiverTester";
import { EmptyAndStringAndSliceReceiverTester } from "./contracts/output/receiver-precedence_EmptyAndStringAndSliceReceiverTester";
import { EmptyAndStringReceiverTester } from "./contracts/output/receiver-precedence_EmptyAndStringReceiverTester";
import { EmptyReceiverTester } from "./contracts/output/receiver-precedence_EmptyReceiverTester";
import { NoReceiverTester } from "./contracts/output/receiver-precedence_NoReceiverTester";
import { SliceReceiverTester } from "./contracts/output/receiver-precedence_SliceReceiverTester";
import { StringAndBinaryAndSliceReceiverTester } from "./contracts/output/receiver-precedence_StringAndBinaryAndSliceReceiverTester";
import { StringAndBinaryReceiverTester } from "./contracts/output/receiver-precedence_StringAndBinaryReceiverTester";
import { StringAndSliceReceiverTester } from "./contracts/output/receiver-precedence_StringAndSliceReceiverTester";
import { StringReceiverTester } from "./contracts/output/receiver-precedence_StringReceiverTester";

describe("receivers-precedence", () => {
    let blockchain: Blockchain;
    let treasure: SandboxContract<TreasuryContract>;
    let contract: SandboxContract<ReceiverTester>;
    let calculator: SandboxContract<Calculator>;

    // All combinations of contracts with receivers
    let noReceivers: SandboxContract<NoReceiverTester>;
    let emptyReceiver: SandboxContract<EmptyReceiverTester>;
    let commentReceiver: SandboxContract<CommentReceiverTester>;
    let stringReceiver: SandboxContract<StringReceiverTester>;
    let binaryReceiver: SandboxContract<BinaryReceiverTester>;
    let sliceReceiver: SandboxContract<SliceReceiverTester>;
    let emptyAndCommentReceiver: SandboxContract<EmptyAndCommentReceiverTester>;
    let emptyAndStringReceiver: SandboxContract<EmptyAndStringReceiverTester>;
    let emptyAndBinaryReceiver: SandboxContract<EmptyAndBinaryReceiverTester>;
    let emptyAndSliceReceiver: SandboxContract<EmptyAndSliceReceiverTester>;
    let commentAndStringReceiver: SandboxContract<CommentAndStringReceiverTester>;
    let commentAndBinaryReceiver: SandboxContract<CommentAndBinaryReceiverTester>;
    let commentAndSliceReceiver: SandboxContract<CommentAndSliceReceiverTester>;
    let stringAndBinaryReceiver: SandboxContract<StringAndBinaryReceiverTester>;
    let stringAndSliceReceiver: SandboxContract<StringAndSliceReceiverTester>;
    let binaryAndSliceReceiver: SandboxContract<BinaryAndSliceReceiverTester>;
    let emptyAndCommentAndStringReceiver: SandboxContract<EmptyAndCommentAndStringReceiverTester>;
    let emptyAndCommentAndBinaryReceiver: SandboxContract<EmptyAndCommentAndBinaryReceiverTester>;
    let emptyAndCommentAndSliceReceiver: SandboxContract<EmptyAndCommentAndSliceReceiverTester>;
    let emptyAndStringAndBinaryReceiver: SandboxContract<EmptyAndStringAndBinaryReceiverTester>;
    let emptyAndStringAndSliceReceiver: SandboxContract<EmptyAndStringAndSliceReceiverTester>;
    let emptyAndBinaryAndSliceReceiver: SandboxContract<EmptyAndBinaryAndSliceReceiverTester>;
    let commentAndStringAndBinaryReceiver: SandboxContract<CommentAndStringAndBinaryReceiverTester>;
    let commentAndStringAndSliceReceiver: SandboxContract<CommentAndStringAndSliceReceiverTester>;
    let commentAndBinaryAndSliceReceiver: SandboxContract<CommentAndBinaryAndSliceReceiverTester>;
    let stringAndBinaryAndSliceReceiver: SandboxContract<StringAndBinaryAndSliceReceiverTester>;
    let emptyAndCommentAndStringAndBinaryReceiver: SandboxContract<EmptyAndCommentAndStringAndBinaryReceiverTester>;
    let emptyAndCommentAndStringAndSliceReceiver: SandboxContract<EmptyAndCommentAndStringAndSliceReceiverTester>;
    let emptyAndCommentAndBinaryAndSliceReceiver: SandboxContract<EmptyAndCommentAndBinaryAndSliceReceiverTester>;
    let emptyAndStringAndBinaryAndSliceReceiver: SandboxContract<EmptyAndStringAndBinaryAndSliceReceiverTester>;
    let commentAndStringAndBinaryAndSliceReceiver: SandboxContract<CommentAndStringAndBinaryAndSliceReceiverTester>;
    let allReceivers: SandboxContract<AllReceiverTester>;

    beforeEach(async () => {
        blockchain = await Blockchain.create();
        blockchain.verbosity.print = false;
        treasure = await blockchain.treasury("treasure");

        contract = blockchain.openContract(await ReceiverTester.fromInit());
        calculator = blockchain.openContract(await Calculator.fromInit());

        // All receiver contracts
        noReceivers = blockchain.openContract(
            await NoReceiverTester.fromInit(),
        );
        emptyReceiver = blockchain.openContract(
            await EmptyReceiverTester.fromInit(),
        );
        commentReceiver = blockchain.openContract(
            await CommentReceiverTester.fromInit(),
        );
        stringReceiver = blockchain.openContract(
            await StringReceiverTester.fromInit(),
        );
        binaryReceiver = blockchain.openContract(
            await BinaryReceiverTester.fromInit(),
        );
        sliceReceiver = blockchain.openContract(
            await SliceReceiverTester.fromInit(),
        );
        emptyAndCommentReceiver = blockchain.openContract(
            await EmptyAndCommentReceiverTester.fromInit(),
        );
        emptyAndStringReceiver = blockchain.openContract(
            await EmptyAndStringReceiverTester.fromInit(),
        );
        emptyAndBinaryReceiver = blockchain.openContract(
            await EmptyAndBinaryReceiverTester.fromInit(),
        );
        emptyAndSliceReceiver = blockchain.openContract(
            await EmptyAndSliceReceiverTester.fromInit(),
        );
        commentAndStringReceiver = blockchain.openContract(
            await CommentAndStringReceiverTester.fromInit(),
        );
        commentAndBinaryReceiver = blockchain.openContract(
            await CommentAndBinaryReceiverTester.fromInit(),
        );
        commentAndSliceReceiver = blockchain.openContract(
            await CommentAndSliceReceiverTester.fromInit(),
        );
        stringAndBinaryReceiver = blockchain.openContract(
            await StringAndBinaryReceiverTester.fromInit(),
        );
        stringAndSliceReceiver = blockchain.openContract(
            await StringAndSliceReceiverTester.fromInit(),
        );
        binaryAndSliceReceiver = blockchain.openContract(
            await BinaryAndSliceReceiverTester.fromInit(),
        );
        emptyAndCommentAndStringReceiver = blockchain.openContract(
            await EmptyAndCommentAndStringReceiverTester.fromInit(),
        );
        emptyAndCommentAndBinaryReceiver = blockchain.openContract(
            await EmptyAndCommentAndBinaryReceiverTester.fromInit(),
        );
        emptyAndCommentAndSliceReceiver = blockchain.openContract(
            await EmptyAndCommentAndSliceReceiverTester.fromInit(),
        );
        emptyAndStringAndBinaryReceiver = blockchain.openContract(
            await EmptyAndStringAndBinaryReceiverTester.fromInit(),
        );
        emptyAndStringAndSliceReceiver = blockchain.openContract(
            await EmptyAndStringAndSliceReceiverTester.fromInit(),
        );
        emptyAndBinaryAndSliceReceiver = blockchain.openContract(
            await EmptyAndBinaryAndSliceReceiverTester.fromInit(),
        );
        commentAndStringAndBinaryReceiver = blockchain.openContract(
            await CommentAndStringAndBinaryReceiverTester.fromInit(),
        );
        commentAndStringAndSliceReceiver = blockchain.openContract(
            await CommentAndStringAndSliceReceiverTester.fromInit(),
        );
        commentAndBinaryAndSliceReceiver = blockchain.openContract(
            await CommentAndBinaryAndSliceReceiverTester.fromInit(),
        );
        stringAndBinaryAndSliceReceiver = blockchain.openContract(
            await StringAndBinaryAndSliceReceiverTester.fromInit(),
        );
        emptyAndCommentAndStringAndBinaryReceiver = blockchain.openContract(
            await EmptyAndCommentAndStringAndBinaryReceiverTester.fromInit(),
        );
        emptyAndCommentAndStringAndSliceReceiver = blockchain.openContract(
            await EmptyAndCommentAndStringAndSliceReceiverTester.fromInit(),
        );
        emptyAndCommentAndBinaryAndSliceReceiver = blockchain.openContract(
            await EmptyAndCommentAndBinaryAndSliceReceiverTester.fromInit(),
        );
        emptyAndStringAndBinaryAndSliceReceiver = blockchain.openContract(
            await EmptyAndStringAndBinaryAndSliceReceiverTester.fromInit(),
        );
        commentAndStringAndBinaryAndSliceReceiver = blockchain.openContract(
            await CommentAndStringAndBinaryAndSliceReceiverTester.fromInit(),
        );
        allReceivers = blockchain.openContract(
            await AllReceiverTester.fromInit(),
        );

        const deployResult = await contract.send(
            treasure.getSender(),
            { value: toNano("10") },
            null,
        );
        expect(deployResult.transactions).toHaveTransaction({
            from: treasure.address,
            to: contract.address,
            success: true,
            deploy: true,
        });

        const calcDeploy = await calculator.send(
            treasure.getSender(),
            { value: toNano("10") },
            "deploy",
        );
        expect(calcDeploy.transactions).toHaveTransaction({
            from: treasure.address,
            to: calculator.address,
            success: true,
            deploy: true,
        });

        // Deploy contracts
        await deploy(noReceivers.address, await NoReceiverTester.init());
        await deploy(emptyReceiver.address, await EmptyReceiverTester.init());
        await deploy(
            commentReceiver.address,
            await CommentReceiverTester.init(),
        );
        await deploy(stringReceiver.address, await StringReceiverTester.init());
        await deploy(binaryReceiver.address, await BinaryReceiverTester.init());
        await deploy(sliceReceiver.address, await SliceReceiverTester.init());
        await deploy(
            emptyAndCommentReceiver.address,
            await EmptyAndCommentReceiverTester.init(),
        );
        await deploy(
            emptyAndStringReceiver.address,
            await EmptyAndStringReceiverTester.init(),
        );
        await deploy(
            emptyAndBinaryReceiver.address,
            await EmptyAndBinaryReceiverTester.init(),
        );
        await deploy(
            emptyAndSliceReceiver.address,
            await EmptyAndSliceReceiverTester.init(),
        );
        await deploy(
            commentAndStringReceiver.address,
            await CommentAndStringReceiverTester.init(),
        );
        await deploy(
            commentAndBinaryReceiver.address,
            await CommentAndBinaryReceiverTester.init(),
        );
        await deploy(
            commentAndSliceReceiver.address,
            await CommentAndSliceReceiverTester.init(),
        );
        await deploy(
            stringAndBinaryReceiver.address,
            await StringAndBinaryReceiverTester.init(),
        );
        await deploy(
            stringAndSliceReceiver.address,
            await StringAndSliceReceiverTester.init(),
        );
        await deploy(
            binaryAndSliceReceiver.address,
            await BinaryAndSliceReceiverTester.init(),
        );
        await deploy(
            emptyAndCommentAndStringReceiver.address,
            await EmptyAndCommentAndStringReceiverTester.init(),
        );
        await deploy(
            emptyAndCommentAndBinaryReceiver.address,
            await EmptyAndCommentAndBinaryReceiverTester.init(),
        );
        await deploy(
            emptyAndCommentAndSliceReceiver.address,
            await EmptyAndCommentAndSliceReceiverTester.init(),
        );
        await deploy(
            emptyAndStringAndBinaryReceiver.address,
            await EmptyAndStringAndBinaryReceiverTester.init(),
        );
        await deploy(
            emptyAndStringAndSliceReceiver.address,
            await EmptyAndStringAndSliceReceiverTester.init(),
        );
        await deploy(
            emptyAndBinaryAndSliceReceiver.address,
            await EmptyAndBinaryAndSliceReceiverTester.init(),
        );
        await deploy(
            commentAndStringAndBinaryReceiver.address,
            await CommentAndStringAndBinaryReceiverTester.init(),
        );
        await deploy(
            commentAndStringAndSliceReceiver.address,
            await CommentAndStringAndSliceReceiverTester.init(),
        );
        await deploy(
            commentAndBinaryAndSliceReceiver.address,
            await CommentAndBinaryAndSliceReceiverTester.init(),
        );
        await deploy(
            stringAndBinaryAndSliceReceiver.address,
            await StringAndBinaryAndSliceReceiverTester.init(),
        );
        await deploy(
            emptyAndCommentAndStringAndBinaryReceiver.address,
            await EmptyAndCommentAndStringAndBinaryReceiverTester.init(),
        );
        await deploy(
            emptyAndCommentAndStringAndSliceReceiver.address,
            await EmptyAndCommentAndStringAndSliceReceiverTester.init(),
        );
        await deploy(
            emptyAndCommentAndBinaryAndSliceReceiver.address,
            await EmptyAndCommentAndBinaryAndSliceReceiverTester.init(),
        );
        await deploy(
            emptyAndStringAndBinaryAndSliceReceiver.address,
            await EmptyAndStringAndBinaryAndSliceReceiverTester.init(),
        );
        await deploy(
            commentAndStringAndBinaryAndSliceReceiver.address,
            await CommentAndStringAndBinaryAndSliceReceiverTester.init(),
        );
        await deploy(allReceivers.address, await AllReceiverTester.init());

        async function deploy(addr: Address, init: { code: Cell; data: Cell }) {
            const deployable = await blockchain.getContract(addr);
            const trans = await deployable.receiveMessage(
                internal({
                    from: treasure.address,
                    to: deployable.address,
                    value: toNano("10"),
                    stateInit: init,
                    bounce: false,
                }),
            );

            expect(trans.endStatus).toBe("active");

            //const { transactions } = await contract.send(
            //    treasure.getSender(),
            //    { value: toNano("100") },
            //    {$$type: "DeployAddress", address: addr, code: init.code, data: init.data}
            //);
            //const trans = findTransaction(transactions, {from: contract.address,
            //    to: addr,});

            //expect(transactions).toHaveTransaction({from: contract.address,
            //    to: addr,
            //    deploy: true,}
            //);
        }
    });

    it("should implement receivers precedence correctly", async () => {
        // Initially, since we sent a deploy message with empty message, the empty receiver executed
        const receiver1 = await contract.getReceiverKind();
        expect(receiver1).toBe("empty");

        // Send now a "message"
        await contract.send(
            treasure.getSender(),
            { value: toNano("10") },
            "message",
        );
        const receiver2 = await contract.getReceiverKind();
        // Note the receiver "error_comment" did not execute
        expect(receiver2).toBe("comment");

        // Send now an arbitrary string different from "message"
        await contract.send(
            treasure.getSender(),
            { value: toNano("10") },
            "msg",
        );
        const receiver3 = await contract.getReceiverKind();
        // Now, the receiver for general strings executed.
        // Note that "error_comment" still does not execute, nor the "message_slice" receiver.
        expect(receiver3).toBe("comment_fallback");

        // Send now a Message (note the capital letter in Message)
        await contract.send(
            treasure.getSender(),
            { value: toNano("10") },
            { $$type: "Message", msg: "message" },
        );
        const receiver4 = await contract.getReceiverKind();
        // Now, the receiver for Message executed.
        expect(receiver4).toBe("binary_message");

        // Now, simulate different kinds of messages using slices

        // First, an empty message, which can be simulated with an empty slice
        await contract.send(
            treasure.getSender(),
            { value: toNano("10") },
            new Cell().asSlice(),
        );
        // The empty receiver executed
        const receiver5 = await contract.getReceiverKind();
        expect(receiver5).toBe("empty");

        // Send now a "message" simulated as slice
        await contract.send(
            treasure.getSender(),
            { value: toNano("10") },
            // String receivers are triggered by passing an operation code 0 at the start of the slice
            beginCell()
                .storeUint(0, 32)
                .storeStringTail("message")
                .endCell()
                .asSlice(),
        );
        const receiver6 = await contract.getReceiverKind();
        // Note the receiver "error_comment" did not execute, nor the receiver "message_slice".
        expect(receiver6).toBe("comment");

        // Send now an arbitrary string different from "message"
        await contract.send(
            treasure.getSender(),
            { value: toNano("10") },
            // String receivers are triggered by passing an operation code 0 at the start of the slice
            beginCell()
                .storeUint(0, 32)
                .storeStringTail("msg")
                .endCell()
                .asSlice(),
        );
        const receiver7 = await contract.getReceiverKind();
        // Now, the receiver for general strings executed.
        // Note that "error_comment" still does not execute.
        expect(receiver7).toBe("comment_fallback");

        // Note that it is possible to trigger the "message_slice" receiver by passing an operation code different from 0, for example 10.
        await contract.send(
            treasure.getSender(),
            { value: toNano("10") },
            beginCell()
                .storeUint(10, 32)
                .storeStringTail("message")
                .endCell()
                .asSlice(),
        );
        const receiver8 = await contract.getReceiverKind();
        // Now, the receiver for slices takes the "message" path
        expect(receiver8).toBe("message_slice");

        // Send now an arbitrary slice
        await contract.send(
            treasure.getSender(),
            { value: toNano("10") },
            beginCell().storeUint(10, 32).endCell().asSlice(),
        );
        const receiver9 = await contract.getReceiverKind();
        // Now, the receiver for slices executed.
        expect(receiver9).toBe("fallback");

        // In all the cases, "error_comment" did not execute, as it should be.
    });

    it("should implement bounced receiver precedence correctly", async () => {
        // Tell the contract to send a request to the calculator with an unsupported arithmetical operation.
        // The contract will send the request: 1 + 1
        await contract.send(
            treasure.getSender(),
            { value: toNano("10") },
            "do_unsupported_op",
        );
        const receiver1 = await contract.getReceiverKind();
        // The request was bounced back, because the calculator does not do additions.
        // Note the bounced fallback receiver did not execute
        expect(receiver1).toBe("bounced_binary_message");

        // Tell the contract to send a request to the calculator with a division by zero.
        // The contract will send the request: 10/0
        await contract.send(
            treasure.getSender(),
            { value: toNano("10") },
            "do_div_by_zero",
        );
        const receiver2 = await contract.getReceiverKind();
        // The request was bounced back, because the calculator got a division by zero error
        // Note the bounced fallback receiver did not execute
        expect(receiver2).toBe("bounced_binary_message");

        // Tell the contract to send a request to the calculator with a successful division.
        // The contract will send the request: 10/2
        await contract.send(
            treasure.getSender(),
            { value: toNano("10") },
            "do_success_div",
        );
        const receiver3 = await contract.getReceiverKind();
        // The request was successful, since the contract does not receive BinaryIntResult messages (as returned by the calculator),
        // The contract processed the result in the fallback receiver (NOT the bounced fallback receiver).
        expect(receiver3).toBe("fallback");

        // Tell the contract to send an unknown non-arithmetical request to the calculator.
        const { transactions } = await contract.send(
            treasure.getSender(),
            { value: toNano("10") },
            "do_unknown_request",
        );
        const receiver4 = await contract.getReceiverKind();
        // The request was bounced back, because the calculator does not know how to process it.
        // The contract gets the request bounced back into its bounced fallback receiver.
        expect(receiver4).toBe("bounced_fallback");

        // Additionally, the transaction in the calculator fails with exit code 130
        expect(transactions).toHaveTransaction({
            from: contract.address,
            to: calculator.address,
            exitCode: 130,
        });
    });

    it("should implement external receiver precedence correctly", async () => {
        // These tests are very similar to the tests for internal messages.

        // Send an empty message
        await contract.sendExternal(null);
        const receiver1 = await contract.getReceiverKind();
        expect(receiver1).toBe("external_empty");

        // Send now a "message"
        await contract.sendExternal("message");
        const receiver2 = await contract.getReceiverKind();
        // Note the external receiver "external_error_comment" did not execute
        expect(receiver2).toBe("external_comment");

        // Send now an arbitrary string different from "message"
        await contract.sendExternal("msg");
        const receiver3 = await contract.getReceiverKind();
        // Now, the external receiver for general strings executed.
        // Note that "external_error_comment" still does not execute, nor the "external_message_slice" receiver.
        expect(receiver3).toBe("external_comment_fallback");

        // Send now a Message
        await contract.sendExternal({ $$type: "Message", msg: "message" });
        const receiver4 = await contract.getReceiverKind();
        // Now, the external receiver for Message executed.
        expect(receiver4).toBe("external_binary_message");

        // Tests for fallback external receiver (i.e., external receiver with Slice parameter),
        // will be added here once issue https://github.com/tact-lang/tact/issues/1669 is solved.
        // See notes in sub-issue: https://github.com/tact-lang/tact/issues/1787

        // In all the cases, "external_error_comment" did not execute, as it should be.
    });

    it("internal receivers should process empty messages and empty strings correctly", async () => {
        // Message bodies with integer of size less than 32 bits will be processed by empty receivers (if present),
        // irrespective of the value of the integer
        const lessThan32Bits = beginCell().storeUint(10, 30).endCell();
        // An actual empty message body
        const emptyBody = new Cell();
        // Message bodies with integers of size exactly 32 bits but value 0 will be processed by empty receivers (if present).
        const zeroOf32Bits = beginCell().storeUint(0, 32).endCell();
        // The empty string will be processed by empty receivers (if present)
        const emptyString = beginCell()
            .storeUint(0, 32)
            .storeStringTail("")
            .endCell();

        const bodiesToTry = [
            lessThan32Bits,
            emptyBody,
            zeroOf32Bits,
            emptyString,
        ];

        // Some utility functions that carry out the actual tests and assertions

        async function shouldFailInAllCases(
            testedContract: Address,
            exitCode: number,
        ) {
            for (const body of bodiesToTry) {
                const { transactions } = await contract.send(
                    treasure.getSender(),
                    { value: toNano("10") },
                    {
                        $$type: "SendCellToAddress",
                        address: testedContract,
                        body,
                    },
                );

                expect(transactions).toHaveTransaction({
                    from: contract.address,
                    to: testedContract,
                    success: false,
                    exitCode,
                });
            }
        }

        async function shouldAcceptAllCases(
            testedContract: Address,
            receiverGetter: () => Promise<string>,
            expectedReceiver: string,
        ) {
            for (const body of bodiesToTry) {
                const { transactions } = await contract.send(
                    treasure.getSender(),
                    { value: toNano("10") },
                    {
                        $$type: "SendCellToAddress",
                        address: testedContract,
                        body,
                    },
                );

                expect(transactions).toHaveTransaction({
                    from: contract.address,
                    to: testedContract,
                    success: true,
                });
                expect(await receiverGetter()).toBe(expectedReceiver);
            }
        }

        async function shouldFailIncompleteOpCode(
            testedContract: Address,
            exitCode: number,
        ) {
            const { transactions } = await contract.send(
                treasure.getSender(),
                { value: toNano("10") },
                {
                    $$type: "SendCellToAddress",
                    address: testedContract,
                    body: lessThan32Bits,
                },
            );

            expect(transactions).toHaveTransaction({
                from: contract.address,
                to: testedContract,
                success: false,
                exitCode: exitCode,
            });
        }

        async function shouldAcceptFrom(
            testedContract: Address,
            from: number,
            receiverGetter: () => Promise<string>,
            expectedRestReceiver: string,
        ) {
            for (const body of bodiesToTry.slice(from)) {
                const { transactions } = await contract.send(
                    treasure.getSender(),
                    { value: toNano("10") },
                    {
                        $$type: "SendCellToAddress",
                        address: testedContract,
                        body,
                    },
                );

                expect(transactions).toHaveTransaction({
                    from: contract.address,
                    to: testedContract,
                    success: true,
                });
                expect(await receiverGetter()).toBe(expectedRestReceiver);
            }
        }

        async function shouldFailEmptyBody(
            testedContract: Address,
            exitCode: number,
        ) {
            const { transactions } = await contract.send(
                treasure.getSender(),
                { value: toNano("10") },
                {
                    $$type: "SendCellToAddress",
                    address: testedContract,
                    body: emptyBody,
                },
            );

            expect(transactions).toHaveTransaction({
                from: contract.address,
                to: testedContract,
                success: false,
                exitCode: exitCode,
            });
        }

        async function shouldAcceptIncompleteOpCode(
            testedContract: Address,
            receiverGetter: () => Promise<string>,
            expectedReceiver: string,
        ) {
            const { transactions } = await contract.send(
                treasure.getSender(),
                { value: toNano("10") },
                {
                    $$type: "SendCellToAddress",
                    address: testedContract,
                    body: lessThan32Bits,
                },
            );

            expect(transactions).toHaveTransaction({
                from: contract.address,
                to: testedContract,
                success: true,
            });
            expect(await receiverGetter()).toBe(expectedReceiver);
        }

        async function shouldAcceptEmptyBody(
            testedContract: Address,
            receiverGetter: () => Promise<string>,
            expectedReceiver: string,
        ) {
            const { transactions } = await contract.send(
                treasure.getSender(),
                { value: toNano("10") },
                {
                    $$type: "SendCellToAddress",
                    address: testedContract,
                    body: emptyBody,
                },
            );

            expect(transactions).toHaveTransaction({
                from: contract.address,
                to: testedContract,
                success: true,
            });
            expect(await receiverGetter()).toBe(expectedReceiver);
        }

        // Tests start here

        // noReceivers should fail in all the cases with exit code 130
        await shouldFailInAllCases(noReceivers.address, 130);

        // emptyReceiver should accept all the cases
        await shouldAcceptAllCases(
            emptyReceiver.address,
            emptyReceiver.getReceiver,
            "empty",
        );

        // commentReceiver should fail in all the cases with exit code 130
        await shouldFailInAllCases(commentReceiver.address, 130);

        // stringReceiver should fail in the first and second cases with exit code 130, but accept the rest
        await shouldFailIncompleteOpCode(stringReceiver.address, 130);
        await shouldFailEmptyBody(stringReceiver.address, 130);
        await shouldAcceptFrom(
            stringReceiver.address,
            2,
            stringReceiver.getReceiver,
            "fallback_string",
        );

        // binaryReceiver should fail in all the cases with exit code 130
        await shouldFailInAllCases(binaryReceiver.address, 130);

        // sliceReceiver should accept all the cases
        await shouldAcceptAllCases(
            sliceReceiver.address,
            sliceReceiver.getReceiver,
            "fallback",
        );

        // emptyAndCommentReceiver should accept all the cases in the empty receiver
        await shouldAcceptAllCases(
            emptyAndCommentReceiver.address,
            emptyAndCommentReceiver.getReceiver,
            "empty",
        );

        // emptyAndStringReceiver should accept all the cases in the empty receiver
        await shouldAcceptAllCases(
            emptyAndStringReceiver.address,
            emptyAndStringReceiver.getReceiver,
            "empty",
        );

        // emptyAndBinaryReceiver should accept all the cases in the empty receiver
        await shouldAcceptAllCases(
            emptyAndBinaryReceiver.address,
            emptyAndBinaryReceiver.getReceiver,
            "empty",
        );

        // emptyAndSliceReceiver should accept all the cases in the empty receiver
        await shouldAcceptAllCases(
            emptyAndSliceReceiver.address,
            emptyAndSliceReceiver.getReceiver,
            "empty",
        );

        // commentAndStringReceiver should fail in the first and second, but accept the rest in the string receiver
        await shouldFailIncompleteOpCode(commentAndStringReceiver.address, 130);
        await shouldFailEmptyBody(commentAndStringReceiver.address, 130);
        await shouldAcceptFrom(
            commentAndStringReceiver.address,
            2,
            commentAndStringReceiver.getReceiver,
            "fallback_string",
        );

        // commentAndBinaryReceiver should fail in all the cases with exit code 130
        await shouldFailInAllCases(commentAndBinaryReceiver.address, 130);

        // commentAndSliceReceiver should accept all the cases in the fallback receiver
        await shouldAcceptAllCases(
            commentAndSliceReceiver.address,
            commentAndSliceReceiver.getReceiver,
            "fallback",
        );

        // stringAndBinaryReceiver should fail in the first and second, but accept the rest in the string receiver
        await shouldFailIncompleteOpCode(stringAndBinaryReceiver.address, 130);
        await shouldFailEmptyBody(stringAndBinaryReceiver.address, 130);
        await shouldAcceptFrom(
            stringAndBinaryReceiver.address,
            2,
            stringAndBinaryReceiver.getReceiver,
            "fallback_string",
        );

        // stringAndSliceReceiver should accept the first and second in the fallback receiver
        // and the rest in the string receiver
        await shouldAcceptIncompleteOpCode(
            stringAndSliceReceiver.address,
            stringAndSliceReceiver.getReceiver,
            "fallback",
        );
        await shouldAcceptEmptyBody(
            stringAndSliceReceiver.address,
            stringAndSliceReceiver.getReceiver,
            "fallback",
        );
        await shouldAcceptFrom(
            stringAndSliceReceiver.address,
            2,
            stringAndSliceReceiver.getReceiver,
            "fallback_string",
        );

        // binaryAndSliceReceiver should accept all the cases in the fallback receiver
        await shouldAcceptAllCases(
            binaryAndSliceReceiver.address,
            binaryAndSliceReceiver.getReceiver,
            "fallback",
        );

        // emptyAndCommentAndStringReceiver should accept all the cases in the empty receiver
        await shouldAcceptAllCases(
            emptyAndCommentAndStringReceiver.address,
            emptyAndCommentAndStringReceiver.getReceiver,
            "empty",
        );

        // emptyAndCommentAndBinaryReceiver should accept all the cases in the empty receiver
        await shouldAcceptAllCases(
            emptyAndCommentAndBinaryReceiver.address,
            emptyAndCommentAndBinaryReceiver.getReceiver,
            "empty",
        );

        // emptyAndCommentAndSliceReceiver should accept all the cases in the empty receiver
        await shouldAcceptAllCases(
            emptyAndCommentAndSliceReceiver.address,
            emptyAndCommentAndSliceReceiver.getReceiver,
            "empty",
        );

        // emptyAndStringAndBinaryReceiver should accept all the cases in the empty receiver
        await shouldAcceptAllCases(
            emptyAndStringAndBinaryReceiver.address,
            emptyAndStringAndBinaryReceiver.getReceiver,
            "empty",
        );

        // emptyAndStringAndSliceReceiver should accept all the cases in the empty receiver
        await shouldAcceptAllCases(
            emptyAndStringAndSliceReceiver.address,
            emptyAndStringAndSliceReceiver.getReceiver,
            "empty",
        );

        // emptyAndBinaryAndSliceReceiver should accept all the cases in the empty receiver
        await shouldAcceptAllCases(
            emptyAndBinaryAndSliceReceiver.address,
            emptyAndBinaryAndSliceReceiver.getReceiver,
            "empty",
        );

        // commentAndStringAndBinaryReceiver should fail in the first and second
        // but accept the rest in the string receiver
        await shouldFailIncompleteOpCode(
            commentAndStringAndBinaryReceiver.address,
            130,
        );
        await shouldFailEmptyBody(
            commentAndStringAndBinaryReceiver.address,
            130,
        );
        await shouldAcceptFrom(
            commentAndStringAndBinaryReceiver.address,
            2,
            commentAndStringAndBinaryReceiver.getReceiver,
            "fallback_string",
        );

        // commentAndStringAndSliceReceiver should accept the first and second in the fallback receiver,
        // but should accept the rest in the string receiver
        await shouldAcceptIncompleteOpCode(
            commentAndStringAndSliceReceiver.address,
            commentAndStringAndSliceReceiver.getReceiver,
            "fallback",
        );
        await shouldAcceptEmptyBody(
            commentAndStringAndSliceReceiver.address,
            commentAndStringAndSliceReceiver.getReceiver,
            "fallback",
        );
        await shouldAcceptFrom(
            commentAndStringAndSliceReceiver.address,
            2,
            commentAndStringAndSliceReceiver.getReceiver,
            "fallback_string",
        );

        // commentAndBinaryAndSliceReceiver should accept all the cases in the fallback receiver
        await shouldAcceptAllCases(
            commentAndBinaryAndSliceReceiver.address,
            commentAndBinaryAndSliceReceiver.getReceiver,
            "fallback",
        );

        // stringAndBinaryAndSliceReceiver should accept the first and second in the fallback receiver,
        // but should accept the rest in the string receiver
        await shouldAcceptIncompleteOpCode(
            stringAndBinaryAndSliceReceiver.address,
            stringAndBinaryAndSliceReceiver.getReceiver,
            "fallback",
        );
        await shouldAcceptEmptyBody(
            stringAndBinaryAndSliceReceiver.address,
            stringAndBinaryAndSliceReceiver.getReceiver,
            "fallback",
        );
        await shouldAcceptFrom(
            stringAndBinaryAndSliceReceiver.address,
            2,
            stringAndBinaryAndSliceReceiver.getReceiver,
            "fallback_string",
        );

        // emptyAndCommentAndStringAndBinaryReceiver should accept all the cases in the empty receiver
        await shouldAcceptAllCases(
            emptyAndCommentAndStringAndBinaryReceiver.address,
            emptyAndCommentAndStringAndBinaryReceiver.getReceiver,
            "empty",
        );

        // emptyAndCommentAndStringAndSliceReceiver should accept all the cases in the empty receiver
        await shouldAcceptAllCases(
            emptyAndCommentAndStringAndSliceReceiver.address,
            emptyAndCommentAndStringAndSliceReceiver.getReceiver,
            "empty",
        );

        // emptyAndCommentAndBinaryAndSliceReceiver should accept all the cases in the empty receiver
        await shouldAcceptAllCases(
            emptyAndCommentAndBinaryAndSliceReceiver.address,
            emptyAndCommentAndBinaryAndSliceReceiver.getReceiver,
            "empty",
        );

        // emptyAndStringAndBinaryAndSliceReceiver should accept all the cases in the empty receiver
        await shouldAcceptAllCases(
            emptyAndStringAndBinaryAndSliceReceiver.address,
            emptyAndStringAndBinaryAndSliceReceiver.getReceiver,
            "empty",
        );

        // commentAndStringAndBinaryAndSliceReceiver should accept the first and second in the fallback receiver,
        // but should accept the rest in the string receiver
        await shouldAcceptIncompleteOpCode(
            commentAndStringAndBinaryAndSliceReceiver.address,
            commentAndStringAndBinaryAndSliceReceiver.getReceiver,
            "fallback",
        );
        await shouldAcceptEmptyBody(
            commentAndStringAndBinaryAndSliceReceiver.address,
            commentAndStringAndBinaryAndSliceReceiver.getReceiver,
            "fallback",
        );
        await shouldAcceptFrom(
            commentAndStringAndBinaryAndSliceReceiver.address,
            2,
            commentAndStringAndBinaryAndSliceReceiver.getReceiver,
            "fallback_string",
        );

        // allReceivers should accept all the cases in the empty receiver
        await shouldAcceptAllCases(
            allReceivers.address,
            allReceivers.getReceiver,
            "empty",
        );
    });

    it("external receivers should process empty messages and empty strings correctly", async () => {
        // Message bodies with integer of size less than 32 bits will be processed by empty receivers (if present),
        // irrespective of the value of the integer
        const lessThan32Bits = beginCell().storeUint(10, 30).endCell();
        // An actual empty message body
        const emptyBody = new Cell();
        // Message bodies with integers of size exactly 32 bits but value 0 will be processed by empty receivers (if present).
        const zeroOf32Bits = beginCell().storeUint(0, 32).endCell();
        // The empty string will be processed by empty receivers (if present)
        const emptyString = beginCell()
            .storeUint(0, 32)
            .storeStringTail("")
            .endCell();

        const bodiesToTry = [
            lessThan32Bits,
            emptyBody,
            zeroOf32Bits,
            emptyString,
        ];

        // Some utility functions that carry out the actual tests and assertions

        async function shouldFailInAllCases(testedContract: Address) {
            const contract = await blockchain.getContract(testedContract);
            for (const body of bodiesToTry) {
                try {
                    await contract.receiveMessage(
                        external({
                            to: contract.address,
                            body: body,
                        }),
                    );

                    // It should not reach here
                    expect(false).toBe(true);
                } catch (e) {
                    expect(e instanceof Error).toBe(true);
                    if (e instanceof Error) {
                        expect(e.message).toContain(
                            "External message not accepted by smart contract",
                        );
                    }
                }
            }
        }

        async function shouldAcceptAllCases(
            testedContract: Address,
            receiverGetter: () => Promise<string>,
            expectedReceiver: string,
        ) {
            const contract = await blockchain.getContract(testedContract);
            for (const body of bodiesToTry) {
                const transaction = await contract.receiveMessage(
                    external({
                        to: contract.address,
                        body: body,
                    }),
                );

                const transDesc = getTransactionDescription(transaction);
                expect(transDesc.aborted).toBe(false);
                expect(await receiverGetter()).toBe(expectedReceiver);
            }
        }

        async function shouldFailIncompleteOpCode(testedContract: Address) {
            const contract = await blockchain.getContract(testedContract);
            try {
                await contract.receiveMessage(
                    external({
                        to: contract.address,
                        body: lessThan32Bits,
                    }),
                );

                // It should not reach here
                expect(false).toBe(true);
            } catch (e) {
                expect(e instanceof Error).toBe(true);
                if (e instanceof Error) {
                    expect(e.message).toContain(
                        "External message not accepted by smart contract",
                    );
                }
            }
        }

        async function shouldAcceptFrom(
            testedContract: Address,
            from: number,
            receiverGetter: () => Promise<string>,
            expectedRestReceiver: string,
        ) {
            const contract = await blockchain.getContract(testedContract);
            for (const body of bodiesToTry.slice(from)) {
                const transaction = await contract.receiveMessage(
                    external({
                        to: contract.address,
                        body: body,
                    }),
                );

                const transDesc = getTransactionDescription(transaction);
                expect(transDesc.aborted).toBe(false);
                expect(await receiverGetter()).toBe(expectedRestReceiver);
            }
        }

        async function shouldFailEmptyBody(testedContract: Address) {
            const contract = await blockchain.getContract(testedContract);
            try {
                await contract.receiveMessage(
                    external({
                        to: contract.address,
                        body: emptyBody,
                    }),
                );

                // It should not reach here
                expect(false).toBe(true);
            } catch (e) {
                expect(e instanceof Error).toBe(true);
                if (e instanceof Error) {
                    expect(e.message).toContain(
                        "External message not accepted by smart contract",
                    );
                }
            }
        }

        async function shouldAcceptIncompleteOpCode(
            testedContract: Address,
            receiverGetter: () => Promise<string>,
            expectedReceiver: string,
        ) {
            const contract = await blockchain.getContract(testedContract);
            const transaction = await contract.receiveMessage(
                external({
                    to: contract.address,
                    body: lessThan32Bits,
                }),
            );

            const transDesc = getTransactionDescription(transaction);
            expect(transDesc.aborted).toBe(false);
            expect(await receiverGetter()).toBe(expectedReceiver);
        }

        async function shouldAcceptEmptyBody(
            testedContract: Address,
            receiverGetter: () => Promise<string>,
            expectedReceiver: string,
        ) {
            const contract = await blockchain.getContract(testedContract);
            const transaction = await contract.receiveMessage(
                external({
                    to: contract.address,
                    body: emptyBody,
                }),
            );

            const transDesc = getTransactionDescription(transaction);
            expect(transDesc.aborted).toBe(false);
            expect(await receiverGetter()).toBe(expectedReceiver);
        }

        // Tests start here

        // noReceivers should fail in all the cases
        await shouldFailInAllCases(noReceivers.address);

        // emptyReceiver should accept all the cases
        await shouldAcceptAllCases(
            emptyReceiver.address,
            emptyReceiver.getReceiver,
            "external_empty",
        );

        // commentReceiver should fail in all the cases
        await shouldFailInAllCases(commentReceiver.address);

        // stringReceiver should fail in the first and second cases, but accept the rest
        await shouldFailIncompleteOpCode(stringReceiver.address);
        await shouldFailEmptyBody(stringReceiver.address);
        await shouldAcceptFrom(
            stringReceiver.address,
            2,
            stringReceiver.getReceiver,
            "external_fallback_string",
        );

        // binaryReceiver should fail in all the cases
        await shouldFailInAllCases(binaryReceiver.address);

        // sliceReceiver should accept all the cases
        await shouldAcceptAllCases(
            sliceReceiver.address,
            sliceReceiver.getReceiver,
            "external_fallback",
        );

        // emptyAndCommentReceiver should accept all the cases in the empty receiver
        await shouldAcceptAllCases(
            emptyAndCommentReceiver.address,
            emptyAndCommentReceiver.getReceiver,
            "external_empty",
        );

        // emptyAndStringReceiver should accept all the cases in the empty receiver
        await shouldAcceptAllCases(
            emptyAndStringReceiver.address,
            emptyAndStringReceiver.getReceiver,
            "external_empty",
        );

        // emptyAndBinaryReceiver should accept all the cases in the empty receiver
        await shouldAcceptAllCases(
            emptyAndBinaryReceiver.address,
            emptyAndBinaryReceiver.getReceiver,
            "external_empty",
        );

        // emptyAndSliceReceiver should accept all the cases in the empty receiver
        await shouldAcceptAllCases(
            emptyAndSliceReceiver.address,
            emptyAndSliceReceiver.getReceiver,
            "external_empty",
        );

        // commentAndStringReceiver should fail in the first and second, but accept the rest in the string receiver
        await shouldFailIncompleteOpCode(commentAndStringReceiver.address);
        await shouldFailEmptyBody(commentAndStringReceiver.address);
        await shouldAcceptFrom(
            commentAndStringReceiver.address,
            2,
            commentAndStringReceiver.getReceiver,
            "external_fallback_string",
        );

        // commentAndBinaryReceiver should fail in all the cases
        await shouldFailInAllCases(commentAndBinaryReceiver.address);

        // commentAndSliceReceiver should accept all the cases in the fallback receiver
        await shouldAcceptAllCases(
            commentAndSliceReceiver.address,
            commentAndSliceReceiver.getReceiver,
            "external_fallback",
        );

        // stringAndBinaryReceiver should fail in the first and second, but accept the rest in the string receiver
        await shouldFailIncompleteOpCode(stringAndBinaryReceiver.address);
        await shouldFailEmptyBody(stringAndBinaryReceiver.address);
        await shouldAcceptFrom(
            stringAndBinaryReceiver.address,
            2,
            stringAndBinaryReceiver.getReceiver,
            "external_fallback_string",
        );

        // stringAndSliceReceiver should accept the first and second in the fallback receiver
        // and the rest in the string receiver
        await shouldAcceptIncompleteOpCode(
            stringAndSliceReceiver.address,
            stringAndSliceReceiver.getReceiver,
            "external_fallback",
        );
        await shouldAcceptEmptyBody(
            stringAndSliceReceiver.address,
            stringAndSliceReceiver.getReceiver,
            "external_fallback",
        );
        await shouldAcceptFrom(
            stringAndSliceReceiver.address,
            2,
            stringAndSliceReceiver.getReceiver,
            "external_fallback_string",
        );

        // binaryAndSliceReceiver should accept all the cases in the fallback receiver
        await shouldAcceptAllCases(
            binaryAndSliceReceiver.address,
            binaryAndSliceReceiver.getReceiver,
            "external_fallback",
        );

        // emptyAndCommentAndStringReceiver should accept all the cases in the empty receiver
        await shouldAcceptAllCases(
            emptyAndCommentAndStringReceiver.address,
            emptyAndCommentAndStringReceiver.getReceiver,
            "external_empty",
        );

        // emptyAndCommentAndBinaryReceiver should accept all the cases in the empty receiver
        await shouldAcceptAllCases(
            emptyAndCommentAndBinaryReceiver.address,
            emptyAndCommentAndBinaryReceiver.getReceiver,
            "external_empty",
        );

        // emptyAndCommentAndSliceReceiver should accept all the cases in the empty receiver
        await shouldAcceptAllCases(
            emptyAndCommentAndSliceReceiver.address,
            emptyAndCommentAndSliceReceiver.getReceiver,
            "external_empty",
        );

        // emptyAndStringAndBinaryReceiver should accept all the cases in the empty receiver
        await shouldAcceptAllCases(
            emptyAndStringAndBinaryReceiver.address,
            emptyAndStringAndBinaryReceiver.getReceiver,
            "external_empty",
        );

        // emptyAndStringAndSliceReceiver should accept all the cases in the empty receiver
        await shouldAcceptAllCases(
            emptyAndStringAndSliceReceiver.address,
            emptyAndStringAndSliceReceiver.getReceiver,
            "external_empty",
        );

        // emptyAndBinaryAndSliceReceiver should accept all the cases in the empty receiver
        await shouldAcceptAllCases(
            emptyAndBinaryAndSliceReceiver.address,
            emptyAndBinaryAndSliceReceiver.getReceiver,
            "external_empty",
        );

        // commentAndStringAndBinaryReceiver should fail in the first and second
        // but accept the rest in the string receiver
        await shouldFailIncompleteOpCode(
            commentAndStringAndBinaryReceiver.address,
        );
        await shouldFailEmptyBody(commentAndStringAndBinaryReceiver.address);
        await shouldAcceptFrom(
            commentAndStringAndBinaryReceiver.address,
            2,
            commentAndStringAndBinaryReceiver.getReceiver,
            "external_fallback_string",
        );

        // commentAndStringAndSliceReceiver should accept the first and second in the fallback receiver,
        // but should accept the rest in the string receiver
        await shouldAcceptIncompleteOpCode(
            commentAndStringAndSliceReceiver.address,
            commentAndStringAndSliceReceiver.getReceiver,
            "external_fallback",
        );
        await shouldAcceptEmptyBody(
            commentAndStringAndSliceReceiver.address,
            commentAndStringAndSliceReceiver.getReceiver,
            "external_fallback",
        );
        await shouldAcceptFrom(
            commentAndStringAndSliceReceiver.address,
            2,
            commentAndStringAndSliceReceiver.getReceiver,
            "external_fallback_string",
        );

        // commentAndBinaryAndSliceReceiver should accept all the cases in the fallback receiver
        await shouldAcceptAllCases(
            commentAndBinaryAndSliceReceiver.address,
            commentAndBinaryAndSliceReceiver.getReceiver,
            "external_fallback",
        );

        // stringAndBinaryAndSliceReceiver should accept the first and second in the fallback receiver,
        // but should accept the rest in the string receiver
        await shouldAcceptIncompleteOpCode(
            stringAndBinaryAndSliceReceiver.address,
            stringAndBinaryAndSliceReceiver.getReceiver,
            "external_fallback",
        );
        await shouldAcceptEmptyBody(
            stringAndBinaryAndSliceReceiver.address,
            stringAndBinaryAndSliceReceiver.getReceiver,
            "external_fallback",
        );
        await shouldAcceptFrom(
            stringAndBinaryAndSliceReceiver.address,
            2,
            stringAndBinaryAndSliceReceiver.getReceiver,
            "external_fallback_string",
        );

        // emptyAndCommentAndStringAndBinaryReceiver should accept all the cases in the empty receiver
        await shouldAcceptAllCases(
            emptyAndCommentAndStringAndBinaryReceiver.address,
            emptyAndCommentAndStringAndBinaryReceiver.getReceiver,
            "external_empty",
        );

        // emptyAndCommentAndStringAndSliceReceiver should accept all the cases in the empty receiver
        await shouldAcceptAllCases(
            emptyAndCommentAndStringAndSliceReceiver.address,
            emptyAndCommentAndStringAndSliceReceiver.getReceiver,
            "external_empty",
        );

        // emptyAndCommentAndBinaryAndSliceReceiver should accept all the cases in the empty receiver
        await shouldAcceptAllCases(
            emptyAndCommentAndBinaryAndSliceReceiver.address,
            emptyAndCommentAndBinaryAndSliceReceiver.getReceiver,
            "external_empty",
        );

        // emptyAndStringAndBinaryAndSliceReceiver should accept all the cases in the empty receiver
        await shouldAcceptAllCases(
            emptyAndStringAndBinaryAndSliceReceiver.address,
            emptyAndStringAndBinaryAndSliceReceiver.getReceiver,
            "external_empty",
        );

        // commentAndStringAndBinaryAndSliceReceiver should accept the first and second in the fallback receiver,
        // but should accept the rest in the string receiver
        await shouldAcceptIncompleteOpCode(
            commentAndStringAndBinaryAndSliceReceiver.address,
            commentAndStringAndBinaryAndSliceReceiver.getReceiver,
            "external_fallback",
        );
        await shouldAcceptEmptyBody(
            commentAndStringAndBinaryAndSliceReceiver.address,
            commentAndStringAndBinaryAndSliceReceiver.getReceiver,
            "external_fallback",
        );
        await shouldAcceptFrom(
            commentAndStringAndBinaryAndSliceReceiver.address,
            2,
            commentAndStringAndBinaryAndSliceReceiver.getReceiver,
            "external_fallback_string",
        );

        // allReceivers should accept all the cases in the empty receiver
        await shouldAcceptAllCases(
            allReceivers.address,
            allReceivers.getReceiver,
            "external_empty",
        );
    });
});

function getTransactionDescription(
    tsx: SmartContractTransaction,
): TransactionDescriptionGeneric {
    if (tsx.description.type === "generic") {
        return tsx.description;
    }
    throw new Error("Expected generic transaction");
}
