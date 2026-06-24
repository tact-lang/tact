// Combined comprehensive test of asm functions (all tests 1-15) in a single file
// This file concatenates multiple asm function definitions to test various aspects

// Test 1: Basic asm function using TVM instructions
asm fun answer(): Int { 42 PUSHINT }

// Test 2: Using lowercase TVM instruction (expected to fail compilation)
// Uncomment the following line to test failure
// asm fun lowerCaseFail(): Int { 42 pushint }

// Test 3: Using quotes around TVM instruction (expected to fail compilation)
// Uncomment the following line to test failure
// asm fun wrongMyCode(): Cell { "PUSHINT" }

// Test 4: Argument arrangement
asm(c self) extends fun asmStoreDict(self: Builder, c: Cell?): Builder { STDICT }

// Test 5: Return arrangement (with adjusted parameter name)
asm(-> 1 0) fun asmLoadCoins(slice: Slice): SliceInt { LDVARUINT16 }
struct SliceInt { s: Slice; val: Int }

// Test 6: Missing primitive consumption
// Expected to produce an error since 43 is not consumed
// Uncomment to check error
// asm fun badPrim(): Int { 43 }

// Test 7: Struct parameter flattening
struct AB { a: Int; b: Int }
asm fun sumAB(two: AB): Int { ADD }

// Test 8: Using mutates with arrangement (renamed function to avoid duplicate names)
asm(-> 1 0) extends mutates fun loadRefTest(self: Slice): Cell { LDREF }

// Test 9: Stack underflow condition using DROP
asm fun drop(): Int { DROP }
fun underflowTest(): Int {
    repeat (5) { drop() }
    return 0;
}

// Test 10: Assembly function with no return type
asm fun pushOnly(x: Int) { INC }

// Test 11: Combined argument and return rearrangement
asm(s len -> 1 0) fun asmLoadInt(len: Int, s: Slice): SliceInt { LDIX }

// Test 12: Using PUSHINT with out-of-range number to force different opcode behavior
asm fun pushBoundary(): Int { -6 PUSHINT }

// Test 13: Referencing a parameter name as a TVM instruction
// Expected failure since BOC is taken as TVM instruction
// Uncomment to test error
// asm fun badParamRef(BOC: Cell): Cell { BOC }

// Test 14: Nested structure flattening
struct Inner { x: Int; y: Int }
struct Outer { a: Inner; b: Inner }
asm fun nestedParams(o: Outer): Int { ADD ADD }

// Test 15: Sequence mixing arithmetic instructions
asm fun compute(): Int { 1 PUSHINT 2 PUSHINT ADD }
