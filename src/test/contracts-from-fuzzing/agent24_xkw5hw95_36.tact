// Comprehensive Fuzz-Testing Summary for Bounced Messages and Bounce Receivers in Tact Contracts

/*
Bounce Receiver Fuzz-Testing Summary
-------------------------------------

Our extensive fuzz-testing cycle for bounced messages and bounce receivers in Tact contracts has confirmed that the compiler enforces the behavior exactly as described in the official documentation.

Documentation Review:
-----------------------
• As specified in docs_book_bounced.md citeturn0file0, when a message is sent with the bounce flag (bounce: true) and fails execution, the message is bounced back to the sender.
• The contracts documentation (docs_book_contracts.md citeturn0file9) details that bounced messages are handled by a dedicated bounce receiver, which must be defined using one of two syntaxes:
    – A typed bounce receiver, for example:
          bounced(msg: bounced<T>) { … }
    – A raw bounce receiver that accepts a Slice, for example:
          bounced(rawMsg: Slice) { … }
• It is mandated that the bounce receiver must declare exactly one parameter of the proper type. Any duplicate definitions or deviations (such as missing parameters or using an incorrect type) will be rejected at compile time.

Fuzz-Testing Results:
----------------------
• Valid Definitions: 
    – A contract using a typed bounce receiver (ValidBounceTyped using bounced(msg: bounced<BounceMsg>)) compiled successfully, confirming that type-safe handling of bounced messages works as expected.
    – Also, a contract using a raw bounce receiver (ValidBounceRaw using bounced(rawMsg: Slice)) compiled without any issues.
• Error Conditions: 
    – Attempts to define duplicate bounce receivers, omit the required parameter, or use an invalid parameter type resulted in clear compile-time errors, in accordance with the documented constraints.
• Multi-Contract Bounce Scenario:
    – A CallerChain contract sent a message with bounce enabled to a ReceiverChain contract designed to fail (using require(false, ...)). The CallerChain’s bounce receiver then captured the bounced message (as evidenced by a state flag update), demonstrating that bounced messages are correctly propagated between contracts.
• Additional Convention: 
    – Using underscore notation for an unused bounce receiver parameter (e.g., bounced(_msg: bounced<BounceMsg>)) is supported and handled properly by the compiler.

Conclusion:
-----------
All tests confirm that the bounce receiver functionality in Tact is robust and behaves exactly as specified. The compiler enforces that bounce receivers must have exactly one parameter (of type bounced<T> or Slice), and it correctly rejects any erroneous definitions. Multi-contract interactions involving bounced messages work as documented. Thus, our comprehensive fuzz-testing cycle reveals no discrepancies between the documented behavior and the compiler implementation.

End of Fuzz-Testing Cycle.
*/