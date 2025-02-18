import { MessageModeTester } from "./contracts/output/message-mode-tester_MessageModeTester";
import { Calculator } from "./contracts/output/message-mode-tester_Calculator";
import { Blockchain } from "@ton/sandbox";
import type {
    BlockchainTransaction,
    SandboxContract,
    TreasuryContract,
} from "@ton/sandbox";
import { toNano } from "@ton/core";
import type {
    Message,
    TransactionActionPhase,
    TransactionComputeVm,
    TransactionDescriptionGeneric,
} from "@ton/core";
import { findTransaction } from "@ton/test-utils";
import type { Maybe } from "@ton/core/dist/utils/maybe";

type MessageInfo = {
    validatorsForwardFee: bigint;
    value: bigint;
    bounced: boolean;
};

/* All tests in this spec file have three contracts as participants:
   - The treasury contract, responsible for triggering the tests and deploying the rest of contracts.
   - The MessageModeTester contract (or tester, for short) responsible for sending requests to the Calculator contract.
   - The Calculator contract, responsible for receiving requests from the tester and sending the results back to the tester.

   The Calculator contract receives requests to compute averages of numbers in close integer intervals [a,b]. For example,
   the average of all integers in the interval [0,4] is 2. The Calculator reports an error if the interval is ill-formed, 
   for example [3,1].

   All the test in this file explore the behavior of sending requests to the Calculator using the message mode SendDefaultMode
   with no flags.
*/
describe("SendDefaultMode with no flags", () => {
    let blockchain: Blockchain;
    let treasure: SandboxContract<TreasuryContract>;
    let tester: SandboxContract<MessageModeTester>;
    let calculator: SandboxContract<Calculator>;

    beforeEach(async () => {
        blockchain = await Blockchain.create();
        blockchain.verbosity.print = false;
        treasure = await blockchain.treasury("treasure");

        tester = blockchain.openContract(await MessageModeTester.fromInit());
        calculator = blockchain.openContract(await Calculator.fromInit());

        const testerDeployResult = await tester.send(
            treasure.getSender(),
            { value: toNano("10") },
            null,
        );

        expect(testerDeployResult.transactions).toHaveTransaction({
            from: treasure.address,
            to: tester.address,
            success: true,
            deploy: true,
        });

        const calculatorDeployResult = await calculator.send(
            treasure.getSender(),
            { value: toNano("10") },
            null,
        );

        expect(calculatorDeployResult.transactions).toHaveTransaction({
            from: treasure.address,
            to: calculator.address,
            success: true,
            deploy: true,
        });
    });

    /* This test represents the normal behavior when all transactions finalize without errors.
   The summary of the test is as follows:

   1) The treasury will send a message to the tester, indicating the tester to start a 
      request to the calculator for computing the average of the interval [0,4].
      
   2) The tester creates an AverageRequest message (SendDefaultMode with no flags), 
      indicating that it will include 1 TON in the "value" of the message.
      The tester also includes in its request that the Calculator should pay 1 TON when it sends its response back to the tester.

   3) During the action phase, message forward fees will be deducted from the 1 TON payed by the tester. The message is sent
      to the calculator with a final value of: "1 TON - message forward fees". Call this value "ReqV" (i.e., Request Value).

   4) The calculator receives the message. An amount of ReqV TONs (i.e., the value in the incoming message) 
      is added to the calculator's balance. 
    
   5) The calculator computes the average of the interval [0,4], producing 2 as result. All the transaction fees
      are deducted from the calculator's balance. 

   6) The calculator creates an AverageResult message (SendDefaultMode with no flags), 
      indicating that it will include 1 TON in the "value" of the message.
   
   7) During the action phase of the calculator, message forward fees will be deducted from the 1 TON payed by the calculator. 
      The message is sent to the tester with a final value of: "1 TON - message forward fees". 
      Call this value "ResV" (i.e., Response Value).

   8) The tester receives the message. An amount of ResV TONs (i.e., the value in the incoming message)
      is added to the tester's balance. The tester updates its "val" field with the result of the computation.

   Summary of transactions:

   T1) Triggered by message sent from treasury to tester. Sends average request to calculator.
   T2) Triggered by message sent from tester to calculator. Computes average and sends response back to tester.
   T3) Triggered by message sent from calculator to tester. Sets the result of the computation into the "val" field in the tester.
*/
    it("should carry out transactions without errors", async () => {
        // The amount the tester contract will pay in its request message to the calculator contract: 1 TON
        const amountToPayInRequest = toNano("1");
        // The amount the calculator contract will pay in its response message to the tester: 1 TON
        const amountToPayInCalculatorResponse = toNano("1");

        // Contract balances before all the transactions
        const testerBalanceBefore = (
            await blockchain.getContract(tester.address)
        ).balance;
        const calculatorBalanceBefore = (
            await blockchain.getContract(calculator.address)
        ).balance;

        // Treasury triggers the test by telling the tester to request the computation of the average of the interval [0,4]
        // The treasure also indicates that the tester should pay 1 TON in its request, and that the calculator
        // should pay 1 TON in its response message.
        const { transactions } = await tester.send(
            treasure.getSender(),
            { value: toNano("10") },
            {
                $$type: "DoCalculatorRequest",
                from: 0n,
                to: 4n,
                amountToPayInRequest,
                amountToPayInCalculatorResponse,
            },
        );

        // Contract balances after all transactions
        const testerBalanceAfter = (
            await blockchain.getContract(tester.address)
        ).balance;
        const calculatorBalanceAfter = (
            await blockchain.getContract(calculator.address)
        ).balance;

        // Check that the transactions exist
        // Transaction T1 (see summary of transactions at the start of the test)
        const testerRequestTsx = ensureTransactionIsDefined(
            findTransaction(transactions, {
                from: treasure.address,
                to: tester.address,
                success: true,
            }),
        );
        // Transaction T2
        const calculatorTsx = ensureTransactionIsDefined(
            findTransaction(transactions, {
                from: tester.address,
                to: calculator.address,
                success: true,
            }),
        );
        // Transaction T3
        const testerResultTsx = ensureTransactionIsDefined(
            findTransaction(transactions, {
                from: calculator.address,
                to: tester.address,
                success: true,
            }),
        );

        // Check that the transactions occurred in the logical order
        // i.e., the tester request transaction executed before the calculator transaction
        // and the calculator transaction executed before the tester response transaction.
        expect(testerRequestTsx.lt < calculatorTsx.lt).toBe(true);
        expect(calculatorTsx.lt < testerResultTsx.lt).toBe(true);

        /* In SendDefaultMode with no flags, outbound messages must pay for forward fees. The forward fees are deducted from the 
       initial "value" passed as parameter to the send function. So that if we execute:

       send(SendParameters{
                ......
                value: V,
                ......
                });

       the message final value is: V - msg_fwd_fee
       
       where msg_fwd_fee is the forward fee computed during the action phase.

       Additionally, one fraction of msg_fwd_fee is assigned as forward fees for the blockchain validators:
       https://docs.ton.org/v3/documentation/smart-contracts/transaction-fees/fees-low-level#formula-1
       (Confusingly, the TON docs call "msg forward fee" the message forward fee computed during the action phase,
       and "forward fee" the fraction of "msg forward fee" given to the validators).
       The fraction that was not assigned as forward fees for the validators is assigned as action fees.

       The following figure may help in visualizing the above concepts:

       Imagine this chunk represents the amount payed by the contract in its send function, for example, the 1 TON
       payed by the tester in its request to the calculator:

       |-----------------------------------------------|

       During the action phase, an amount of msg_fwd_fee will be removed from the above chunk (i.e., the message forward fees):

       |--------------------|--------------------------|
             final value             msg_fwd_fee    

       Additionally, a fraction of msg_fwd_fee will be reserved as forward fees for validators, while the rest will be deemed
       to be action fees:

       |--------------------|--------------|-----------|
             final value         fwd_fee     action fee
                                      msg_fwd_fee 

       When the message is sent to the calculator, the message will carry the final value chunk and the fwd_fee chunk. 
       During the message transit, the fwd_fee chunk is consumed by the validators, and when the message arrives to 
       the calculator, the "final value" chunk is added to the calculator's balance.

       The above computation is carried out for each sent message. 
       In this test, since each action phase in every transaction sends a single message, we can extract msg_fwd_fee from
       the total message forward fee computed in the action phase of the transaction object.
       This is what we are going to do now in order to check that the final value of the outbound messages 
       are actually their initial value minus the message forward fees.
    */

        // Extract the only message sent by the tester to the calculator
        const testerOutMessage = ensureMessageIsDefined(
            testerRequestTsx.outMessages.get(0),
        );
        // Extract the only message sent by the calculator back to the tester
        const calculatorOutMessage = ensureMessageIsDefined(
            calculatorTsx.outMessages.get(0),
        );

        // Check that the value assigned to testerOutMessage is the original "value" in the send function
        // but deducted with the message forward fees
        const testerMessageForwardFee =
            extractTotalMessageForwardFee(testerRequestTsx);
        const testerOutMessageInfo = getMessageInfo(testerOutMessage);
        const expectedTesterOutMessageValue =
            amountToPayInRequest - testerMessageForwardFee;
        expect(expectedTesterOutMessageValue.toString()).toBe(
            testerOutMessageInfo.value.toString(),
        );

        // Check that the value assigned to calculatorOutMessage is the original "value" in the send function
        // but deducted with the message forward fees.
        const calculatorMessageForwardFee =
            extractTotalMessageForwardFee(calculatorTsx);
        const calculatorOutMessageInfo = getMessageInfo(calculatorOutMessage);
        const expectedCalculatorOutMessageValue =
            amountToPayInCalculatorResponse - calculatorMessageForwardFee;
        expect(expectedCalculatorOutMessageValue.toString()).toBe(
            calculatorOutMessageInfo.value.toString(),
        );

        // Now we check that the observed final balances in each contract can actually be obtained from their initial balances
        // by subtracting the transaction fees, crediting the initial message value, and subtracting the outbound message values.
        // In other words, we want to check that the relation C_B + D = C_A holds, where C_B is the contract balance BEFORE the transaction,
        // C_A is the contract balance AFTER the transaction, and D is the "delta" amount encoding the transaction fees and similar quantities.
        // The explanation on how the "delta" is computed can be seen inside the function computeBalanceDelta.

        // Balance delta for tester in its first transaction. We pass the info of the only message sent during this transaction.
        const testerDelta1 = computeBalanceDelta(
            testerRequestTsx,
            testerOutMessageInfo,
        );
        // Balance delta for calculator (in its only transaction). We also pass the info of the only message sent during this transaction.
        const calculatorDelta = computeBalanceDelta(
            calculatorTsx,
            calculatorOutMessageInfo,
        );
        // Balance delta for tester in its second transaction
        // Since this transaction does not send messages, we pass no MessageInfo object
        const testerDelta2 =
            computeBalanceDeltaWithNoOutputMessage(testerResultTsx);

        // If we add all the deltas for tester, together with its initial balance, we should get its measured final balance
        const expectedTesterBalanceAfter =
            testerBalanceBefore + testerDelta1 + testerDelta2;
        expect(expectedTesterBalanceAfter.toString()).toBe(
            testerBalanceAfter.toString(),
        );
        // Similarly for the calculator
        const expectedCalculatorBalanceAfter =
            calculatorBalanceBefore + calculatorDelta;
        expect(expectedCalculatorBalanceAfter.toString()).toBe(
            calculatorBalanceAfter.toString(),
        );

        // Finally, since the average of [0,4] is 2, we should have that value in the tester
        const finalValue = await tester.getCurrentResult();
        expect(finalValue.toString()).toBe("2");
    });

    /* This test checks when the tester contract makes a request to the calculator, but the tester does not 
       include enough funds to pay for message forward fees.
       
       The summary of the test is as follows:
    
       1) The treasury will send a message to the tester, indicating the tester to start a 
          request to the calculator for computing the average of the interval [0,4].
          
       2) During the computation phase, the tester creates an AverageRequest message (SendDefaultMode with no flags), 
          indicating that it will include 0 TON in the "value" of the message.
          The tester sets its "val" contract field to -3 ("op requested, no answer yet").
          The computation phase for the tester contract succeeds. 
    
       3) During the action phase for the tester contract, since there is not enough funds for message forward fees 
          in the "value" of the request message, the action phase will fail with result code 40. 
          This means that the request never reaches the calculator.
    
       4) The tester's transaction is rolled back. The tester contract field "val" is reset to -1 ("initial state").
          However, the tester contract still payed for the transaction fees.
        

       Summary of transactions:
    
       T1) Triggered by message sent from treasury to tester. Attempts to send request to calculator in action phase, 
           but fails and it is rolled back.
    */
    it("should test a request with not enough funds to pay for request message forward fees", async () => {
        // The amount the tester contract will pay in its request message to the calculator contract: 0 TON.
        // Since this amount does not cover the message forward fees, the tester will fail its action phase
        // while attempting to send the request to the calculator.
        const amountToPayInRequest = 0n;
        // In this test, the calculator never receives the request from the tester. Hence, it is irrelevant
        // the number we place in the amountToPayInCalculatorResponse. We set it to zero.
        const amountToPayInCalculatorResponse = 0n;

        // Contract balances before all the transactions
        const testerBalanceBefore = (
            await blockchain.getContract(tester.address)
        ).balance;
        const calculatorBalanceBefore = (
            await blockchain.getContract(calculator.address)
        ).balance;

        // Treasury triggers the test by telling the tester to request the computation of the average of the interval [0,4].
        // The treasure also indicates that the tester should pay 0 TON in its request, and that the calculator
        // should pay 0 TON in its response message (in this test, the calculator never receives the request in the first place).
        const { transactions } = await tester.send(
            treasure.getSender(),
            { value: toNano("10") },
            {
                $$type: "DoCalculatorRequest",
                from: 0n,
                to: 4n,
                amountToPayInRequest,
                amountToPayInCalculatorResponse,
            },
        );

        // Contract balances after all transactions
        const testerBalanceAfter = (
            await blockchain.getContract(tester.address)
        ).balance;
        const calculatorBalanceAfter = (
            await blockchain.getContract(calculator.address)
        ).balance;

        // Check that the transaction for the tester contract exist, and it is a failed transaction.
        // Transaction T1 (see summary of transactions at the start of the test)
        const testerRequestTsx = ensureTransactionIsDefined(
            findTransaction(transactions, {
                from: treasure.address,
                to: tester.address,
                success: false,
            }),
        );
        // Check that the calculator did not execute a transaction
        expect(
            findTransaction(transactions, {
                from: tester.address,
                to: calculator.address,
            }),
        ).toBeUndefined();

        // Check that the transaction did not send a message
        expect(testerRequestTsx.outMessagesCount).toBe(0);

        // Check that the computation phase in the tester contract was successful.
        const compPhase = getComputationPhase(testerRequestTsx);
        expect(compPhase.success).toBe(true);

        // Check that the action phase in the tester contract failed with result code 40
        const actionPhase = getActionPhase(testerRequestTsx);
        expect(actionPhase.resultCode).toBe(40);
        expect(actionPhase.success).toBe(false);

        // Now compute the delta for the tester transaction.
        // Since the tester did not send a message, we pass no MessageInfo object.
        const testerDelta =
            computeBalanceDeltaWithNoOutputMessage(testerRequestTsx);

        // If we add the tester's delta to its initial balance, we should get its measured final balance.
        const expectedTesterBalanceAfter = testerBalanceBefore + testerDelta;
        expect(expectedTesterBalanceAfter.toString()).toBe(
            testerBalanceAfter.toString(),
        );
        // The calculator did not execute a transaction, hence its balance did not change.

        expect(calculatorBalanceBefore.toString()).toBe(
            calculatorBalanceAfter.toString(),
        );

        // Finally, since the tester failed its action phase, the transaction was rolled back
        // (even though its computation phase was successful).
        // This means that the "val" field in the tester contract was reset to -1 ("initial state"),
        // instead of -3 ("op requested, no answer yet").
        const finalValue = await tester.getCurrentResult();
        expect(finalValue.toString()).toBe("-1");

        // Check that the tester contract actually payed for the transaction fees even though its
        // transaction was rolled back. This is checked as follows:
        // IF we remove from the FINAL balance these two items:
        // - the initial balance.
        // - the amount gained from the incoming message (i.e., the message sent by the treasury)
        // THEN, we should get a negative amount which must equal the transaction total fees.
        const incomingMessageInfo = getMessageInfo(
            ensureMessageIsDefined(testerRequestTsx.inMessage),
        );
        const expectedPayedTotalFees = -(
            testerBalanceAfter -
            testerBalanceBefore -
            incomingMessageInfo.value
        );
        expect(expectedPayedTotalFees.toString()).toBe(
            testerRequestTsx.totalFees.coins.toString(),
        );
    });

    /* This test checks when the tester contract sends an invalid request to the calculator, and the tester contract
       includes enough funds in the request to receive a bounced message from the calculator, signaling the error.
       
       The summary of the test is as follows:
    
       1) The treasury will send a message to the tester, indicating the tester to start a 
          request to the calculator for computing the average of the INVALID interval [4,0].
          
       2) During the computation phase, the tester creates an AverageRequest message (SendDefaultMode with no flags), 
          indicating that it will include 1 TON in the "value" of the message. This amount is enough to cover the
          calculator's transaction fees and message forward fees for the bounced message. 
          The tester sets its "val" contract field to -3 ("op requested, no answer yet").
          The computation phase for the tester contract succeeds. 
    
       3) The action phase for the tester contract successfully sends the request.
    
       4) The calculator receives the request and aborts its computation phase because the interval [4,0] is 
          invalid, i.e, there must exist at least one number in the interval because [4,0] is an empty interval.
       
       5) The calculator skips its action phase, but enters its bounce phase. 
          The calculator sends a bounced message back to the tester, because there is still enough funds 
          in the incoming request to pay for message forward fees in the bounced message (after the transaction fees
          were deducted from the value in the incoming message).
        
       6) The tester receives the bounced message. The tester sets its contract field "val" to -2 ("error").

       Summary of transactions:
    
       T1) Triggered by message sent from treasury to tester. Sends request to calculator to compute 
           average of invalid interval [4,0] with enough funds to receive the bounced message.
        
       T2) Triggered by the message sent from tester to calculator. The transaction is aborted during the 
           computation phase (due to an invalid request from the tester) and sends a bounced message back to the tester,
           because there was still enough funds in the incoming request.

       T3) Triggered by the bounced message sent from calculator to tester. Receives the bounced message and 
           sets the tester's field "val" to -2 ("error").
    */
    it("should test an invalid request to calculator with enough funds to pay for bounced message forward fees", async () => {
        // The amount the tester contract will pay in its request message to the calculator contract: 1 TON.
        const amountToPayInRequest = toNano("1");
        // In this test, the calculator will fail its computation phase, so that it will never send a response
        // back to the tester. Hence, it will be irrelevant
        // the number in amountToPayInCalculatorResponse. We set it to zero.
        const amountToPayInCalculatorResponse = 0n;

        // Contract balances before all the transactions
        const testerBalanceBefore = (
            await blockchain.getContract(tester.address)
        ).balance;
        const calculatorBalanceBefore = (
            await blockchain.getContract(calculator.address)
        ).balance;

        // Treasury triggers the test by telling the tester to request the computation of the average of the INVALID interval [4,0].
        // The treasure also indicates that the tester should pay 1 TON in its request, and that the calculator
        // should pay 0 TON in its response message (in this test, the calculator will not send the response back to the tester due
        // to an invalid request).
        const { transactions } = await tester.send(
            treasure.getSender(),
            { value: toNano("10") },
            {
                $$type: "DoCalculatorRequest",
                from: 4n,
                to: 0n,
                amountToPayInRequest,
                amountToPayInCalculatorResponse,
            },
        );

        // Contract balances after all transactions
        const testerBalanceAfter = (
            await blockchain.getContract(tester.address)
        ).balance;
        const calculatorBalanceAfter = (
            await blockchain.getContract(calculator.address)
        ).balance;

        // Check that the transactions exist
        // Transaction T1 (see summary of transactions at the start of the test)
        // This transaction sends the invalid request to the calculator.
        const testerRequestTsx = ensureTransactionIsDefined(
            findTransaction(transactions, {
                from: treasure.address,
                to: tester.address,
                success: true,
            }),
        );
        // Transaction T2
        // The calculator aborts the transaction during its computation phase (due to an invalid request from the tester)
        // and sends a bounced message back to the tester.
        const calculatorTsx = ensureTransactionIsDefined(
            findTransaction(transactions, {
                from: tester.address,
                to: calculator.address,
                success: false,
            }),
        );
        // Transaction T3
        // The transaction that processes the bounced message in the tester
        const testerBouncedTsx = ensureTransactionIsDefined(
            findTransaction(transactions, {
                from: calculator.address,
                to: tester.address,
                success: true,
            }),
        );

        // Check that the transactions occurred in the logical order
        // i.e., the tester request transaction executed before the calculator transaction
        // and the calculator transaction executed before the tester bounced transaction.
        expect(testerRequestTsx.lt < calculatorTsx.lt).toBe(true);
        expect(calculatorTsx.lt < testerBouncedTsx.lt).toBe(true);

        // Check that the calculator transaction failed in its computation phase with exit code 25459.
        // 25459 corresponds to message "There must exist at least one number in the interval"
        // according to "MessageModeTester.md"
        const calculatorCompPhase = getComputationPhase(calculatorTsx);
        expect(calculatorCompPhase.success).toBe(false);
        expect(calculatorCompPhase.exitCode).toBe(25459);

        // Check that the calculator's action phase did not execute, but its bounce phase did
        const calculatorTsxDescription =
            getTransactionDescription(calculatorTsx);
        expect(calculatorTsxDescription.actionPhase).toBeUndefined();
        expect(calculatorTsxDescription.bouncePhase).toBeDefined();

        // Extract the only message sent by the tester to the calculator
        const testerOutMessage = ensureMessageIsDefined(
            testerRequestTsx.outMessages.get(0),
        );
        // Extract the only message sent by the calculator back to the tester (i.e., the bounced message)
        const calculatorOutMessage = ensureMessageIsDefined(
            calculatorTsx.outMessages.get(0),
        );
        // We will also need the incoming message to the calculator in order to compute the value of the bounced message.
        const calculatorInMessage = ensureMessageIsDefined(
            calculatorTsx.inMessage,
        );

        // Check that the value assigned to testerOutMessage is the original "value" in the send function
        // but deducted with the message forward fees
        const testerMessageForwardFee =
            extractTotalMessageForwardFee(testerRequestTsx);
        const testerOutMessageInfo = getMessageInfo(testerOutMessage);
        const expectedTesterOutMessageValue =
            amountToPayInRequest - testerMessageForwardFee;
        expect(expectedTesterOutMessageValue.toString()).toBe(
            testerOutMessageInfo.value.toString(),
        );

        // For computing the value in bounced messages, we can estimate it by using this formula:
        //     outMessage.value = inValue - totalFees - BouncePhaseMessageForwardFees
        //
        // where inValue: is the value in the incoming message
        //       totalFees: is the total transaction fees
        //       BouncePhaseMessageForwardFees: is the message forward fees computed during the bounce phase
        //
        // The message forward fees are computed in the bounce phase, NOT in the action phase (i.e., the action phase did not execute,
        // because the computation phase failed).
        //
        // Additionally, the forward fees for validators in the bounced message is just the BouncePhaseMessageForwardFees
        //
        // There is a problem though. totalFees is subject to real number rounding.
        // See for example that total fees uses a toFixed that rounds the numbers in this
        // calculator in the TON Docs: https://docs.ton.org/v3/documentation/smart-contracts/transaction-fees/fees#basic-fees-formula
        // This means that the above formula for estimating outMessage.value sometimes will miss the value stored in outMessage.value
        // by a very small amount due to rounding in totalFees.

        // Now, obtain BouncePhaseMessageForwardFees from the bounce phase
        const calculatorBouncePhaseMessageForwardFees =
            extractTotalBouncedMessageForwardFee(calculatorTsx);
        const calculatorOutMessageInfo = getMessageInfo(calculatorOutMessage);
        const calculatorInMessageInfo = getMessageInfo(calculatorInMessage);
        // Check the bounce message value is according to the above formula within a small error
        const expectedCalculatorOutMessageValue =
            calculatorInMessageInfo.value -
            calculatorTsx.totalFees.coins -
            calculatorBouncePhaseMessageForwardFees;
        expect(
            computeErrorIntervalOfNumber(expectedCalculatorOutMessageValue),
        ).toContain(calculatorOutMessageInfo.value.toString());
        // Check that the forward fee for validators in the bounced message is just the calculator message forward fees
        expect(calculatorOutMessageInfo.validatorsForwardFee.toString()).toBe(
            calculatorBouncePhaseMessageForwardFees.toString(),
        );

        // Check that the message sent by the calculator has its bounced flag active
        expect(calculatorOutMessageInfo.bounced).toBe(true);

        // Now we check that the observed final balances in each contract can actually be obtained from their initial balances
        // by subtracting the transaction fees, crediting the initial message value, and subtracting the outbound message values.
        // In other words, we want to check that the relation C_B + D = C_A holds, where C_B is the contract balance BEFORE the transaction,
        // C_A is the contract balance AFTER the transaction, and D is the "delta" amount encoding the transaction fees and similar quantities.
        // The explanation on how the "delta" is computed can be seen inside the function computeBalanceDelta.

        // Balance delta for tester in its first transaction. We pass the info of the only message sent during this transaction.
        const testerDelta1 = computeBalanceDelta(
            testerRequestTsx,
            testerOutMessageInfo,
        );
        // Balance delta for calculator (in its only transaction). We also pass the info of the only message sent during this transaction.
        const calculatorDelta = computeBalanceDelta(
            calculatorTsx,
            calculatorOutMessageInfo,
        );
        // Balance delta for tester in its second transaction
        // Since this transaction does not send messages, we pass no MessageInfo object
        const testerDelta2 =
            computeBalanceDeltaWithNoOutputMessage(testerBouncedTsx);

        // If we add all the deltas for tester, together with its initial balance, we should get its measured final balance
        const expectedTesterBalanceAfter =
            testerBalanceBefore + testerDelta1 + testerDelta2;
        expect(expectedTesterBalanceAfter.toString()).toBe(
            testerBalanceAfter.toString(),
        );
        // Similarly for the calculator
        const expectedCalculatorBalanceAfter =
            calculatorBalanceBefore + calculatorDelta;
        expect(expectedCalculatorBalanceAfter.toString()).toBe(
            calculatorBalanceAfter.toString(),
        );

        // Additionally, we should expect that the balance for the calculator did not change
        // because it payed its transaction fees from the value of the incoming message
        // and then sent the remaining value back to the tester.
        // Indeed, if we expand the terms of the delta for the calculator, we get:
        //     delta = inValue - totalFees - outMsg.value - outMsg.validatorsForwardFee
        //           = inValue - totalFees - (inValue - totalFees - BouncePhaseMessageForwardFees) - outMsg.validatorsForwardFee
        //           = BouncePhaseMessageForwardFees - outMsg.validatorsForwardFee
        //           = 0
        //
        // where the value of the bounced message "outMsg.value" was expanded according to the formula for bounced messages given previously
        // and BouncePhaseMessageForwardFees = outMsg.validatorsForwardFee as was also checked previously.

        // But again, since totalFees are subject to rounding, we should expect that the delta is 0 within a a small error

        // Check that the calculator delta is actually zero
        expect(computeErrorIntervalOfNumber(calculatorDelta)).toContain("0");

        // Finally, since the request failed and got bounced, the tester received the bounced message
        // and stored -2 ("error") in its "val" field.
        const finalValue = await tester.getCurrentResult();
        expect(finalValue.toString()).toBe("-2");
    });

    /* This test checks when the tester contract sends a request that causes an out of gas error during the calculator's computation phase, 
       due to the tester not including enough funds in the request.
       
       The summary of the test is as follows:
    
       1) The treasury will send a message to the tester, indicating the tester to start a 
          request to the calculator for computing the average of the interval [0,50]. 
          
       2) During the computation phase, the tester creates an AverageRequest message (SendDefaultMode with no flags), 
          including 0.005 TON in the "value" of the message. This amount is NOT enough to cover the
          calculator's transaction fees and message forward fees for the bounced message. 
          The tester sets its "val" contract field to -3 ("op requested, no answer yet").
          The computation phase for the tester contract succeeds. 
    
       3) The action phase for the tester contract successfully sends the request.
    
       4) The calculator receives the request and aborts its computation phase because computing the interval [0,50] 
          takes too much gas. 
       
       5) The calculator skips its action phase, but enters its bounce phase. 
          The calculator does NOT send a bounced message back to the tester, because there are not enough funds 
          left in the incoming request to pay for message forward fees (after the computation fees
          were deducted from the value in the incoming message).
        
       6) The tester remains with contract field "val" set to -3 ("op requested, no answer yet").

       Summary of transactions:
    
       T1) Triggered by message sent from treasury to tester. Sends request to calculator to compute 
           average of interval [0,50] with NOT enough funds to pay for the calculator's transaction fees.
        
       T2) Triggered by the message sent from tester to calculator. The transaction is aborted during the 
           computation phase (due to an out of gas error). No bounced message is sent back to the tester
           because there are no funds left in the incoming request.
    */
    it("should test error in the calculator's computation phase, but no funds to send the bounced message", async () => {
        // The amount the tester contract will pay in its request message to the calculator contract.
        // This is just an amount to cover the request forward fees, but not enough to pay for
        // calculator's transaction fees and the bounce message.
        const amountToPayInRequest = toNano("0.005");
        // In this test, the calculator will fail its computation phase and will be unable to send a bounce message
        // due to insufficient funds, so that it will never send a response
        // back to the tester. Hence, it will be irrelevant
        // the number in amountToPayInCalculatorResponse. We set it to zero.
        const amountToPayInCalculatorResponse = 0n;

        // Contract balances before all the transactions
        const testerBalanceBefore = (
            await blockchain.getContract(tester.address)
        ).balance;
        const calculatorBalanceBefore = (
            await blockchain.getContract(calculator.address)
        ).balance;

        // Treasury triggers the test by telling the tester to request the computation of the average of the interval [0,50].
        const { transactions } = await tester.send(
            treasure.getSender(),
            { value: toNano("10") },
            {
                $$type: "DoCalculatorRequest",
                from: 0n,
                to: 50n,
                amountToPayInRequest,
                amountToPayInCalculatorResponse,
            },
        );

        // Contract balances after all transactions
        const testerBalanceAfter = (
            await blockchain.getContract(tester.address)
        ).balance;
        const calculatorBalanceAfter = (
            await blockchain.getContract(calculator.address)
        ).balance;

        // Check that the transactions exist
        // Transaction T1 (see summary of transactions at the start of the test)
        // This transaction sends the request to the calculator.
        const testerRequestTsx = ensureTransactionIsDefined(
            findTransaction(transactions, {
                from: treasure.address,
                to: tester.address,
                success: true,
            }),
        );
        // Transaction T2
        // The calculator aborts the transaction during its computation phase (due to out of gas)
        // and attempts to send a bounce message back to the tester, but there will be not enough funds to do it.
        const calculatorTsx = ensureTransactionIsDefined(
            findTransaction(transactions, {
                from: tester.address,
                to: calculator.address,
                success: false,
            }),
        );
        // Check there is no transaction in the tester triggered by the calculator, i.e., the calculator could not send the bounce message.
        expect(
            findTransaction(transactions, {
                from: calculator.address,
                to: tester.address,
            }),
        ).toBeUndefined();

        // Check that the transactions occurred in the logical order
        // i.e., the tester request transaction executed before the calculator transaction
        expect(testerRequestTsx.lt < calculatorTsx.lt).toBe(true);

        // Check that the calculator transaction failed in its computation phase with exit code -14 ("Out of gas").
        const calculatorCompPhase = getComputationPhase(calculatorTsx);
        expect(calculatorCompPhase.success).toBe(false);
        expect(calculatorCompPhase.exitCode).toBe(-14);

        // Check that the calculator's action phase did not execute, but its bounce phase did,
        // with bounce phase type "no-funds"
        const calculatorTsxDescription =
            getTransactionDescription(calculatorTsx);
        expect(calculatorTsxDescription.actionPhase).toBeUndefined();
        expect(calculatorTsxDescription.bouncePhase).toBeDefined();
        expect(calculatorTsxDescription.bouncePhase?.type).toBe("no-funds");

        // Extract the only message sent by the tester to the calculator
        const testerOutMessage = ensureMessageIsDefined(
            testerRequestTsx.outMessages.get(0),
        );
        // Check that the calculator did not send messages
        expect(calculatorTsx.outMessagesCount).toBe(0);

        // Check that the value assigned to testerOutMessage is the original "value" in the send function
        // but deducted with the message forward fees
        const testerMessageForwardFee =
            extractTotalMessageForwardFee(testerRequestTsx);
        const testerOutMessageInfo = getMessageInfo(testerOutMessage);
        const expectedTesterOutMessageValue =
            amountToPayInRequest - testerMessageForwardFee;
        expect(expectedTesterOutMessageValue.toString()).toBe(
            testerOutMessageInfo.value.toString(),
        );

        // When there are enough funds in the incoming message to cover for transaction fees and bounced message forward fees,
        // we could use the following formula to estimate the value in the outbound message:
        //     outMessage.value = inValue - totalFees - BouncePhaseMessageForwardFees
        //
        // where inValue: is the value in the incoming message
        //       totalFees: is the total transaction fees
        //       BouncePhaseMessageForwardFees: is the message forward fees computed during the bounce phase
        //
        // However, in this test, the above formula becomes zero, because the total fees reach the incoming message value
        // during the computation phase (the amount BouncePhaseMessageForwardFees is not even computed, since
        // "inValue - totalFees" is already zero before entering the bounce phase).

        // As such, there are no remaining funds in the incoming message value to
        // send a bounced message.

        // Check that the amount "inValue - totalFees" is actually zero. But again, since totalFees is subject to rounding.
        // This amount will be 0 within a small error

        // Get the incoming message that triggered the calculator's transaction.
        const calculatorInMessage = ensureMessageIsDefined(
            calculatorTsx.inMessage,
        );
        const calculatorInMessageInfo = getMessageInfo(calculatorInMessage);
        // Check the amount to be zero within a small error
        const expectedRemainingAmount =
            calculatorInMessageInfo.value - calculatorTsx.totalFees.coins;
        expect(computeErrorIntervalOfNumber(expectedRemainingAmount)).toContain(
            "0",
        );

        // Now we check that the observed final balances in each contract can actually be obtained from their initial balances
        // by subtracting the transaction fees, crediting the initial message value, and subtracting the outbound message values.
        // In other words, we want to check that the relation C_B + D = C_A holds, where C_B is the contract balance BEFORE the transaction,
        // C_A is the contract balance AFTER the transaction, and D is the "delta" amount encoding the transaction fees and similar quantities.
        // The explanation on how the "delta" is computed can be seen inside the function computeBalanceDelta.

        // Balance delta for tester (in its only transaction). We pass the info of the only message sent during this transaction.
        const testerDelta = computeBalanceDelta(
            testerRequestTsx,
            testerOutMessageInfo,
        );
        // Balance delta for calculator (in its only transaction).
        // Calculator did not send a bounced message, so we do not pass a messageInfo object.
        const calculatorDelta =
            computeBalanceDeltaWithNoOutputMessage(calculatorTsx);

        // If we add the delta for tester, together with its initial balance, we should get its measured final balance
        const expectedTesterBalanceAfter = testerBalanceBefore + testerDelta;
        expect(expectedTesterBalanceAfter.toString()).toBe(
            testerBalanceAfter.toString(),
        );
        // Similarly for the calculator
        const expectedCalculatorBalanceAfter =
            calculatorBalanceBefore + calculatorDelta;
        expect(expectedCalculatorBalanceAfter.toString()).toBe(
            calculatorBalanceAfter.toString(),
        );

        // Additionally, we should expect that the balance for the calculator did not change
        // because it payed its transaction fees from the value of the incoming message,
        // which then depleted during the computation phase.
        // Indeed, if we expand the terms of the delta for the calculator, we get:
        //     delta = inValue - totalFees - outMsg.value - outMsg.validatorsForwardFee
        //           = inValue - totalFees - 0 - 0
        //           = 0
        //
        // where inValue - totalFees = 0 as we checked previously, and
        // outMsg.value = 0 and outMsg.validatorsForwardFee = 0 since there was no bounce message.

        // Check that the calculator delta is actually zero within a small error
        expect(computeErrorIntervalOfNumber(calculatorDelta)).toContain("0");

        // Finally, since the tester never receives the bounced message,
        // the tester remains with status -3 ("op requested, no answer yet") in its "val" field.
        const finalValue = await tester.getCurrentResult();
        expect(finalValue.toString()).toBe("-3");
    });

    /* This test checks when the tester contract sends a request that successfully passes the calculator's computation phase, 
       but fails during the calculator's action phase.
       
       The summary of the test is as follows:
    
       1) The treasury will send a message to the tester, indicating the tester to start a 
          request to the calculator for computing the average of the interval [0,4]. 
          
       2) During the computation phase, the tester creates an AverageRequest message (SendDefaultMode with no flags), 
          including 1 TON in the "value" of the message. This amount is enough to cover the
          calculator's transaction fees. 
          The tester sets its "val" contract field to -3 ("op requested, no answer yet").
          The computation phase for the tester contract succeeds. 
    
       3) The action phase for the tester contract successfully sends the request.
    
       4) The calculator receives the request and successfully computes the average of the interval [0,4].
          The calculator creates an AverageResponse message (SendDefaultMode with no flags),
          including 0 TON in the "value" of the message. This means that the calculator will fail its action
          phase because the response message does not have enough funds to pay message forward fees.

       5) The calculator enters its action phase and fails to send the response message back to the tester,
          since the response message does not have funds to pay for forward fees.
        
       6) The tester remains with contract field "val" set to -3 ("op requested, no answer yet").

       Summary of transactions:
    
       T1) Triggered by message sent from treasury to tester. Sends request to calculator to compute 
           average of interval [0,4] with enough funds to pay for the calculator's transaction fees.
        
       T2) Triggered by the message sent from tester to calculator. The transaction passes the computation 
           phase but fails its action phase because the calculator did not include enough funds to pay for forward
           fees in the response message. No response message is sent back to the tester.
    */
    it("should test a successful computation phase in calculator but failure in its action phase", async () => {
        // The amount the tester contract will pay in its request message to the calculator contract.
        // 1 TON will cover all transaction fees in the calculator.
        const amountToPayInRequest = toNano("1");
        // In this test, we force the calculator to not pay for the response message,
        // forcing a failure in its action phase because there is not enough TON to pay for message forward fees in the
        // response back to the tester. So, set the amount to 0.
        const amountToPayInCalculatorResponse = 0n;

        // Contract balances before all the transactions
        const testerBalanceBefore = (
            await blockchain.getContract(tester.address)
        ).balance;
        const calculatorBalanceBefore = (
            await blockchain.getContract(calculator.address)
        ).balance;

        // Treasury triggers the test by telling the tester to request the computation of the average of the interval [0,4].
        const { transactions } = await tester.send(
            treasure.getSender(),
            { value: toNano("10") },
            {
                $$type: "DoCalculatorRequest",
                from: 0n,
                to: 4n,
                amountToPayInRequest,
                amountToPayInCalculatorResponse,
            },
        );

        // Contract balances after all transactions
        const testerBalanceAfter = (
            await blockchain.getContract(tester.address)
        ).balance;
        const calculatorBalanceAfter = (
            await blockchain.getContract(calculator.address)
        ).balance;

        // Check that the transactions exist
        // Transaction T1 (see summary of transactions at the start of the test)
        // This transaction sends the request to the calculator.
        const testerRequestTsx = ensureTransactionIsDefined(
            findTransaction(transactions, {
                from: treasure.address,
                to: tester.address,
                success: true,
            }),
        );
        // Transaction T2
        // The calculator successfully executes the computation phase, but fails its action phase
        // because it did not pay for the message forward fees in the response message.
        // As a result, the tester receives neither a response message, nor a bounced message.
        const calculatorTsx = ensureTransactionIsDefined(
            findTransaction(transactions, {
                from: tester.address,
                to: calculator.address,
                success: false,
            }),
        );
        // Check there is no transaction in the tester triggered by the calculator,
        // i.e., the calculator sent neither a response message, nor a bounced message.
        expect(
            findTransaction(transactions, {
                from: calculator.address,
                to: tester.address,
            }),
        ).toBeUndefined();

        // Check that the transactions occurred in the logical order
        // i.e., the tester request transaction executed before the calculator transaction
        expect(testerRequestTsx.lt < calculatorTsx.lt).toBe(true);

        // Check that the calculator transaction successfully executes its computation phase
        const calculatorCompPhase = getComputationPhase(calculatorTsx);
        expect(calculatorCompPhase.success).toBe(true);

        // Check that the calculator's action phase failed with result code 40.
        const calculatorActionPhase = getActionPhase(calculatorTsx);
        expect(calculatorActionPhase.success).toBe(false);
        expect(calculatorActionPhase.resultCode).toBe(40);

        // Check that the calculator bounce phase did not execute
        const calculatorTsxDescription =
            getTransactionDescription(calculatorTsx);
        expect(calculatorTsxDescription.bouncePhase).toBeUndefined();

        // Extract the only message sent by the tester to the calculator
        const testerOutMessage = ensureMessageIsDefined(
            testerRequestTsx.outMessages.get(0),
        );
        // Check that the calculator did not send messages
        expect(calculatorTsx.outMessagesCount).toBe(0);

        // Check that the value assigned to testerOutMessage is the original "value" in the send function
        // but deducted with the message forward fees
        const testerMessageForwardFee =
            extractTotalMessageForwardFee(testerRequestTsx);
        const testerOutMessageInfo = getMessageInfo(testerOutMessage);
        const expectedTesterOutMessageValue =
            amountToPayInRequest - testerMessageForwardFee;
        expect(expectedTesterOutMessageValue.toString()).toBe(
            testerOutMessageInfo.value.toString(),
        );

        // Now we check that the observed final balances in each contract can actually be obtained from their initial balances
        // by subtracting the transaction fees, crediting the initial message value, and subtracting the outbound message values.
        // In other words, we want to check that the relation C_B + D = C_A holds, where C_B is the contract balance BEFORE the transaction,
        // C_A is the contract balance AFTER the transaction, and D is the "delta" amount encoding the transaction fees and similar quantities.
        // The explanation on how the "delta" is computed can be seen inside the function computeBalanceDelta.

        // Balance delta for tester (in its only transaction). We pass the info of the only message sent during this transaction.
        const testerDelta = computeBalanceDelta(
            testerRequestTsx,
            testerOutMessageInfo,
        );
        // Balance delta for calculator (in its only transaction).
        // Calculator did not send a response message, so we do not pass a messageInfo object.
        const calculatorDelta =
            computeBalanceDeltaWithNoOutputMessage(calculatorTsx);

        // If we add the delta for tester, together with its initial balance, we should get its measured final balance
        const expectedTesterBalanceAfter = testerBalanceBefore + testerDelta;
        expect(expectedTesterBalanceAfter.toString()).toBe(
            testerBalanceAfter.toString(),
        );
        // Similarly for the calculator
        const expectedCalculatorBalanceAfter =
            calculatorBalanceBefore + calculatorDelta;
        expect(expectedCalculatorBalanceAfter.toString()).toBe(
            calculatorBalanceAfter.toString(),
        );

        // Check that the calculator's delta is positive, meaning that the calculator's balance increased after the transaction,
        // since it never sends back to the tester the remaining funds.
        expect(calculatorDelta > 0n).toBe(true);

        // Finally, since the tester never receives the response message or a bounced message,
        // the tester remains with status -3 ("op requested, no answer yet") in its "val" field.
        const finalValue = await tester.getCurrentResult();
        expect(finalValue.toString()).toBe("-3");
    });
});

