// Final Answer Summary for Bounced Message and Bounce Receiver Fuzz-Testing in Tact

/*
Final Summary:

Our extensive fuzz-testing cycle specifically focused on bounced messages and bounce receiver functionality in Tact contracts demonstrates full consistency between the Tact compiler behavior and the official documentation.

Key observations are as follows:

1. Valid Bounce Receiver Patterns:
   - Bounce receivers properly declared with the syntax bounced(msg: bounced<PingMsg>) compile and behave as expected. This confirms that the compiler enforces the requirement that messages be wrapped in the type constructor (as described in the bounced messages docs, e.g. in docs_book_bounced.md  ).
   - A fallback receiver using a raw Slice (bounced(rawMsg: Slice)) also compiles, serving as a catch-all for untyped bounced messages, which is in line with the documented design (see docs_book_contracts.md  ).

2. Invalid Bounce Receiver Declarations:
   - Attempts to declare a bounce receiver parameter without the necessary bounced<T> wrapper trigger a compile-time error. This confirms that the language enforces the correct message wrapping,
   - Moreover, attempts to access non-existent fields (such as referencing msg.x when the only field is value) produce the expected type errors, upholding type-safety restrictions.
   - Additionally, declarations using unsupported types (like bounced<string>, since bounced text messages are not supported) correctly result in syntax and type errors.

3. Multi-Contract and Recursive Bouncing Scenarios:
   - In a simulated multi-contract scenario, a sender contract (BounceChainA) sends a bounce-enabled message to a target contract (BounceChainB) which purposefully lacks a receiver. As designed, the message bounces back to BounceChainA where its bounce receiver increments a counter. This recursive bouncing behavior confirms that the bounce mechanism adheres to the documented behavior in TON (as described in docs_book_bounced.md   and overall contract handling in docs_book_contracts.md  ).

Conclusion:

Our comprehensive testing indicates that:
   • Valid bounce receiver implementations, both typed and fallback, compile and function exactly as documented.
   • Erroneous declarations (missing the bounced<T> wrapper, referencing improper fields, or using unsupported text types) trigger compile-time errors, as expected.
   • Multi-contract recursive bouncing works as intended, with unhandled messages bouncing correctly.

No discrepancies between the documentation and the compiler's behavior were found. The Tact compiler correctly enforces all documented constraints regarding bounced messages and bounce receivers.

End of fuzz-testing summary.
*/