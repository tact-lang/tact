// Continued systematic fuzz testing of asm functions

// Test 1: Minimal valid asm function (already tested above, reiterated here for completeness)
asm fun push42(): Int { 42 PUSHINT }

// Test 2: Using a primitive unaccompanied by an instruction (should fail)
// Already tested: asm fun badPrimitive(): Int { 43 }

// Test 3: Parameter name misinterpreted by asm parser
asm fun echo(x: Int): Int { x }  

// Test 4: Case sensitivity check (using lower case should fail)
asm fun wrongCase(): Cell { mycode }

// Test 5: Correct casing for a presumed valid TVM instruction (MYCODE)
// Note: if MYCODE is not a defined TVM instruction this may fail for other reasons
asm fun rightCase(): Cell { MYCODE }

// Test 6: Invalid return arrangement using swap; earlier test failed because arrangement indices were wrong.
// Let us attempt a valid rearrangement with a function that produces two values. Define a struct with two fields.
struct Pair { first: Int; second: Int }
// We design a function that pushes two ints and uses a valid rearrangement. According to docs, if return type is Pair, fields are captured right-to-left so arrangement is expected to mention indices 0 and 1.
asm(-> 1 0) fun createPair(): Pair {
    10 PUSHINT
    20 PUSHINT
}

// Test 7: Function with no declared return type; already tested noReturn, repeated for thoroughness
asm fun noReturn(x: Int) { INC }

// Test 8: Using 'mutates' attribute combined with rearrangement
// We define an alternative function with a custom name avoiding collision
// Return type: struct CellHolder { cell: Cell }
struct CellHolder { cell: Cell }
// This function uses LDREF which produces two values; using arrangement to swap. Must mention both positions 0 and 1.
asm(-> 1 0) extends mutates fun loadRefAlt(self: Slice): CellHolder { LDREF }

// Test 9: Struct flattening for parameter types
struct AB { a: Int; b: Int }
// This should push a then b onto the stack; using ADD adds them, valid if ADD consumes two ints.
asm fun sumAB(two: AB): Int { ADD }

// Test 10: Nested struct flattening
struct Nested { inner: AB; extra: Int }
// Expected flattening: push two fields of AB (a then b) then extra. We'll add b and extra then a with that partial sum.
// We can do: DROP the first field then ADD the remaining
// Instead, we test a simple valid operation that does two additions. We'll push the entire structure manually by our own code in the body.
// But since the function body only operates on the TVM stack, it is not straightforward to split operation. Instead, we check that the compile time flattening is accepted.
asm fun addNested(n: Nested): Int {
    // Flatten: inner.a, inner.b, extra on stack (bottom to top)
    // Let's assume we want (inner.a + inner.b) + extra. TVM instructions are left-to-right; our instruction ADD takes two values.
    ADD   // adds inner.b and extra, leaving inner.a on stack and the result on top
    ADD   // adds inner.a with previous result
}

// Test 11: Using a TVM instruction with a numeric argument pushing number at edge of PUSHINT opcode range
asm fun testPushRange(): Int {
    -128 PUSHINT
}

// Test 12: Wildcard parameter names
asm fun testWildcard(_: Int): Int { 42 PUSHINT }

// Test 13: Naming parameter with a name matching a TVM instruction (e.g., INC) and then trying to use it
// According to docs, referencing parameter directly in the body will be interpreted as a TVM instruction. We test that using a parameter named INC and using it as a TVM instruction may conflict
asm fun conflictParam(INC: Int): Int { INC }

// Test 14: Using quoted instruction should be interpreted as a string, which is not allowed
asm fun testQuoted(): Int { "PUSHINT" }

// Test 15: Empty body asm function with declared return type (should produce a compile error because nothing is pushed)
asm fun emptyBody(): Int { }

// Test 16: Capture more return values than present (stack underflow) with struct TooMany
struct TooMany { f1: Int; f2: Int; f3: Int }
asm fun underflowTest(): TooMany { }

// Test 17: Assembly function with valid RPN addition
asm fun sum20And10(): Int {
    10 PUSHINT
    20 PUSHINT
    ADD
}