function computeBalanceDeltaWithNoOutputMessage(
    tsx: BlockchainTransaction,
): bigint {
    // When computing a delta, sending no message is equivalent to passing an empty messageInfo object.
    return computeBalanceDelta(tsx, {
        validatorsForwardFee: 0n,
        value: 0n,
        bounced: false,
    });
}

function computeBalanceDelta(
    tsx: BlockchainTransaction,
    outMsgInfo: MessageInfo,
): bigint {
    if (tsx.inMessage?.info.type === "internal") {
        /* For transactions initiated by an internal message, the delta consists on the following formula:

               delta = inValue - totalFees - outMsgInfo.value - outMsgInfo.validatorsForwardFee
           
           where inValue = value in the incoming message
                 
                 totalFees = total transaction fees  (i.e., storage fees + import external message fees + 
             computation fees + action fees + outbound external message fees)
             see https://docs.ton.org/v3/documentation/smart-contracts/transaction-fees/fees#basic-fees-formula
                 
                 outMsgInfo.value = value in the outbound message

                 outMsgInfo.validatorsForwardFee = validator's forward fee in the outbound message
                 
           The rationale for the formula is as follows:
               
            1) The value of the incoming message is added to the contract's balance. This explains the positive sign in inValue.
            2) All transaction fees are subtracted from the contract's balance. This explains the negative sign in totalFees.
            3) For the outbound message, we need to remove from the contract's balance the amount set in the send function.
               However, we need to be careful. Why? Recall the diagram of how the amount payed by the contract in the send function
               is split into "final value", message forward fees (msg_fwd_fee), forward fees for validators (fwd_fee), and action fees:
 
               ----Total amount payed by contract in the send function-------
               |                                                            |
               v                                                            v
               |------------------------------|--------------|--------------|
                           final value        /\  fwd_fee       action fee  /\
                                               |                             |
                                               ---------msg_fwd_fee----------- 
            
                Note that in the formula for the totalFees, the action fees already occur as a term. Therefore, if we subtract 
                the total amount payed by the contract in the send function, we would be subtracting the action fees TWICE.
                Hence, we should only subtract the "final value" (contained in outMsgInfo.value)
                and the forward fees for validators (contained in outMsgInfo.validatorsForwardFee).
            
           WARNING: According to TON Documentation https://docs.ton.org/v3/documentation/smart-contracts/transaction-fees/fees-low-level#ihr, 
           there is an extra IHR Fee in internal messages that should be set to 0 because IHR is yet not implemented. 
           In these tests, I am assuming that IHR fee is zero; hence, I am adding assertions that IHR fee is zero.
        */
        expect(tsx.inMessage.info.ihrDisabled).toBe(true);
        expect(tsx.inMessage.info.ihrFee.toString()).toBe("0");

        const inValue = tsx.inMessage.info.value.coins;
        const totalFees = tsx.totalFees.coins;
        const delta =
            inValue -
            totalFees -
            outMsgInfo.value -
            outMsgInfo.validatorsForwardFee;
        return delta;
    }

    throw new Error("Unsupported message type.");
}

