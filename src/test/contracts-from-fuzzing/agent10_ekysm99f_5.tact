// Test 3: Using combined arrangement for arguments and return values
// This snippet tests a valid arrangement: 'asm(s len -> 1 0)'
// It calls the TVM instruction LDIX which is expected to work with the given stack manipulation.

struct SliceInt { s: Slice; val: Int }

// Declaration using arrangement: 's len -> 1 0'
asm(s len -> 1 0) fun asmLoadInt(len: Int, s: Slice): SliceInt { LDIX }

// Helper function to create a Slice from a Cell
fun createSlice(c: Cell): Slice {
    return c.asSlice();
}

// For demonstration, we create a minimal cell slice that when LDIX is applied yields a slice and integer.
// Since our test environment doesn't simulate actual TVM instruction execution, this is mostly to test the arrangement syntax.

fun main() {
    // Dummy cell and slice, compile only
    let cell = beginCell().storeUint(123, 32).endCell();
    let slice = createSlice(cell);
    // Call the assembly function
    let res: SliceInt = asmLoadInt(10, slice);
    // No runtime check, just testing arrangement correctness
}
