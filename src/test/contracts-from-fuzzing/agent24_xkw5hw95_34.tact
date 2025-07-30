// Comprehensive Fuzz-Testing Summary for Bounced Messages and Bounce Receivers in Tact Contracts

/*
Bounce Receiver Fuzz-Testing Summary
-------------------------------------

Our comprehensive fuzz-testing cycle for bounced messages and bounce receivers in Tact contracts has confirmed that the Tact compiler behaves exactly as documented. Below is a summary of our key findings:

1. Documentation Alignment:
   • According to the official Tact documentation (see docs_book_bounced.md citeturn0file0), when a message is sent with the bounce flag (bounce: true) and it fails, it is bounced back to the sender. Contracts must handle such bounced messages via a dedicated bounce receiver.
   • The documentation outlines two valid ways to declare a bounce receiver:
       - A typed bounce receiver, e.g.:
             bounced(msg: bounced<T>) { … }
       - A raw bounce receiver that accepts a Slice, e.g.:
             bounced(rawMsg: Slice) { … }
   • It is explicitly required that a bounce receiver must declare exactly one parameter of the appropriate type. Any duplicate declarations or incorrect parameter definitions are rejected at compile time (see also docs_book_contracts.md citeturn0file9).

2. Fuzz-Testing Results:
   • Valid bounce receiver definitions compiled successfully:
         - The ValidBounceTyped contract using a typed bounce receiver (bounced(msg: bounced<BounceMsg>)) compiled without issues, confirming that type-safe bounced message handling works as intended.
         - The ValidBounceRaw contract using a raw bounce receiver (bounced(rawMsg: Slice)) also compiled successfully.
   • The compiler correctly issued compile-time errors when invalid bounce receiver definitions were attempted (such as duplicate receivers, missing required parameters, or using an invalid parameter type).
   • A multi-contract bounce scenario was implemented:
         - The ReceiverChain contract was programmed to always fail (using require(false, …)) so that any sent message would bounce.
         - The CallerChain contract sent a message with bounce enabled, and its bounce receiver captured the bounced message (by setting a state flag, chainBounced). This confirms that bounced messages propagate correctly between contracts.
   • Additionally, using underscore notation to denote an unused bounce receiver parameter (e.g. bounced(_msg: bounced<BounceMsg>)) was handled properly by the compiler.

3. Conclusion:
   • Our tests confirmed that the Tact compiler strictly enforces the rules for bounce receiver declarations, exactly as specified in the official documentation. Valid definitions compile and function correctly, while any deviations yield appropriate compile-time errors.
   • The multi-contract bounce scenario demonstrates that bounced messages are routed back to the sender as expected.
   • Overall, our fuzz-testing found no discrepancies or unexpected behaviors; the bounce receiver functionality is robust and perfectly aligned with documentation.

References:
   - Bounced messages: docs_book_bounced.md citeturn0file0
   - Contract receiver functions: docs_book_contracts.md citeturn0file9

End of Fuzz-Testing Cycle.
*/