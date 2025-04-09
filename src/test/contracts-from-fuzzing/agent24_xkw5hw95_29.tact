// Final Answer

/*
Bounce Receiver Fuzz-Testing Summary
-------------------------------------

Our comprehensive fuzz-testing cycle for bounced messages and bounce receivers in Tact contracts systematically validated the following aspects:

1. Documentation Alignment:
   • The official Tact documentation states that when a message is sent with bounce: true, if its execution fails, the message will bounce back. This behavior is to be handled by a dedicated bounce receiver, which can be defined using either a typed parameter (bounced(msg: bounced<T>)) or a raw parameter (bounced(rawMsg: Slice)).
   • It is clearly documented that a valid bounce receiver must declare exactly one parameter (of type bounced<T> or Slice). Duplicate declarations or definitions with missing/incorrect parameters must be rejected.

2. Fuzz-Testing Results:
   • Valid bounce receiver definitions (as shown in contracts ValidBounceTyped and ValidBounceRaw) compile successfully. This confirms that a typed bounce receiver (using a message type, eg. BounceMsg) and a raw bounce receiver (accepting a Slice) behave as expected.
   • The compiler correctly rejects invalid bounce receiver constructions (such as duplicate bounce receivers, missing parameters, or using wrong parameter types), enforcing the documented constraints.
   • In multi-contract scenarios, a CallerChain contract sending a message (with bounce: true) to a ReceiverChain contract that is programmed to fail (via require(false, ...)) causes the bounced message to be received by CallerChain’s bounce receiver. This functionality, confirmed by state updates (e.g., setting a flag), illustrates that bounce propagation works correctly across contracts.
   • Additionally, the use of the underscore naming convention to denote an unused bounce receiver parameter is handled correctly.

3. Conclusion:
   • Our tests confirm that the Tact compiler enforces bounce receiver rules exactly as documented. Valid definitions compile and operate correctly, while invalid definitions are reliably caught with appropriate errors.
   • The multi-contract bounce scenario demonstrates that bounced messages are routed properly back to the sender.

Result:

The bounce receiver functionality in Tact is robust and adheres strictly to the official specifications. No discrepancies or unexpected behaviors were found.

End of Fuzz-Testing Cycle.
*/
