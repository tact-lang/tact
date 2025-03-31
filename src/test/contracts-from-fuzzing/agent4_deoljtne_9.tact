/// Combined ASM function fuzz tests (modified types to satisfy minimum requirements)

// Test 6: ASM function with argument arrangement
struct MySlice { dummy: Int }
struct MySliceInt { s: MySlice; val: Int }
asm(s len -> 1 0) fun loadInt(len: Int, s: MySlice): MySliceInt { LDIX }

// Test 7: ASM function with nested struct flattening
struct AB { a: Int; b: Int }
struct Nested { ab1: AB; ab2: AB }
asm fun mulOfSums(n: Nested): Int { ADD -ROT ADD MUL }

// Test 8: ASM function using a negative literal
asm fun pushMinus6(): Int { -6 PUSHINT }

// Test 9: ASM function using a large literal outside the small immediate range
asm fun pushLarge(): Int { 1000 PUSHINT }

// Test 10: ASM function including an inline comment
asm fun commentTest(): Int {
    // pushing 10 onto the stack
    10 PUSHINT
}

// Test 11: ASM function applying SWAP then ADD
asm fun swapAndAdd(x: Int, y: Int): Int { SWAP ADD }

// Test 12: ASM function with nested struct flattening (one level deeper)
struct Inner { i: Int }
struct Outer { inner: Inner; j: Int }
asm fun nestedSum(o: Outer): Int { ADD }

// Test 13: ASM function with complex multi-instruction sequence
asm fun complexOp(a: Int, b: Int, c: Int): Int { SWAP ADD SWAP ADD }