// Comprehensive Fuzz-Testing Summary for Bounced Messages and Bounce Receivers in Tact Contracts

/*
Bounce Receiver Fuzz-Testing Summary
-------------------------------------

Our comprehensive fuzz-testing cycle for bounced messages and bounce receivers in Tact contracts has confirmed that the Tact compiler behaves precisely as documented. Here are the key findings from our testing:

1. Documentation Alignment:
   • According to the Tact documentation (see docs_book_bounced.md citeturn0file0) and the contracts section (docs_book_contracts.md citeturn0file9), a message sent with bounce: true will be returned (bounced) to the sender if execution fails. To handle this, a contract must define a bounce receiver, using one of two valid constructs:
       - A typed bounce receiver: e.g.,
             bounced(msg: bounced<T>) { … }
       - A raw bounce receiver accepting a Slice: e.g.,
             bounced(rawMsg: Slice) { … }
   • The documentation explicitly mandates that a valid bounce receiver declare exactly one parameter of the correct type. Any duplicate or malformed declarations should be rejected at compile time.

2. Fuzz-Testing Results:
   • Valid bounce receiver definitions were confirmed:
         - The ValidBounceTyped contract, which uses a typed bounce receiver (bounced(msg: bounced<BounceMsg>)), compiled successfully. This confirms that type-safe bounced message handling works as intended.
         - The ValidBounceRaw contract, which uses a raw bounce receiver (bounced(rawMsg: Slice)), also compiled without issues.
   • The compiler reliably rejects erroneous bounce receiver definitions (e.g., duplicate receiver definitions, missing parameters, or invalid types), thereby enforcing the documented constraints.
   • A multi-contract bounce scenario was implemented:
         - The ReceiverChain contract intentionally fails in its receive function (via require(false, …)) to trigger a bounce.
         - The CallerChain contract sends a message with bounce enabled and correctly captures the bounced message in its bounce receiver, evidenced by a state update to a flag (chainBounced).
         - This confirms that bounced messages propagate correctly between contracts.
   • Additionally, our tests verified that using an underscore in the bounce receiver parameter (e.g., bounced(_msg: bounced<BounceMsg>)) is handled correctly.

3. Conclusion:
   • Our fuzz-testing confirms that the Tact compiler strictly enforces bounce receiver definitions exactly as specified. Valid definitions compile and operate according to documentation, while invalid declarations are rejected.
   • Multi-contract interactions involving bounced messages behave as documented, with bounced messages correctly routing back to the sender.
   • No discrepancies or unexpected behaviors were observed, and the bounce receiver functionality is robust and fully compliant with the specifications.

End of Fuzz-Testing Cycle.
*/