function getMessageInfo(msg: Message): MessageInfo {
    if (msg.info.type === "internal") {
        /* WARNING: According to TON Documentation https://docs.ton.org/v3/documentation/smart-contracts/transaction-fees/fees-low-level#ihr, 
           there is an extra IHR Fee in internal messages that should be set to 0 because IHR is yet not implemented. 
           In these tests, I am assuming that IHR fee is zero; hence, I am adding assertions that IHR fee is zero.
        */
        expect(msg.info.ihrDisabled).toBe(true);
        expect(msg.info.ihrFee.toString()).toBe("0");

        return {
            validatorsForwardFee: msg.info.forwardFee,
            value: msg.info.value.coins,
            bounced: msg.info.bounced,
        };
    }

    throw new Error("Unsupported message type.");
}

function ensureTransactionIsDefined(
    tsx: BlockchainTransaction | undefined,
): BlockchainTransaction {
    if (typeof tsx === "undefined") {
        throw new Error("Transaction is expected to exist.");
    } else {
        return tsx;
    }
}

function ensureMessageIsDefined(msg: Maybe<Message>): Message {
    if (msg) {
        return msg;
    }
    throw new Error("Message was expected to be defined");
}

function extractTotalMessageForwardFee(tsx: BlockchainTransaction): bigint {
    if (tsx.description.type === "generic") {
        return tsx.description.actionPhase?.totalFwdFees ?? 0n;
    }

    throw new Error("Unrecognized transaction type");
}

