// Final Answer Summary for Bounced Messages and Bounce Receiver Fuzz-Testing in Tact

/*
Overview:

Our comprehensive fuzz-testing cycle focused on bounced messages and bounce receiver functionality in Tact contracts. We designed a variety of tests that rigorously covered standard usage scenarios, intricate edge cases, and multi-contract recursive bouncing to ensure that the actual compiler behavior aligns completely with the official Tact documentation.

Key Findings:

1. Valid Bounce Receiver Patterns:
   • Bounce receivers defined using the correct syntax (e.g., using the wrapper type: bounced(msg: bounced<PingMsg>)) compile successfully. This confirms that the compiler enforces the requirement that bounced messages be wrapped in a specific type constructor as documented in the bounced messages guide (see docs_book_bounced.md  ).
   • Fallback bounce receivers which accept a raw Slice parameter (i.e., bounced(rawMsg: Slice)) also compile, serving as a generic handler for all bounced messages. This behavior is consistent with the intended design described in the receiver functions documentation (see docs_book_contracts.md  ).

2. Invalid Bounce Receiver Declarations:
   • When a bounce receiver is declared without the required bounced<T> wrapper (for example, using a plain message type), the compiler reliably issues a compile-time error. This strictly enforces the documented contract, ensuring that message types exceeding the 224-bit data limit are properly wrapped—a behavior that was verified during our testing.
   • Attempts to access non-existent fields in the bounced message (for instance, referencing msg.x when only msg.value is defined) trigger a compile-time error as expected, validating strict type-safety rules.
   • Attempts to declare a bounced receiver using an unsupported type (such as a text message with bounced<string>) are rejected by the compiler. This is in full agreement with the documentation remark that bounced text messages are not supported (see docs_book_bounced.md  ).

3. Multi-Contract and Recursive Bouncing Scenarios:
   • We simulated a scenario in which one contract (BounceChainA) sends a bounce-enabled message to a target contract (BounceChainB) that intentionally lacks a receiver function. As specified in the documentation, the message bounces back to BounceChainA, whose bounce receiver then processes it (e.g., by incrementing a counter). This robust test confirms that the bouncing mechanism operates as documented, ensuring reliable message bouncing and handling (see docs_book_bounced.md   and docs_book_contracts.md  ).

Conclusion:

Our rigorous fuzz-testing confirms that:
   - Valid bounce receiver implementations (both specifically typed using bounced<T> and fallback receivers using Slice) compile and operate exactly as described in the official documentation.
   - Incorrect or unsupported declarations produce the appropriate compile-time errors, thereby enforcing language type-safety and payload size limitations.
   - Multi-contract recursive bouncing behavior functions as expected.

In summary, the Tact compiler’s behavior with regard to bounced messages and bounce receivers is fully consistent with the official specification. No discrepancies or bugs were uncovered during our testing cycle.

End of Fuzz-Testing Summary.
*/