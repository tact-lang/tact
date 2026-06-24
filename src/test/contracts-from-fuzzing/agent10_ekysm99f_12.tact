// Comprehensive test suite for asm functions in Tact

// Test A: Basic asm function using TVM instruction PUSHINT
// Verifies that an assembly function can push a constant integer on the stack and return it
asm fun push42(): Int { 42 PUSHINT }

// Test B: Assembly function using SWAP and DROP to manipulate two parameters
// Parameters are passed in order (first pushed is at bottom, last pushed is on top)
// SWAP exchanges them, then DROP drops the top element; the remaining value is returned
asm fun swapDrop(a: Int, b: Int): Int {
    SWAP
    DROP
}

// Test C: Combined arrangement usage in asm function
// Using arrangement (s len -> 1 0) to rearrange parameters and return values via TVM instruction LDIX
// Although actual TVM behavior may depend on TVM-run, this test validates arrangement syntax
struct SliceInt { s: Slice; val: Int }
asm(s len -> 1 0) fun asmLoadInt(len: Int, s: Slice): SliceInt { LDIX }

// Test D: Assembly function for struct parameter flattening
// The struct AB should be flattened so that field 'a' is pushed first and 'b' is pushed second
// The ADD instruction consumes two numbers from the stack: first parameter (a) then second (b) are added
struct AB { a: Int; b: Int }
asm fun sum(two: AB): Int { ADD }

// Test E: Correct usage of a TVM instruction without quotes
// TVM instructions must be uppercase and not enclosed in quotes. MYCODE is used as a TVM instruction
asm fun myCodeCorrect(): Cell { MYCODE }


// Main function that calls valid asm functions
fun main() {
    // Test A: Expect push42() returns 42
    let a: Int = push42();

    // Test B: swapDrop should return second parameter (b), hence expect 200
    let b: Int = swapDrop(100, 200);
    
    // Test C: Create a dummy Slice for asmLoadInt, even though LDIX won't produce meaningful runtime behavior in our test
    let cell = beginCell().storeUint(0, 1).endCell();
    let slice = cell.asSlice();
    let si: SliceInt = asmLoadInt(10, slice);
    
    // Test D: Sum of struct fields should yield 20 + 22 = 42
    let s: Int = sum(AB{ a: 20, b: 22 });
    
    // Test E: Call myCodeCorrect; its primary validation is compilation (runtime behavior is backend-specific)
    myCodeCorrect();
}