function extractTotalBouncedMessageForwardFee(
    tsx: BlockchainTransaction,
): bigint {
    if (tsx.description.type === "generic") {
        if (tsx.description.bouncePhase?.type === "ok") {
            return tsx.description.bouncePhase.forwardFees;
        } else {
            throw new Error("Expected bounce phase to execute without errors");
        }
    }

    throw new Error("Unrecognized transaction type");
}

function getComputationPhase(tsx: BlockchainTransaction): TransactionComputeVm {
    if (tsx.description.type === "generic") {
        const compPhase = tsx.description.computePhase;
        if (compPhase.type === "vm") {
            return compPhase;
        } else {
            throw new Error(
                "Computation phase was expected to execute (i.e. not skipped)",
            );
        }
    }

    throw new Error("Unrecognized transaction type");
}

function getActionPhase(tsx: BlockchainTransaction): TransactionActionPhase {
    if (tsx.description.type === "generic") {
        if (tsx.description.actionPhase) {
            return tsx.description.actionPhase;
        } else {
            throw new Error("Action phase was expected to exist");
        }
    }

    throw new Error("Unrecognized transaction type");
}

function getTransactionDescription(
    tsx: BlockchainTransaction,
): TransactionDescriptionGeneric {
    if (tsx.description.type === "generic") {
        return tsx.description;
    }

    throw new Error("Unrecognized transaction type");
}

function computeErrorIntervalOfNumber(num: bigint): string[] {
    const interval = [num - 1n, num, num + 1n];
    return interval.map((n) => n.toString());
}
