// Comprehensive asm functions testing composite file

// Test 1: Basic asm function using TVM instructions
asm fun answer(): Int { 42 PUSHINT }

// Test 4: Argument arrangement
asm(c self) extends fun asmStoreDict(self: Builder, c: Cell?): Builder { STDICT }

// Test 5: Return arrangement
asm(-> 1 0) fun asmLoadCoins(slice: Slice): SliceInt { LDVARUINT16 }
struct SliceInt { s: Slice; val: Int }

// Test 7: Struct parameter flattening
struct AB { a: Int; b: Int }
asm fun sumAB(two: AB): Int { ADD }

// Test 8: Using mutates with arrangement
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

// Test 12: PUSHINT with a value out of low range (-6) to force different opcode
asm fun pushBoundary(): Int { -6 PUSHINT }

// Test 14: Nested structure flattening
struct Inner { x: Int; y: Int }
struct Outer { a: Inner; b: Inner }
asm fun nestedParams(o: Outer): Int { ADD ADD }

// Test 15: Sequence mixing arithmetic instructions
asm fun compute(): Int { 1 PUSHINT 2 PUSHINT ADD }
