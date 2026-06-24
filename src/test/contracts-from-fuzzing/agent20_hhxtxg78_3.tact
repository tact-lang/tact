// Test 1: Valid asm function with argument and return arrangement
// This snippet defines a struct and an asm function that reorders arguments and returns

struct SliceInt { s: Slice; val: Int }

// The function takes two parameters and uses an arrangement to swap them on the stack
asm(s len -> 1 0) fun asmLoadInt(len: Int, s: Slice): SliceInt { LDIX }

// A helper function to call asmLoadInt so we can check for compilation success
fun test() {
    let dummySlice: Slice = beginCell().asSlice();
    let result: SliceInt = asmLoadInt(10, dummySlice);
}
