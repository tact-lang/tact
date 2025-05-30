// Comprehensive Fuzz-Testing Summary for Bounced Messages and Bounce Receivers in Tact Contracts

/*
Bounce Receiver Fuzz-Testing Summary
-------------------------------------

Our exhaustive fuzz-testing cycle for bounced messages and bounce receivers in Tact contracts confirms that the Tact compiler's behavior is fully compliant with the official documentation. Here are the key findings:

1. Documentation Alignment:
   • According to the official Tact documentation (see docs_book_bounced.md citeturn0file0) and the contract receiver guidelines (docs_book_contracts.md citeturn0file9), when a message is sent with the bounce flag (bounce: true) and its execution fails, it bounces back to the sender.
   • To handle bounced messages, a contract must implement a bounce receiver, which can be declared in one of these two valid ways:
         - A typed bounce receiver, for example:
               bounced(msg: bounced<T>) { … }
         - A raw bounce receiver that accepts a Slice, for example:
               bounced(rawMsg: Slice) { … }
   • The documentation mandates that exactly one parameter be declared in a bounce receiver; duplicate or malformed declarations must be rejected.

2. Fuzz-Testing Results:
   • Valid Definitions:
         - Contracts with a typed bounce receiver (e.g., ValidBounceTyped using bounced(msg: bounced<BounceMsg>)) compile successfully, confirming support for type-safe bounced message handling.
         - Contracts with a raw bounce receiver (e.g., ValidBounceRaw using bounced(rawMsg: Slice)) also compile without issues.
   • Error Conditions:
         - The compiler correctly rejects any attempts to define duplicate bounce receivers, omit the required parameter, or use an invalid parameter type.
   • Multi-Contract Bounce Scenario:
         - In our test, a CallerChain contract sent a message with bounce enabled to a ReceiverChain contract that intentionally failed (via require(false, ...)). The CallerChain’s bounce receiver captured the bounced message (evidenced by a state flag update), confirming that bounced messages propagate correctly between contracts.
   • Additional Conventions:
         - Underscore notation for unused bounce receiver parameters (e.g., bounced(_msg: bounced<BounceMsg>)) is accepted by the compiler.

3. Conclusion:
   • Our extensive testing confirms that bounce receiver functionality in Tact is robust and works exactly as documented. The Tact compiler enforces the requirement that a bounce receiver must have exactly one parameter of type bounced<T> or Slice, and all valid implementations compile and behave properly. Attempts at invalid definitions yield clear compile-time errors.
   • Multi-contract interactions behave as expected, with bounced messages correctly routed back to the sender.

Result:
   - No discrepancies, bugs, or unexpected behaviors were identified during our fuzz-testing cycle. Bounce receiver handling in Tact is implemented exactly as specified in the documentation.

End of Fuzz-Testing Cycle.
*/