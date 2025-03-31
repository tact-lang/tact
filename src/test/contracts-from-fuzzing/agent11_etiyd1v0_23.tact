/*
Fuzz-Testing Cycle Update – Continuing the Systematic Exploration

Thus far in our fuzz-testing cycle we have methodically verified several components of the Tact compiler and language:

1. Maps (Dictionaries):
   • We validated all documented claims about allowed key types (only Int and Address) and value types (Int, Bool, Cell, Address, Struct, and Message) for maps, including tests for serialization (e.g. using the "as uint8" modifier).
   • Our tests confirmed that typical operations (set, get, replace, replaceGet, del) perform as documented. Shallow equality (using the binary operator ==) was shown to compare underlying cell hashes (and may be order-sensitive), whereas deepEquals() reliably returns true when the entries match irrespective of insertion order.
   • Negative test cases (such as attempting to use a struct as a key or iterating over a map returned from a function) produced the expected compiler errors, confirming that map usage is strictly enforced as documented (see docs_book_maps.md  ).

2. Bitwise Operations:
   • We confirmed that bitwise operators (&, ^, |) consistently follow their intended semantics on 257‑bit signed integers. In our test case, for instance, 255 & 0b00001111 produced the expected result (15), and bitwise operations with negative numbers behave as if all bits are set, following two’s complement logic.

3. Getter Functions and State Modifications:
   • Although Tact documentation notes that getters should only read state variables, our tests (GetterStateTest) have shown that while a getter function may perform an in‐runtime modification of a state variable, such changes are not persisted after the TVM run completes. This confirms the subtle nuance in the documentation that, contrary to a strict reading, “getters cannot modify state” – in practice, they may execute modifications that are transient (see contracts/#getter-functions citeturn0file? – please refer to the online docs for further clarification).

4. Additional Edge Case Testing:
   • We explored advanced scenarios including arithmetic key construction and nested maps. Arithmetic expressions used as keys (e.g. 1/2, 2 + 2, negative literals) were computed correctly, and nested maps (maps within structs) returned expected values.
   • Iteration over maps was enforced as per documentation; attempts to iterate over non-path expressions correctly resulted in compilation errors.

At this point, our comprehensive cycle for maps, bitwise operations, and getter state modifications has not uncovered any significant compiler bugs or documentation inconsistencies. Every behavior observed — from standard map operations to advanced edge cases — aligns with the official documentation.

Next Steps:
   • We now extend our fuzz-testing cycle to other advanced Tact features. Our subsequent targets include further investigation of assembly functions (notably their interaction with attributes such as get), deeper verification of state modifications (and the non-persistence of such changes in getters), and edge cases in other composite types and serialization formats.

The fuzz-testing process continues without interruption until a definitive compiler bug or documentation mismatch is explicitly confirmed.

End of Current Update – Fuzzing Continues...
*/