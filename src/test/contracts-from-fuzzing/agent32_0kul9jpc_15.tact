// Final Summary of Fuzz-Testing for Bounced Messages and Bounce Receivers in Tact

/*
Overview:

Our fuzz-testing cycle focused on the bounced messages and bounce receiver functionality in Tact contracts has been comprehensive and targeted both valid usages and erroneous edge cases as documented.

Areas Tested:

1. Valid Bounce Receiver Patterns:
   • Bounce receivers defined using the required syntax (e.g., 'bounced(msg: bounced<PingMsg>) { ... }') compile successfully, which confirms that contracts handle bounced messages when their type is correctly wrapped. This behavior matches what is outlined in the Tact documentation on bounced messages (see   and  ).
   • Additionally, a fallback bounce receiver leveraging a raw Slice parameter (i.e., 'bounced(rawMsg: Slice) { ... }') was confirmed to catch all bounced messages as expected.

2. Invalid Bounce Receiver Patterns:
   • Attempts to declare a bounce receiver without the 'bounced<T>' wrapper result in a clear compile-time error. This verifies the compiler’s enforcement of the message structure restriction described in the docs.
   • Similarly, erroneous access to non-existent fields in the bounced message type (for example, referencing 'msg.x' when only 'value' is defined) triggers the expected compile error. This confirms adherence to the strict type-safety requirements.
   • Moreover, using a text type in a bounced receiver (e.g. 'bounced(msg: bounced<string>) { ... }') also produces an error, consistent with the documentation that specifies bounced text messages aren’t supported.

3. Multi-Contract and Recursive Bouncing Scenarios:
   • We simulated a bouncing chain using two contracts: one (BounceChainA) sending a bounce-enabled message to a target contract (BounceChainB) that lacks a receiver. The bounced message was received by BounceChainA’s bounce receiver, where a counter was incremented. This recursive bouncing behavior confirms that messages correctly bounce back when not processed by the destination, in full agreement with the documented mechanism for bounced messages (see   for bounced messages documentation).

Conclusion:

The observed behaviors in all tests match the official Tact documentation:
   - Valid bounce receiver definitions compile without issues.
   - Any deviations (missing wrappers, invalid accesses, or unsupported types) reliably result in compilation errors.
   - Recursive bouncing across contracts occurs as designed.

No discrepancies or compiler issues were found during our rigorous testing in this area. All documented constraints and intended behaviors for bounced messages and bounce receivers are correctly enforced by the compiler.

This confirms that the compiler behavior is consistent with the expectations documented in   and  .

End of Fuzz-Testing Summary.
*/