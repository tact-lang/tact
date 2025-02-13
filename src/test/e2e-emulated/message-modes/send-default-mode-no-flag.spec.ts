import { MessageModeTester } from "../contracts/output/message-mode-tester_MessageModeTester";
import { Calculator } from "../contracts/output/message-mode-tester_Calculator";
import {
    Blockchain,
    BlockchainTransaction,
    SandboxContract,
    TreasuryContract,
} from "@ton/sandbox";
import { Message, toNano } from "@ton/core";
import { findTransaction } from "@ton/test-utils";

type OutMessageInfo = { validatorsForwardFee: bigint; value: bigint };

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
        expect(
            amountToPayInRequest - testerMessageForwardFee ===
                testerOutMessageInfo.value,
        ).toBe(true);

        // Check that the value assigned to calculatorOutMessage is the original "value" in the send function
        // but deducted with the message forward fees.
        const calculatorMessageForwardFee =
            extractTotalMessageForwardFee(calculatorTsx);
        const calculatorOutMessageInfo = getMessageInfo(calculatorOutMessage);
        expect(
            amountToPayInCalculatorResponse - calculatorMessageForwardFee ===
                calculatorOutMessageInfo.value,
        ).toBe(true);

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
        // Since this transaction does not send messages, we pass an empty OutMessageInfo object
        const testerDelta2 = computeBalanceDelta(testerResultTsx, {
            validatorsForwardFee: 0n,
            value: 0n,
        });

        // If we add all the deltas for tester, together with its initial balance, we should get its measured final balance
        expect(
            testerBalanceBefore + testerDelta1 + testerDelta2 ===
                testerBalanceAfter,
        ).toBe(true);
        // Similarly for the calculator
        expect(
            calculatorBalanceBefore + calculatorDelta ===
                calculatorBalanceAfter,
        ).toBe(true);

        // Finally, since the average of [0,4] is 2, we should have that value in the tester
        const finalValue = await tester.getCurrentResult();
        expect(finalValue === 2n).toBe(true);
    });

    it("should test for errors in computation phase", async () => {
        // TODO: Send invalid interval to calculator
    });

    it("should test for errors in action phase", async () => {
        // TODO: Send insufficient funds in message.
    });
});

function computeBalanceDelta(
    tsx: BlockchainTransaction,
    outMsgInfo: OutMessageInfo,
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
        expect(tsx.inMessage.info.ihrFee === 0n).toBe(true);

        const inValue = tsx.inMessage.info.value.coins;
        const totalFees = tsx.totalFees.coins;
        const delta =
            inValue -
            totalFees -
            outMsgInfo.value -
            outMsgInfo.validatorsForwardFee;
        return delta;
    }

    throw new Error("Unsupported inbound message type.");
}

function getMessageInfo(msg: Message): OutMessageInfo {
    if (msg.info.type === "internal") {
        /* WARNING: According to TON Documentation https://docs.ton.org/v3/documentation/smart-contracts/transaction-fees/fees-low-level#ihr, 
           there is an extra IHR Fee in internal messages that should be set to 0 because IHR is yet not implemented. 
           In these tests, I am assuming that IHR fee is zero; hence, I am adding assertions that IHR fee is zero.
        */
        expect(msg.info.ihrDisabled).toBe(true);
        expect(msg.info.ihrFee === 0n).toBe(true);

        return {
            validatorsForwardFee: msg.info.forwardFee,
            value: msg.info.value.coins,
        };
    }

    throw new Error("Unsupported outbound message type.");
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

function ensureMessageIsDefined(msg: Message | undefined): Message {
    if (typeof msg === "undefined") {
        throw new Error("Message was expected to be defined");
    }
    return msg;
}

function extractTotalMessageForwardFee(tsx: BlockchainTransaction): bigint {
    if (tsx.description.type === "generic") {
        return tsx.description.actionPhase?.totalFwdFees ?? 0n;
    }

    throw new Error("Unrecognized transaction type");
}
