// Comprehensive Fuzz-Testing Summary for Bounced Messages and Bounce Receivers in Tact Contracts

/*
Bounce Receiver Fuzz-Testing Summary
-------------------------------------

Our comprehensive fuzz-testing cycle for bounced messages and bounce receivers in Tact contracts has confirmed that the implementation aligns exactly with the official documentation. Here are the key findings from our tests:

1. Documentation Alignment:
   • According to the Tact documentation (see docs_book_bounced.md citeturn0file0) and the contracts section (docs_book_contracts.md citeturn0file9), when a message is sent with the bounce flag (bounce: true) and its execution fails, it is bounced back to the sender. To handle this, a contract must implement a bounce receiver.
   • Valid bounce receiver declarations can be defined in one of two ways:
         - A typed bounce receiver: e.g.,
             bounced(msg: bounced<T>) { … }
         - A raw bounce receiver: e.g.,
             bounced(rawMsg: Slice) { … }
   • It is mandatory that the bounce receiver declares exactly one parameter; duplicate or improperly defined receivers are rejected at compile time.

2. Fuzz-Testing Results:
   • Valid Implementations:
         - A contract with a typed bounce receiver (ValidBounceTyped using bounced(msg: bounced<BounceMsg>)) compiled successfully, confirming that type-safe bounced message handling is supported.
         - A contract with a raw bounce receiver (ValidBounceRaw using bounced(rawMsg: Slice)) also compiled without issues.
   • The compiler correctly flagged and rejected erroneous bounce receiver definitions (such as duplicate receivers, missing parameters, or invalid parameter types), ensuring robust enforcement of language rules.
   • A multi-contract scenario was successfully tested: a CallerChain contract sends a message (with bounce enabled) to a ReceiverChain contract that intentionally fails (using require(false, ...)). The bounce receiver in CallerChain captures the bounced message (state flag chainBounced updated accordingly), confirming that bounced messages correctly propagate between contracts.
   • Additionally, using an underscore to denote an unused bounce receiver parameter (e.g., bounced(_msg: bounced<BounceMsg>)) was handled as expected.

3. Conclusion:
   • Our tests confirm that the Tact compiler enforces bounce receiver declarations precisely as documented. Valid definitions compile and function correctly, while any invalid definitions are reliably caught with appropriate compile-time errors.
   • Multi-contract interactions involving bounced messages behave as documented.
   • No discrepancies or unexpected behaviors were observed; the bounce receiver functionality is robust and compliant with official specifications.

References:
   - Bounced messages documentation: docs_book_bounced.md citeturn0file0
   - Contract receiver functions: docs_book_contracts.md citeturn0file9

End of Fuzz-Testing Cycle.
*/