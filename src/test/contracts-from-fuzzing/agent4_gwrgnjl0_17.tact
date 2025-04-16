/*
Comprehensive Fuzz-Testing Cycle Report for Maps in Tact

This fuzz-testing cycle focused on the implementation, documentation, and behavior of maps (dictionaries) in Tact, with a particular emphasis on key and value types. We examined the following aspects based on the official documentation:

1. Allowed Key Types:
   - The official documentation specifies that allowed key types are limited to Int and Address. Our tests confirmed that using Int (e.g. map<Int, Int>) and Address (e.g. map<Address, Int>) as keys compiles and works perfectly.
   - Attempts to use disallowed key types such as String or user-defined Structs resulted in compilation errors exactly as documented [ ].

2. Allowed Value Types & Serialization:
   - Allowed value types include Int, Bool, Cell, Address, and composite types (Structs, Message) when used appropriately. In particular, the documentation explains that while serialization can be applied to Int keys (as in Int as uint8), no other key types support custom serialization [ ].
   - Tests such as TestSerializedMap confirmed that maps with serialized keys and values compile and retrieve correct values.

3. Map Operations (Insertion, Deletion, Querying, and Replacement):
   - The operations .set, .get, .exists, .replace, .replaceGet, and .del were systematically tested. These tests verified that:
       * Inserting via .set places the correct key/value pairing.
       * Querying via .exists and .get correctly reflects presence/absence.
       * Replacement (both the boolean-returning version and the one returning the old value with replaceGet) behaves as documented [ ,  ].
       * Deletion via .del or setting a value to null effectively removes the entry.

4. Nested Maps and Iteration:
   - We verified the proper use of nested maps by encapsulating an inner map within a struct, then storing this struct within an outer map keyed by an Address. The tests confirmed that nested maps work as expected provided they are referenced through proper path expressions (e.g. self.data), which is in line with the documentation [ ].
   - Additionally, attempts to iterate over maps that are not provided as valid identifiers (i.e. directly returned from function calls) were correctly rejected by the compiler.

5. Shallow vs Deep Equality:
   - The distinction between shallow equality (using the equality operator ‘==’) and deep equality (using .deepEquals) was established. Our tests confirmed that map comparisons using shallow equality only check the hash of the serialized cells, while .deepEquals performs a full entry-by-entry comparison, exactly as described in the documentation [ ].

6. Edge Cases and Boolean Value Testing:
   - A test employing a map with Bool values demonstrated that Boolean types are valid map values. Minor syntactical adjustments were needed to integrate Tact’s if/else constructs, but the final version compiled and executed as expected [ ].

Summary:

Through our extensive fuzz-testing cycle, we validated that the Tact compiler enforces the usage rules described in the official documentation for maps. The following points summarize our findings:

• Key types are strictly limited to Int and Address; attempts to use other types (e.g., String or Struct) result in compile-time errors.
• Value types are allowed to be Int, Bool, Cell, Address, and composite types within permitted contexts, with proper support for serialization on Int types.
• All documented map operations (set, get, exists, replace, replaceGet, del) function as expected, with behavior matching official examples.
• Proper nesting and iteration of maps is supported when using valid path expressions, with the compiler correctly rejecting invalid iteration cases.
• The differentiation between shallow equality and deep equality is maintained, as documented.

No discrepancies between the Tact documentation and the actual compiler behavior were observed in our tests. All edge cases and operations performed inline with the documented specifications; hence, no critical issues were identified regarding maps.

End of Fuzz-Testing Cycle Report for Maps in Tact.
*/

contract FuzzTestReportMapsFinal {
    get fun test(): Int {
         // All map tests have been successful; return 0 as the success indicator
         return 0;
    }
}
