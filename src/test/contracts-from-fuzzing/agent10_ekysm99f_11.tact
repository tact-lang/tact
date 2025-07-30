// Summary of tests for asm functions in Tact

// Test A: Basic asm function pushing int
asm fun push42(): Int { 42 PUSHINT }

// Test B: ASM function using SWAP and DROP to reorder two parameters
asm fun swapDrop(a: Int, b: Int): Int {
    SWAP
    DROP
}

// Test C: Using combined arrangement: (s len -> 1 0) with dummy LDIX
struct SliceInt { s: Slice; val: Int }
asm(s len -> 1 0) fun asmLoadInt(len: Int, s: Slice): SliceInt { LDIX }

// Test D: ASM function with extra primitive without consuming TVM instruction - should fail compilation
// asm fun badFunc(): Int { 43 }
// (Expected: compilation error: primitive 43 not consumed by any TVM instruction)

// Test E: ASM function parameter flattening with struct
struct AB { a: Int; b: Int }
asm fun sum(two: AB): Int { ADD }

// Test F: Negative case for case sensitivity: using lowercase tvm instruction should fail
// asm fun badCase(): Cell { mycode }
// (Expected error, since tvm instructions must be uppercase)

// Test G: Correct case for myCode using no quotes
asm fun myCodeCorrect(): Cell { MYCODE }

// Main function that calls all valid ASM functions
fun main() {
    let a: Int = push42();         // Expected: 42
    let b: Int = swapDrop(100, 200); // Expected: 200
    // Create a dummy cell slice to invoke asmLoadInt
    let cell = beginCell().storeUint(0, 1).endCell();
    let slice = cell.asSlice();
    let si: SliceInt = asmLoadInt(10, slice);
    let s: Int = sum(AB{ a: 20, b: 22 }); // Expected: 42
    myCodeCorrect();
    // As tests, the above should compile according to documentation.
}
