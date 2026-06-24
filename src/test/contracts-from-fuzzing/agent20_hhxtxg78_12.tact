// Comprehensive Testing Cycle: asm functions

// Test 1: Correct usage of asm function with argument/return arrangement
struct SliceInt { s: Slice; val: Int }

asm(s len -> 1 0) fun asmLoadInt(len: Int, s: Slice): SliceInt { LDIX }

fun test_loadInt() {
    let dummySlice: Slice = beginCell().asSlice();
    let result: SliceInt = asmLoadInt(10, dummySlice);
}

// Test 2: Invalid asm function using a primitive without an instruction
// This should fail compilation as per the docs
asm fun badPrimitive(): Int { 43 }

// Test 3: Valid asm function that uses a proper TVM instruction (DROP) with no return type
asm fun dropValue() { DROP }

fun test_drop() {
    dropValue();
}

// Test 4: asm function using lowercase TVM instruction, expecting error (instructions must be uppercase)
asm fun lowerCaseError(): Int { drop }

// Test 5: Testing the use of mutates attribute with arrangement
// Note: Called as an extension method because the function extends Slice type
asm(-> 1 0) extends mutates fun loadRefMutate(self: Slice): Cell { LDREF }

fun test_loadRefMutate() {
    let dummyCell: Cell = beginCell().endCell();
    let dummySlice: Slice = dummyCell.asSlice();
    let result: Cell = dummySlice.loadRefMutate();
}
