// Comprehensive Fuzz-Testing Summary for Bounced Messages and Bounce Receivers in Tact Contracts

/*
Overview:
----------
We conducted an extensive fuzz-testing cycle for bounced messages and bounce receivers in Tact contracts. Our goal was to validate that the implementation strictly adheres to the official documentation and to explore non-obvious edge cases and potential pitfalls.

Documentation Insights:
-----------------------
According to the official documentation (see docs_book_bounced.md citeturn0file0 and docs_book_contracts.md citeturn0file9), when a message is sent with the bounce flag (bounce: true) and it fails processing, the message is bounced back to the sender. To handle these, a contract must implement a bounce receiver that is declared in one of two ways:
  • A typed bounce receiver: for example, 
       bounced(msg: bounced<T>) { … }
  • A raw bounce receiver using a Slice parameter: 
       bounced(rawMsg: Slice) { … }

Importantly, the documentation enforces that a bounce receiver must declare exactly one parameter; duplicate or malformed declarations must be rejected at compile time.

Testing Summary:
----------------
1. Valid Bounce Receivers:
   • We confirmed that contracts with a valid typed bounce receiver (e.g. ValidBounceTyped, which uses bounced(msg: bounced<BounceMsg>)) compile successfully. This is in full compliance with the guidelines from the bounced messages documentation.
   • Similarly, a contract implementing a raw bounce receiver (ValidBounceRaw, using bounced(rawMsg: Slice)) compiled without error.

2. Error Conditions:
   • We attempted to define multiple bounce receivers or receivers with missing/wrong parameter types in a single contract. In every such case, the compiler correctly issued clear errors, enforcing that only a single properly formed bounce receiver is allowed.

3. Multi-Contract Bounce Scenario:
   • In a chain bounce test, a CallerChain contract sends a message with bounce enabled to a ReceiverChain contract that is deliberately set up to fail. The bounced message is captured by CallerChain’s bounce receiver, which updates a state variable (chainBounced). This confirms that bounced messages propagate correctly between contracts as expected.

4. Additional Conventions:
   • We verified that using an underscore (e.g., bounced(_msg: bounced<BounceMsg>)) is accepted when the bounce message parameter is not needed. This aligns with common Tact conventions for unused parameters.

Conclusion:
-----------
Our fuzz-testing confirms that the Tact compiler’s handling of bounced messages and bounce receivers is robust and fully in line with official documentation. Valid bounce receiver definitions (both typed and raw) compile as expected, while any deviation – such as duplicate receivers, missing parameters, or wrong parameter types – is caught during compilation. The multi-contract bounce testing further confirms that bounce propagation functions correctly. 

Thus, no discrepancies or deviations were identified; the bounce message functionality operates exactly as documented.

*/