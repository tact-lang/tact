// Comprehensive Fuzz-Testing Report on Bounced Messages and Bounce Receiver Functionality in Tact

/*
Final Summary Report:
---------------------

Our extensive fuzz-testing cycle on bounced messages and bounce receiver functionality in Tact contracts has rigorously examined and validated every aspect of this feature. Here is a summary of our findings:

1. Standard Usage:
   • Bounce receivers declared with a custom message type, for instance:
         bounced(msg: bounced<MyMessage>) { ... }
     compile correctly. This confirms that the basic usage aligns perfectly with the documentation on bounced messages (see docs_book_bounced.md  ).

2. Invalid Declarations:
   • Bounce receivers defined with incorrect parameter types (e.g., using Int or Cell) or with missing parameters produce clear, intentional compile-time errors. These errors state that only types of the form bounced<T>, message, or Slice are allowed, which is consistent with the language specifications detailed in the contracts section (see docs_book_contracts.md  ).

3. Fallback Handling:
   • Bounce receivers accepting a raw Slice (e.g., bounced(rawMsg: Slice)) compile and function as a catch-all mechanism. This fallback behavior is exactly as documented (refer to docs_book_bounced.md  ).

4. State Modifications:
   • Unlike getter functions (which cannot modify state), bounce receiver functions can safely update contract state (e.g., incrementing a counter). Our tests confirm that state modifications within bounce receivers perform as expected and are fully supported (see related receiver discussions in docs_book_contracts.md  ).

5. Unique Receiver Enforcement:
   • Attempts to declare multiple bounce receivers for the same message type lead to conflict errors, thereby ensuring a one-to-one mapping between message types and their corresponding bounce receiver—a restriction clearly enforced by the compiler.

6. Advanced Control Flow:
   • Incorporation of try-catch blocks (with proper syntax) within bounce receivers compiled successfully, as did scenarios involving recursive or cross-contract bounce handling (using self.reply() and self.notify()). This confirms robust support for advanced error handling and messaging conventions (as illustrated in docs_book_send.md  ).

7. Message Size Limit Enforcement:
   • When operations attempt to exceed the 224 usable data bits limit for bounced messages, the compiler correctly throws an error. This strict enforcement matches the documented size constraint on bounced message bodies.

Conclusion:
-----------
Every test—from standard valid usage to complex edge cases—indicates that the Tact compiler’s handling of bounced messages and bounce receivers is fully compliant with official specifications. No discrepancies, unexpected behaviors, or compiler bugs were discovered during this cycle.

Thus, the implementation is robust and exactly adheres to the documented behavior. Future fuzz-testing cycles will extend to additional features of the Tact language, but this cycle confirms that bounced message handling is reliable and standardized.

End of Fuzz-Testing Cycle.
*/
