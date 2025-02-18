import { beginCell, Cell, toNano } from "@ton/core";
import type { SandboxContract, TreasuryContract } from "@ton/sandbox";
import { Blockchain } from "@ton/sandbox";
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
        noReceivers = blockchain.openContract(await NoReceiverTester.fromInit());
        emptyReceiver = blockchain.openContract(await EmptyReceiverTester.fromInit());
        commentReceiver = blockchain.openContract(await CommentReceiverTester.fromInit());
        stringReceiver = blockchain.openContract(await StringReceiverTester.fromInit());
        binaryReceiver = blockchain.openContract(await BinaryReceiverTester.fromInit());
     sliceReceiver = blockchain.openContract(await SliceReceiverTester.fromInit());
     emptyAndCommentReceiver = blockchain.openContract(await EmptyAndCommentReceiverTester.fromInit());
     emptyAndStringReceiver  = blockchain.openContract(await EmptyAndStringReceiverTester.fromInit());
     emptyAndBinaryReceiver  = blockchain.openContract(await EmptyAndBinaryReceiverTester.fromInit());
     emptyAndSliceReceiver = blockchain.openContract(await EmptyAndSliceReceiverTester.fromInit());
     commentAndStringReceiver = blockchain.openContract(await CommentAndStringReceiverTester.fromInit());
     commentAndBinaryReceiver = blockchain.openContract(await CommentAndBinaryReceiverTester.fromInit());
     commentAndSliceReceiver = blockchain.openContract(await CommentAndSliceReceiverTester.fromInit());
     stringAndBinaryReceiver = blockchain.openContract(await StringAndBinaryReceiverTester.fromInit());
     stringAndSliceReceiver = blockchain.openContract(await StringAndSliceReceiverTester.fromInit());
     binaryAndSliceReceiver = blockchain.openContract(await BinaryAndSliceReceiverTester.fromInit());
     emptyAndCommentAndStringReceiver = blockchain.openContract(await EmptyAndCommentAndStringReceiverTester.fromInit());
     emptyAndCommentAndBinaryReceiver = blockchain.openContract(await EmptyAndCommentAndBinaryReceiverTester.fromInit());
     emptyAndCommentAndSliceReceiver = blockchain.openContract(await EmptyAndCommentAndSliceReceiverTester.fromInit());
     emptyAndStringAndBinaryReceiver = blockchain.openContract(await EmptyAndStringAndBinaryReceiverTester.fromInit());
     emptyAndStringAndSliceReceiver = blockchain.openContract(await EmptyAndStringAndSliceReceiverTester.fromInit());
     emptyAndBinaryAndSliceReceiver = blockchain.openContract(await EmptyAndBinaryAndSliceReceiverTester.fromInit());
     commentAndStringAndBinaryReceiver = blockchain.openContract(await CommentAndStringAndBinaryReceiverTester.fromInit());
     commentAndStringAndSliceReceiver = blockchain.openContract(await CommentAndStringAndSliceReceiverTester.fromInit());
     commentAndBinaryAndSliceReceiver = blockchain.openContract(await CommentAndBinaryAndSliceReceiverTester.fromInit());
     stringAndBinaryAndSliceReceiver = blockchain.openContract(await StringAndBinaryAndSliceReceiverTester.fromInit());
     emptyAndCommentAndStringAndBinaryReceiver = blockchain.openContract(await EmptyAndCommentAndStringAndBinaryReceiverTester.fromInit());
     emptyAndCommentAndStringAndSliceReceiver = blockchain.openContract(await EmptyAndCommentAndStringAndSliceReceiverTester.fromInit());
     emptyAndCommentAndBinaryAndSliceReceiver = blockchain.openContract(await EmptyAndCommentAndBinaryAndSliceReceiverTester.fromInit());
     emptyAndStringAndBinaryAndSliceReceiver = blockchain.openContract(await EmptyAndStringAndBinaryAndSliceReceiverTester.fromInit());
     commentAndStringAndBinaryAndSliceReceiver = blockchain.openContract(await CommentAndStringAndBinaryAndSliceReceiverTester.fromInit());
     allReceivers = blockchain.openContract(await AllReceiverTester.fromInit());

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
        // Message bodies with integer of size less than 32 bits will be processed by empty receivers (if present).
        const lessThan32Bits = beginCell().storeUint(10,30).endCell();
        // An actual empty message body
        const emptyBody = new Cell();
        // Message bodies with integers of size exactly 32 bits but value 0 will be processed by empty receivers (if present).
        const zeroOf32Bits = beginCell().storeUint(0,32).endCell();
        // The empty string
        const emptyString = beginCell().storeUint(0,32).storeStringTail("").endCell();

        const bodiesToTry = [lessThan32Bits, emptyBody, zeroOf32Bits, emptyString];

        // noReceivers should fail in all the cases with exit code 130
        for (const body of bodiesToTry) {
            const { transactions } = await contract.send(
                treasure.getSender(),
                { value: toNano("10") },
                { $$type: "SendCellToAddress", address: noReceivers.address, data: body},
            );
    
            expect(transactions).toHaveTransaction({from: contract.address, to: noReceivers.address, success: false, exitCode: 130});
        }

        // emptyReceiver should accept all the cases
        for (const body of bodiesToTry) {
            const { transactions } = await contract.send(
                treasure.getSender(),
                { value: toNano("10") },
                { $$type: "SendCellToAddress", address: emptyReceiver.address, data: body},
            );
    
            expect(transactions).toHaveTransaction({from: contract.address, to: emptyReceiver.address, success: true});
            expect(await emptyReceiver.getReceiver()).toBe("empty");
        }

        // commentReceiver should fail in all the cases with exit code 130
        for (const body of bodiesToTry) {
            const { transactions } = await contract.send(
                treasure.getSender(),
                { value: toNano("10") },
                { $$type: "SendCellToAddress", address: commentReceiver.address, data: body},
            );
    
            expect(transactions).toHaveTransaction({from: contract.address, to: commentReceiver.address, success: false, exitCode: 130});
        }

        // stringReceiver should fail in the first one
        {
            const { transactions } = await contract.send(
                treasure.getSender(),
                { value: toNano("10") },
                { $$type: "SendCellToAddress", address: stringReceiver.address, data: lessThan32Bits},
            );
    
            expect(transactions).toHaveTransaction({from: contract.address, to: stringReceiver.address, success: false, exitCode: 130});
        }

        // But should succeed in the rest
        for (const body of bodiesToTry.slice(1)) {
            const { transactions } = await contract.send(
                treasure.getSender(),
                { value: toNano("10") },
                { $$type: "SendCellToAddress", address: stringReceiver.address, data: body},
            );
    
            expect(transactions).toHaveTransaction({from: contract.address, to: stringReceiver.address, success: true});
            expect(await stringReceiver.getReceiver()).toBe("fallback_string");
        }

        // binaryReceiver should fail in all the cases with exit code 130
        for (const body of bodiesToTry) {
            const { transactions } = await contract.send(
                treasure.getSender(),
                { value: toNano("10") },
                { $$type: "SendCellToAddress", address: binaryReceiver.address, data: body},
            );
    
            expect(transactions).toHaveTransaction({from: contract.address, to: binaryReceiver.address, success: false, exitCode: 130});
        }

        // sliceReceiver should accept all the cases
        for (const body of bodiesToTry) {
            const { transactions } = await contract.send(
                treasure.getSender(),
                { value: toNano("10") },
                { $$type: "SendCellToAddress", address: sliceReceiver.address, data: body},
            );
    
            expect(transactions).toHaveTransaction({from: contract.address, to: sliceReceiver.address, success: true});
            expect(await sliceReceiver.getReceiver()).toBe("fallback");
        }

        // emptyAndCommentReceiver should accept all the cases in the empty receiver
        for (const body of bodiesToTry) {
            const { transactions } = await contract.send(
                treasure.getSender(),
                { value: toNano("10") },
                { $$type: "SendCellToAddress", address: emptyAndCommentReceiver.address, data: body},
            );
    
            expect(transactions).toHaveTransaction({from: contract.address, to: emptyAndCommentReceiver.address, success: true});
            expect(await emptyAndCommentReceiver.getReceiver()).toBe("empty");
        }

        // emptyAndStringReceiver should accept all the cases in the empty receiver
        for (const body of bodiesToTry) {
            const { transactions } = await contract.send(
                treasure.getSender(),
                { value: toNano("10") },
                { $$type: "SendCellToAddress", address: emptyAndStringReceiver.address, data: body},
            );
    
            expect(transactions).toHaveTransaction({from: contract.address, to: emptyAndStringReceiver.address, success: true});
            expect(await emptyAndStringReceiver.getReceiver()).toBe("empty");
        }

        // emptyAndBinaryReceiver should accept all the cases in the empty receiver
        for (const body of bodiesToTry) {
            const { transactions } = await contract.send(
                treasure.getSender(),
                { value: toNano("10") },
                { $$type: "SendCellToAddress", address: emptyAndBinaryReceiver.address, data: body},
            );
    
            expect(transactions).toHaveTransaction({from: contract.address, to: emptyAndBinaryReceiver.address, success: true});
            expect(await emptyAndBinaryReceiver.getReceiver()).toBe("empty");
        }

        // emptyAndSliceReceiver should accept all the cases in the empty receiver
        for (const body of bodiesToTry) {
            const { transactions } = await contract.send(
                treasure.getSender(),
                { value: toNano("10") },
                { $$type: "SendCellToAddress", address: emptyAndSliceReceiver.address, data: body},
            );
    
            expect(transactions).toHaveTransaction({from: contract.address, to: emptyAndSliceReceiver.address, success: true});
            expect(await emptyAndSliceReceiver.getReceiver()).toBe("empty");
        }

        // commentAndStringReceiver should fail in the first one
        {
            const { transactions } = await contract.send(
                treasure.getSender(),
                { value: toNano("10") },
                { $$type: "SendCellToAddress", address: commentAndStringReceiver.address, data: lessThan32Bits},
            );
    
            expect(transactions).toHaveTransaction({from: contract.address, to: commentAndStringReceiver.address, success: false, exitCode: 130});
        }

        // But should succeed in the rest in the string receiver
        for (const body of bodiesToTry.slice(1)) {
            const { transactions } = await contract.send(
                treasure.getSender(),
                { value: toNano("10") },
                { $$type: "SendCellToAddress", address: commentAndStringReceiver.address, data: body},
            );
    
            expect(transactions).toHaveTransaction({from: contract.address, to: commentAndStringReceiver.address, success: true});
            expect(await commentAndStringReceiver.getReceiver()).toBe("fallback_string");
        }

        // commentAndBinaryReceiver should fail in all the cases with exit code 130
        for (const body of bodiesToTry) {
            const { transactions } = await contract.send(
                treasure.getSender(),
                { value: toNano("10") },
                { $$type: "SendCellToAddress", address: commentAndBinaryReceiver.address, data: body},
            );
    
            expect(transactions).toHaveTransaction({from: contract.address, to: commentAndBinaryReceiver.address, success: false, exitCode: 130});
        }

        // commentAndSliceReceiver should accept all the cases in the fallback receiver
        for (const body of bodiesToTry) {
            const { transactions } = await contract.send(
                treasure.getSender(),
                { value: toNano("10") },
                { $$type: "SendCellToAddress", address: commentAndSliceReceiver.address, data: body},
            );
    
            expect(transactions).toHaveTransaction({from: contract.address, to: commentAndSliceReceiver.address, success: true});
            expect(await commentAndSliceReceiver.getReceiver()).toBe("fallback");
        }

        // stringAndBinaryReceiver should fail in the first one
        {
            const { transactions } = await contract.send(
                treasure.getSender(),
                { value: toNano("10") },
                { $$type: "SendCellToAddress", address: stringAndBinaryReceiver.address, data: lessThan32Bits},
            );
    
            expect(transactions).toHaveTransaction({from: contract.address, to: stringAndBinaryReceiver.address, success: false, exitCode: 130});
        }

        // But should succeed in the rest in the string receiver
        for (const body of bodiesToTry.slice(1)) {
            const { transactions } = await contract.send(
                treasure.getSender(),
                { value: toNano("10") },
                { $$type: "SendCellToAddress", address: stringAndBinaryReceiver.address, data: body},
            );
    
            expect(transactions).toHaveTransaction({from: contract.address, to: stringAndBinaryReceiver.address, success: true});
            expect(await stringAndBinaryReceiver.getReceiver()).toBe("fallback_string");
        }

        // stringAndSliceReceiver should accept the first one in the fallback receiver
        {
            const { transactions } = await contract.send(
                treasure.getSender(),
                { value: toNano("10") },
                { $$type: "SendCellToAddress", address: stringAndSliceReceiver.address, data: lessThan32Bits},
            );
    
            expect(transactions).toHaveTransaction({from: contract.address, to: stringAndSliceReceiver.address, success: true});
            expect(await stringAndSliceReceiver.getReceiver()).toBe("fallback");
        }

        // But should accept the rest in the string receiver
        for (const body of bodiesToTry.slice(1)) {
            const { transactions } = await contract.send(
                treasure.getSender(),
                { value: toNano("10") },
                { $$type: "SendCellToAddress", address: stringAndSliceReceiver.address, data: body},
            );
    
            expect(transactions).toHaveTransaction({from: contract.address, to: stringAndSliceReceiver.address, success: true});
            expect(await stringAndSliceReceiver.getReceiver()).toBe("fallback_string");
        }

        // binaryAndSliceReceiver should accept all the cases in the fallback receiver
        for (const body of bodiesToTry) {
            const { transactions } = await contract.send(
                treasure.getSender(),
                { value: toNano("10") },
                { $$type: "SendCellToAddress", address: binaryAndSliceReceiver.address, data: body},
            );
    
            expect(transactions).toHaveTransaction({from: contract.address, to: binaryAndSliceReceiver.address, success: true});
            expect(await binaryAndSliceReceiver.getReceiver()).toBe("fallback");
        }

        // emptyAndCommentAndStringReceiver should accept all the cases in the empty receiver
        for (const body of bodiesToTry) {
            const { transactions } = await contract.send(
                treasure.getSender(),
                { value: toNano("10") },
                { $$type: "SendCellToAddress", address: emptyAndCommentAndStringReceiver.address, data: body},
            );
    
            expect(transactions).toHaveTransaction({from: contract.address, to: emptyAndCommentAndStringReceiver.address, success: true});
            expect(await emptyAndCommentAndStringReceiver.getReceiver()).toBe("empty");
        }
        
        // emptyAndCommentAndBinaryReceiver should accept all the cases in the empty receiver
        for (const body of bodiesToTry) {
            const { transactions } = await contract.send(
                treasure.getSender(),
                { value: toNano("10") },
                { $$type: "SendCellToAddress", address: emptyAndCommentAndBinaryReceiver.address, data: body},
            );
    
            expect(transactions).toHaveTransaction({from: contract.address, to: emptyAndCommentAndBinaryReceiver.address, success: true});
            expect(await emptyAndCommentAndBinaryReceiver.getReceiver()).toBe("empty");
        }

        // emptyAndCommentAndSliceReceiver should accept all the cases in the empty receiver
        for (const body of bodiesToTry) {
            const { transactions } = await contract.send(
                treasure.getSender(),
                { value: toNano("10") },
                { $$type: "SendCellToAddress", address: emptyAndCommentAndSliceReceiver.address, data: body},
            );
    
            expect(transactions).toHaveTransaction({from: contract.address, to: emptyAndCommentAndSliceReceiver.address, success: true});
            expect(await emptyAndCommentAndSliceReceiver.getReceiver()).toBe("empty");
        }

        // emptyAndStringAndBinaryReceiver should accept all the cases in the empty receiver
        for (const body of bodiesToTry) {
            const { transactions } = await contract.send(
                treasure.getSender(),
                { value: toNano("10") },
                { $$type: "SendCellToAddress", address: emptyAndStringAndBinaryReceiver.address, data: body},
            );
    
            expect(transactions).toHaveTransaction({from: contract.address, to: emptyAndStringAndBinaryReceiver.address, success: true});
            expect(await emptyAndStringAndBinaryReceiver.getReceiver()).toBe("empty");
        }

        // emptyAndStringAndSliceReceiver should accept all the cases in the empty receiver
        for (const body of bodiesToTry) {
            const { transactions } = await contract.send(
                treasure.getSender(),
                { value: toNano("10") },
                { $$type: "SendCellToAddress", address: emptyAndStringAndSliceReceiver.address, data: body},
            );
    
            expect(transactions).toHaveTransaction({from: contract.address, to: emptyAndStringAndSliceReceiver.address, success: true});
            expect(await emptyAndStringAndSliceReceiver.getReceiver()).toBe("empty");
        }

        // emptyAndBinaryAndSliceReceiver should accept all the cases in the empty receiver
        for (const body of bodiesToTry) {
            const { transactions } = await contract.send(
                treasure.getSender(),
                { value: toNano("10") },
                { $$type: "SendCellToAddress", address: emptyAndBinaryAndSliceReceiver.address, data: body},
            );
    
            expect(transactions).toHaveTransaction({from: contract.address, to: emptyAndBinaryAndSliceReceiver.address, success: true});
            expect(await emptyAndBinaryAndSliceReceiver.getReceiver()).toBe("empty");
        }

        // commentAndStringAndBinaryReceiver should fail in the first one
        {
            const { transactions } = await contract.send(
                treasure.getSender(),
                { value: toNano("10") },
                { $$type: "SendCellToAddress", address: commentAndStringAndBinaryReceiver.address, data: lessThan32Bits},
            );
    
            expect(transactions).toHaveTransaction({from: contract.address, to: commentAndStringAndBinaryReceiver.address, success: false, exitCode: 130});
        }

        // But should succeed in the rest in the string receiver
        for (const body of bodiesToTry.slice(1)) {
            const { transactions } = await contract.send(
                treasure.getSender(),
                { value: toNano("10") },
                { $$type: "SendCellToAddress", address: commentAndStringAndBinaryReceiver.address, data: body},
            );
    
            expect(transactions).toHaveTransaction({from: contract.address, to: commentAndStringAndBinaryReceiver.address, success: true});
            expect(await commentAndStringAndBinaryReceiver.getReceiver()).toBe("fallback_string");
        }

        // commentAndStringAndSliceReceiver should accept the first one in the fallback receiver
        {
            const { transactions } = await contract.send(
                treasure.getSender(),
                { value: toNano("10") },
                { $$type: "SendCellToAddress", address: commentAndStringAndSliceReceiver.address, data: lessThan32Bits},
            );
    
            expect(transactions).toHaveTransaction({from: contract.address, to: commentAndStringAndSliceReceiver.address, success: true});
            expect(await commentAndStringAndSliceReceiver.getReceiver()).toBe("fallback");
        }

        // But should accept the rest in the string receiver
        for (const body of bodiesToTry.slice(1)) {
            const { transactions } = await contract.send(
                treasure.getSender(),
                { value: toNano("10") },
                { $$type: "SendCellToAddress", address: commentAndStringAndSliceReceiver.address, data: body},
            );
    
            expect(transactions).toHaveTransaction({from: contract.address, to: commentAndStringAndSliceReceiver.address, success: true});
            expect(await commentAndStringAndSliceReceiver.getReceiver()).toBe("fallback_string");
        }

        // commentAndBinaryAndSliceReceiver should accept all the cases in the fallback receiver
        for (const body of bodiesToTry) {
            const { transactions } = await contract.send(
                treasure.getSender(),
                { value: toNano("10") },
                { $$type: "SendCellToAddress", address: commentAndBinaryAndSliceReceiver.address, data: body},
            );
    
            expect(transactions).toHaveTransaction({from: contract.address, to: commentAndBinaryAndSliceReceiver.address, success: true});
            expect(await commentAndBinaryAndSliceReceiver.getReceiver()).toBe("fallback");
        }

        // stringAndBinaryAndSliceReceiver should accept the first one in the fallback receiver
        {
            const { transactions } = await contract.send(
                treasure.getSender(),
                { value: toNano("10") },
                { $$type: "SendCellToAddress", address: stringAndBinaryAndSliceReceiver.address, data: lessThan32Bits},
            );
    
            expect(transactions).toHaveTransaction({from: contract.address, to: stringAndBinaryAndSliceReceiver.address, success: true});
            expect(await stringAndBinaryAndSliceReceiver.getReceiver()).toBe("fallback");
        }

        // But should accept the rest in the string receiver
        for (const body of bodiesToTry.slice(1)) {
            const { transactions } = await contract.send(
                treasure.getSender(),
                { value: toNano("10") },
                { $$type: "SendCellToAddress", address: stringAndBinaryAndSliceReceiver.address, data: body},
            );
    
            expect(transactions).toHaveTransaction({from: contract.address, to: stringAndBinaryAndSliceReceiver.address, success: true});
            expect(await stringAndBinaryAndSliceReceiver.getReceiver()).toBe("fallback_string");
        }

        // emptyAndCommentAndStringAndBinaryReceiver should accept all the cases in the empty receiver
        for (const body of bodiesToTry) {
            const { transactions } = await contract.send(
                treasure.getSender(),
                { value: toNano("10") },
                { $$type: "SendCellToAddress", address: emptyAndCommentAndStringAndBinaryReceiver.address, data: body},
            );
    
            expect(transactions).toHaveTransaction({from: contract.address, to: emptyAndCommentAndStringAndBinaryReceiver.address, success: true});
            expect(await emptyAndCommentAndStringAndBinaryReceiver.getReceiver()).toBe("empty");
        }

        // emptyAndCommentAndStringAndSliceReceiver should accept all the cases in the empty receiver
        for (const body of bodiesToTry) {
            const { transactions } = await contract.send(
                treasure.getSender(),
                { value: toNano("10") },
                { $$type: "SendCellToAddress", address: emptyAndCommentAndStringAndSliceReceiver.address, data: body},
            );
    
            expect(transactions).toHaveTransaction({from: contract.address, to: emptyAndCommentAndStringAndSliceReceiver.address, success: true});
            expect(await emptyAndCommentAndStringAndSliceReceiver.getReceiver()).toBe("empty");
        }

        // emptyAndCommentAndBinaryAndSliceReceiver should accept all the cases in the empty receiver
        for (const body of bodiesToTry) {
            const { transactions } = await contract.send(
                treasure.getSender(),
                { value: toNano("10") },
                { $$type: "SendCellToAddress", address: emptyAndCommentAndBinaryAndSliceReceiver.address, data: body},
            );
    
            expect(transactions).toHaveTransaction({from: contract.address, to: emptyAndCommentAndBinaryAndSliceReceiver.address, success: true});
            expect(await emptyAndCommentAndBinaryAndSliceReceiver.getReceiver()).toBe("empty");
        }

        // emptyAndStringAndBinaryAndSliceReceiver should accept all the cases in the empty receiver
        for (const body of bodiesToTry) {
            const { transactions } = await contract.send(
                treasure.getSender(),
                { value: toNano("10") },
                { $$type: "SendCellToAddress", address: emptyAndStringAndBinaryAndSliceReceiver.address, data: body},
            );
    
            expect(transactions).toHaveTransaction({from: contract.address, to: emptyAndStringAndBinaryAndSliceReceiver.address, success: true});
            expect(await emptyAndStringAndBinaryAndSliceReceiver.getReceiver()).toBe("empty");
        }

        // commentAndStringAndBinaryAndSliceReceiver should accept the first one in the fallback receiver
        {
            const { transactions } = await contract.send(
                treasure.getSender(),
                { value: toNano("10") },
                { $$type: "SendCellToAddress", address: commentAndStringAndBinaryAndSliceReceiver.address, data: lessThan32Bits},
            );
    
            expect(transactions).toHaveTransaction({from: contract.address, to: commentAndStringAndBinaryAndSliceReceiver.address, success: true});
            expect(await commentAndStringAndBinaryAndSliceReceiver.getReceiver()).toBe("fallback");
        }

        // But should accept the rest in the string receiver
        for (const body of bodiesToTry.slice(1)) {
            const { transactions } = await contract.send(
                treasure.getSender(),
                { value: toNano("10") },
                { $$type: "SendCellToAddress", address: commentAndStringAndBinaryAndSliceReceiver.address, data: body},
            );
    
            expect(transactions).toHaveTransaction({from: contract.address, to: commentAndStringAndBinaryAndSliceReceiver.address, success: true});
            expect(await commentAndStringAndBinaryAndSliceReceiver.getReceiver()).toBe("fallback_string");
        }

        // allReceivers should accept all the cases in the empty receiver
        for (const body of bodiesToTry) {
            const { transactions } = await contract.send(
                treasure.getSender(),
                { value: toNano("10") },
                { $$type: "SendCellToAddress", address: allReceivers.address, data: body},
            );
    
            expect(transactions).toHaveTransaction({from: contract.address, to: allReceivers.address, success: true});
            expect(await allReceivers.getReceiver()).toBe("empty");
        }
    });

});
