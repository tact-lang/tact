// Final Summary Answer for Bounced Messages and Bounce Receiver Fuzz-Testing in Tact

/*
Overview:

Our comprehensive fuzz-testing cycle examined bounced messages and bounce receiver functionality in Tact contracts. We designed tests to validate both typical scenarios and nuanced edge cases, thereby checking for adherence to the documented behavior.

Key Findings:

1. Valid Bounce Receiver Patterns:
   • Bounce receivers declared using the proper syntax—by wrapping the message parameter with the type constructor (e.g., bounced(msg: bounced<PingMsg>))—compiled successfully. This confirms that the compiler enforces the requirement to use a bounced<T> wrapper, consistent with the specifications outlined in the bounced messages documentation (see docs_book_bounced.md  ).
   • Fallback bounce receivers using a raw Slice parameter (i.e., bounced(rawMsg: Slice)) also compile and serve as a generic catch-all for any bounced messages. This matches the guidance provided in the receiver functions section of the contracts documentation (see docs_book_contracts.md   and  ).

2. Invalid Bounce Receiver Declarations:
   • When a bounce receiver parameter is declared without the required bounced<T> wrapper (for example, simply using a plain message type), the compiler produces a compile-time error that explicitly insists on wrapping the message type. This behavior upholds the documented constraints (as evident in our test where an unwrapped type triggered an error in compliance with the limit on bounced message size).
   • Attempts to access a non-existent field within a bounced message (e.g., referencing msg.x when only msg.value is defined) reliably produce type errors. This enforces strict type safety as expected from the language (demonstrated in our BounceStateTestError scenario).
   • Additionally, declarations that attempt to use unsupported types—such as a bounced text message (for example, bounced(msg: bounced<string>))—are rejected by the compiler. This confirms the documentation’s note that bounced text messages are not yet supported (see docs_book_bounced.md  ).

3. Multi-Contract and Recursive Bouncing Scenarios:
   • We created a multi-contract scenario in which one contract (BounceChainA) sends a bounce-enabled message to a second contract (BounceChainB) that intentionally lacks a receiver function. As expected, the message bounces back to BounceChainA, where its bounce receiver processes the bounced message (for example, by incrementing a counter). This recursive bouncing behavior aligns perfectly with the documented message bouncing mechanism (see docs_book_bounced.md   and docs_book_contracts.md  ).

Conclusion:

Our tests confirm that the Tact compiler enforces the documented semantics for bounced messages and bounce receivers:
   - Valid bounce receiver implementations compile and operate correctly.
   - Incorrect declarations (omitting the bounced<T> wrapper, referencing invalid fields, or using unsupported message types) trigger the appropriate compile errors.
   - Recursive bouncing across contracts works as described when a message is not properly handled by the recipient.

In summary, the Tact compiler’s behavior regarding bounced messages is in full agreement with the official documentation (see documentation in docs_book_bounced.md and docs_book_contracts.md). No discrepancies or bugs were detected throughout our rigorous investigation.

End of Fuzz-Testing Summary.
*/