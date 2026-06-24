// Comprehensive Fuzz-Testing Summary for Bounced Messages and Bounce Receivers in Tact Contracts

/*
FINAL SUMMARY:
--------------
Our rigorous fuzz-testing cycle focused on the behavior of bounced messages and bounce receivers in Tact contracts. We examined both standard and edge-case scenarios, verifying that the implementation adheres strictly to the official documentation. Below are our key findings:

1. Documentation Consistency:
   • According to the Tact documentation (see citeturn0file0 for bounced messages and citeturn0file9 for contract receivers), when a message is sent with bounce: true, it will bounce back if its execution fails. The bounced message can then be processed by a dedicated bounce receiver.
   • The recommended forms for a bounce receiver are:
         • Typed bounce receiver: e.g.,
               bounced(msg: bounced<T>) { … }
         • Raw bounce receiver: e.g.,
               bounced(rawMsg: Slice) { … }
   • Additionally, the documentation mandates that a bounce receiver must have exactly one parameter of the correct type; any duplicate or incorrect definitions (e.g., multiple receivers, missing parameters, or invalid types) should be rejected at compile time.

2. Fuzz-Testing Results:
   • Valid Implementations:
     - A contract defining a typed bounce receiver (ValidBounceTyped) using the syntax:
           bounced(msg: bounced<BounceMsg>) { … }
       compiled successfully. Here, BounceMsg is a simple message structure (see citeturn0file0), confirming that type-safe bounced message handling works as intended.
     - Similarly, a contract using a raw bounce receiver (ValidBounceRaw) declared as:
           bounced(rawMsg: Slice) { … }
       also compiled without any issues.

   • Error Conditions:
     - We verified that any attempts to define duplicate bounce receivers within a single contract, or to declare a bounce receiver with an invalid or missing parameter, were correctly rejected by the compiler. This is in line with the language’s constraints as documented in citeturn0file0 and citeturn0file9.

   • Multi-Contract (Chain) Bounce Scenario:
     - In a chain test, a CallerChain contract sends a message with bounce enabled to a ReceiverChain contract that is deliberately set to fail using require(false, ...). The CallerChain’s bounce receiver successfully captures the bounced message by updating its internal flag (chainBounced). This confirms that bounced messages propagate properly between contracts.

   • Additional Conventions:
     - We ensured that using an underscore to mark a bounce receiver parameter as unused (e.g., bounced(_msg: bounced<BounceMsg>)) is correctly supported by the compiler.

3. Conclusion:
   • All valid bounce receiver definitions compile and function exactly as documented. The compiler enforces that a bounce receiver must have exactly one parameter that is either of type bounced<T> or Slice.
   • Any invalid or duplicate definitions produce clear compile-time errors, ensuring robust enforcement of language rules.
   • Our multi-contract test confirms that bounced messages are properly routed back to the sender under failure conditions.

In summary, our comprehensive tests confirm that the bounced message and bounce receiver functionality in Tact is robust and behaves exactly as specified. There are no discrepancies between documented behavior and the actual compiler behavior.

References:
   - Bounced messages documentation: docs_book_bounced.md (citeturn0file0)
   - Contract receiver functions: docs_book_contracts.md (citeturn0file9)

End of comprehensive fuzz-testing cycle.
*/
