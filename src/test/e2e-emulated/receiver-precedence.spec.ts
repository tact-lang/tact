import { beginCell, Cell, toNano } from "@ton/core";
import { Blockchain, SandboxContract, TreasuryContract } from "@ton/sandbox";
import { ReceiverTester } from "./contracts/output/receiver-precedence_ReceiverTester";
import { Calculator } from "./contracts/output/receiver-precedence_Calculator";
import "@ton/test-utils";

describe("receivers-precedence", () => {
    let blockchain: Blockchain;
    let treasure: SandboxContract<TreasuryContract>;
    let contract: SandboxContract<ReceiverTester>;
    let calculator: SandboxContract<Calculator>;

    beforeEach(async () => {
        blockchain = await Blockchain.create();
        blockchain.verbosity.print = false;
        treasure = await blockchain.treasury("treasure");

        contract = blockchain.openContract(await ReceiverTester.fromInit());
        calculator = blockchain.openContract(await Calculator.fromInit());

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
        expect(receiver1 === "empty").toBe(true);

        // Send now a "message"
        await contract.send(
            treasure.getSender(),
            { value: toNano("10") },
            "message",
        );
        const receiver2 = await contract.getReceiverKind();
        // Note the receiver "error_comment" did not execute
        expect(receiver2 === "comment").toBe(true);

        // Send now an arbitrary string different from "message"
        await contract.send(
            treasure.getSender(),
            { value: toNano("10") },
            "msg",
        );
        const receiver3 = await contract.getReceiverKind();
        // Now, the receiver for general strings executed.
        // Note that "error_comment" still does not execute, nor the "message_slice" receiver.
        expect(receiver3 === "comment_fallback").toBe(true);

        // Send now a Message (note the capital letter in Message)
        await contract.send(
            treasure.getSender(),
            { value: toNano("10") },
            { $$type: "Message", msg: "message" },
        );
        const receiver4 = await contract.getReceiverKind();
        // Now, the receiver for Message executed.
        expect(receiver4 === "binary_message").toBe(true);

        // Now, simulate different kinds of messages using slices

        // First, an empty message, which can be simulated with an empty slice
        await contract.send(
            treasure.getSender(),
            { value: toNano("10") },
            new Cell().asSlice(),
        );
        // The empty receiver executed
        const receiver5 = await contract.getReceiverKind();
        expect(receiver5 === "empty").toBe(true);

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
        expect(receiver6 === "comment").toBe(true);

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
        expect(receiver7 === "comment_fallback").toBe(true);

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
        expect(receiver8 === "message_slice").toBe(true);

        // Send now an arbitrary slice
        await contract.send(
            treasure.getSender(),
            { value: toNano("10") },
            beginCell().storeUint(10, 32).endCell().asSlice(),
        );
        const receiver9 = await contract.getReceiverKind();
        // Now, the receiver for slices executed.
        expect(receiver9 === "fallback").toBe(true);

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
        expect(receiver1 === "bounced_binary_message").toBe(true);

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
        expect(receiver2 === "bounced_binary_message").toBe(true);

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
        expect(receiver3 === "fallback").toBe(true);

        // Tell the contract to send an unknown non-arithmetical request to the calculator.
        await contract.send(
            treasure.getSender(),
            { value: toNano("10") },
            "do_unknown_request",
        );
        const receiver4 = await contract.getReceiverKind();
        // The request was bounced back, because the calculator does not know how to process it.
        // The contract gets the request bounced back into its bounced fallback receiver.
        expect(receiver4 === "bounced_fallback").toBe(true);
    });

    it("should implement external receiver precedence correctly", async () => {
        // These tests are very similar to the tests for internal messages.

        // Send an empty message
        await contract.sendExternal(null);
        const receiver1 = await contract.getReceiverKind();
        expect(receiver1 === "external_empty").toBe(true);

        // Send now a "message"
        await contract.sendExternal("message");
        const receiver2 = await contract.getReceiverKind();
        // Note the external receiver "external_error_comment" did not execute
        expect(receiver2 === "external_comment").toBe(true);

        // Send now an arbitrary string different from "message"
        await contract.sendExternal("msg");
        const receiver3 = await contract.getReceiverKind();
        // Now, the external receiver for general strings executed.
        // Note that "external_error_comment" still does not execute, nor the "external_message_slice" receiver.
        expect(receiver3 === "external_comment_fallback").toBe(true);

        // Send now a Message
        await contract.sendExternal({ $$type: "Message", msg: "message" });
        const receiver4 = await contract.getReceiverKind();
        // Now, the external receiver for Message executed.
        expect(receiver4 === "external_binary_message").toBe(true);

        // Tests for fallback external receiver (i.e., external receiver with Slice parameter),
        // will be added here once issue https://github.com/tact-lang/tact/issues/1669 is solved.
        // See notes in sub-issue: https://github.com/tact-lang/tact/issues/1787

        // In all the cases, "external_error_comment" did not execute, as it should be.
    });
});
