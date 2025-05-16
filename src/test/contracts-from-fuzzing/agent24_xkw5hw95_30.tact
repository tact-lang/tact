// Final Answer: Bounce Receiver Fuzz-Testing Summary

/*
Bounce Receiver Fuzz-Testing Summary
-------------------------------------

Our comprehensive fuzz-testing cycle for bounced messages and bounce receivers in Tact contracts has extensively validated that the Tact compiler behaves exactly in line with the official documentation. Here we summarize the main findings:

1. Documentation Consistency:
   • The official Tact documentation (see docs_book_bounced.md citeturn0file0) states that when a contract sends a message with the bounce flag set to true and the message fails, it bounces back to the sender. To handle such messages, a contract must implement a bounce receiver.
   • The documentation specifies two valid methods to declare a bounce receiver:
       - A typed bounce receiver, e.g.:
             bounced(msg: bounced<T>) { … }
       - A raw bounce receiver that accepts a Slice, e.g.:
             bounced(rawMsg: Slice) { … }
   • Moreover, it is required that a bounce receiver declares exactly one parameter of the proper type (either bounced<T> or Slice); any duplicate definitions or invalid parameter types must be rejected (see also docs_book_contracts.md citeturn0file9).

2. Fuzz-Testing Insights:
   • Contracts with a valid typed bounce receiver (for instance, ValidBounceTyped using bounced(msg: bounced<BounceMsg>)) compile successfully, confirming type-safe handling of bounced messages.
   • Contracts with a valid raw bounce receiver (ValidBounceRaw using bounced(rawMsg: Slice)) also compile properly.
   • Error conditions (such as defining multiple bounce receivers in a single contract, omitting the parameter, or using an incorrect type) were correctly flagged by the compiler, ensuring robust enforcement of the documented rules.
   • In a multi-contract bounce scenario, a CallerChain contract sends a message with bounce enabled to a ReceiverChain contract that deliberately fails (using require(false, …)). The CallerChain bounce receiver then captures the bounced message (evidenced by a state update), demonstrating that bounced messages propagate as expected.
   • Additionally, using an underscore prefix to denote an unused bounce receiver parameter (e.g., bounced(_msg: bounced<BounceMsg>)) is accepted by the compiler.

3. Conclusion:
   • The Tact compiler enforces bounce receiver definitions exactly as described in the official documentation. Valid definitions compile and work correctly, while erroneous definitions are reliably caught with appropriate error messages.
   • Multi-contract interactions involving bounced messages behave as intended, ensuring that bounced messages are effectively routed back to the sender.

Result:

Our tests have found no discrepancies between the documented behavior and the actual compiler behavior. Bounce receiver functionality in Tact is robust, and it operates exactly as specified.

End of Fuzz-Testing Cycle.
*/