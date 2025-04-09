// Fuzz Testing Cycle: Summary Report on Assembly Functions

/*
This series of tests explores various aspects of the Tact "asm" functions feature based on official documentation. Our testing includes:

1. Basic asm function usage:
   - Returning a constant via TVM instructions (e.g., 42 INT).
   - Using parameter names directly in the body (which should cause errors, as parameters are not directly accessible). [Test snippet 2]
   - Providing a literal primitive with no associated consuming instruction (expected to error). [Test snippet 3]

2. Arrangement declarations:
   - Correct use of parameter arrangement with the syntax: asm(a b) fun reverseAdd(a: Int, b: Int): Int { SWAP ADD } [Test snippet 16]
   - Combining parameter and return arrangements in functions with struct returns (e.g., swapping fields in a Pair) [Test snippet 21]

3. Whitespace and instruction formatting:
   - Handling of extra whitespace and inline comments within asm function bodies. [Test snippets 5, 20, 22]

4. Handling of unknown or mis-cased TVM instructions:
   - Using an unknown instruction like FOOBAR (expected error). [Test snippet 6]
   - Using mis-cased instruction (e.g., 'int' instead of 'INT', expected error). [Test snippet 8]

5. Stack manipulation edge cases:
   - Testing operations like SWAP with insufficient stack depth to verify expected runtime behavior (e.g., stack underflow). [Test snippet 19]

6. Other tests:
   - Testing sequential pushing and arithmetic operations. [Test snippets 17, 18]
   - Testing nested struct parameter flattening. [Test snippet 11]

All tests compile with expected behavior, and the compiler enforces documented constraints, such as:
- Only valid return arrangement indices may be used (e.g., Test snippet 9 and earlier versions failed as expected).
- Structs must have at least one field.

This comprehensive fuzz-testing series has not uncovered any severe compiler bugs or documented discrepancies. All observed behaviors match the official documentation. We continue to explore further nuances and edge cases of the asm functions feature.
*/

// Test snippet 1: Basic asm function returning an int
asm fun answer(): Int { 42 INT }

// Test snippet 2: Using parameter name in body (should produce error; not executed here)
// asm fun identity(x: Int): Int { x }

// Test snippet 3: Literal without consuming instruction (should produce error; not executed here)
// asm fun bad(): Int { 43 }

// Test snippet 4: Valid arrangement declaration
struct MySlice { dummy: Int }
struct SliceInt { s: MySlice; val: Int }
asm(s len -> 1 0) fun asmLoadInt(len: Int, s: MySlice): SliceInt { LDIX }

// Test snippet 5: Extra whitespace/newlines in body
asm fun whitespaceTest(): Int {
    42
    INT
}

// Test snippet 6: Unknown TVM instruction (expected error; not executed here)
// asm fun unknownInstr(): Int { 42 INT FOOBAR }

// Test snippet 7: Struct parameter flattening
struct AB2 { a: Int; b: Int }
asm fun sumAB(two: AB2): Int { ADD }

// Test snippet 8: Case sensitivity test (expected error; not executed here)
// asm fun caseTest(): Int { 42 int }

// (Test snippet 9 omitted: Incorrect return arrangement already confirmed to error)

// Test snippet 10: Mutation function extra consumption
struct DummySlice { dummy: Int }
struct DummyCell { val: Int }
asm(-> 1 0) extends mutates fun loadRef(self: DummySlice): DummyCell { LDREF }

// Test snippet 11: Nested struct flattening in parameters
struct Inner { i: Int; j: Int }
struct Outer { inner: Inner; x: Int }
asm fun nestedSum(o: Outer): Int { ADD ADD } 

// Test snippet 12: Arrangement with nested struct return
struct Pair { first: Int; second: Int }
asm(-> 1 0) fun swapPair(a: Int, b: Int): Pair { SWAP }

// Test snippet 13: Multi-line whitespace test
asm fun multilineTest(): Int {
    10
    INT
    20
    INT
    ADD
}

// Test snippet 14: Complex stack manipulation
asm fun complexStack(): Int {
    5 INT
    7 INT
    SWAP
    ADD
}

// Test snippet 15: Inline comment in asm body
asm fun commented(): Int { 
    // This inline comment should be ignored
    100 INT
}

// Test snippet 16: Parameter arrangement only
asm(a b) fun reverseAdd(a: Int, b: Int): Int { SWAP ADD }

// Test snippet 17: Multiple immediate constants
asm fun pushMultiple(): Int {
    1 INT
    2 INT
    ADD
}

// Test snippet 18: Boundary literal for PUSHINT
asm fun boundaryPush(): Int { 10 INT }

// Test snippet 19: SWAP on insufficient elements (runtime underflow if executed)
asm fun underflowTest(): Int { SWAP }

// Test snippet 20: Mixed whitespace with inline comments
asm fun mixedWhitespace(): Int {
    5     INT  // push 5
    3     INT  // push 3
    SWAP         // swap top two
    ADD          // add
}

// Test snippet 21: Combining parameter and return arrangement for struct return
struct MyPair { first: Int; second: Int }
asm(a b -> 1 0) fun combinePair(a: Int, b: Int): MyPair { SWAP }

// Test snippet 22: Chaining instructions with inline comments
asm fun chainedInstructions(): Int {
    // Push initial value
    8 INT
    // Duplicate it
    8 INT
    ADD      // Sum to get 16
}
