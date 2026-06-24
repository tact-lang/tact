// Comprehensive Final Fuzz-Testing Report on Bounced Messages and Bounce Receiver Functionality in Tact

/*
Final Summary:
-------------
Our extensive fuzz-testing cycle on bounced messages and bounce receiver functionality in Tact contracts confirms that the compiler behavior is robust and exactly adheres to the documented specifications. Below is a summary of our key findings:

1. Standard Bounce Receiver Usage:
   • Declaring a bounce receiver with a custom message type (e.g., using:
       bounced(msg: bounced<MyMessage>) { ... }
     ) compiles successfully. This validates the primary intended use as outlined in the documentation (see docs_book_bounced.md  ).

2. Invalid Declarations:
   • Bounce receivers defined with improper parameter types (e.g., Int or Cell) or those that omit the parameter entirely trigger precise compile-time errors, enforcing that only types of the form bounced<T>, message, or Slice are allowed. This behavior matches the specifications detailed in the documentation (refer to docs_book_contracts.md  ).

3. Fallback Handling:
   • Defining a bounce receiver with a Slice parameter (e.g., bounced(rawMsg: Slice)) compiles successfully, thereby permitting the contract to catch any bounced message. This fallback mechanism is explicitly recommended in the relevant docs (see docs_book_bounced.md  ).

4. State Modifications:
   • Bounce receivers can modify the contract state (e.g., incrementing a counter), which is duly supported in our tests. Unlike getters, which restrict state changes, bounce receivers allow state updates, in line with guidelines in docs_book_contracts.md  .

5. Conflict Prevention:
   • Attempting to define multiple bounce receivers for the same message type correctly results in a conflict error, ensuring a one-to-one mapping between the message type and its handler. This constraint prevents ambiguous behavior as documented.

6. Advanced Control Flow:
   • Incorporation of try-catch blocks (with proper syntax) inside bounce receivers compiled successfully. Additionally, recursive and cross-contract scenarios using self.reply() and self.notify() also work as expected, confirming robust support for complex control flow (see docs_book_send.md  ).

7. Message Size Limit Enforcement:
   • Our tests that attempted to create bounced messages with data exceeding the 224 usable data bits limit produced compile-time errors. This strict enforcement of the size constraint is consistent with the limitations mentioned in the documentation (refer to docs_book_bounced.md  ).

Conclusion:
-----------
Every test, spanning from standard, valid usage to edge cases and invalid definitions, confirms that the Tact compiler’s handling of bounced messages and bounce receivers perfectly aligns with the official documentation. No discrepancies or unintended behaviors were observed, establishing that the bounce handling mechanisms in Tact are robust and reliable.

This comprehensive fuzz-testing cycle establishes a strong confidence in the implementation and will serve as a baseline before moving on to further language features in subsequent testing cycles.

End of Report.
*/
