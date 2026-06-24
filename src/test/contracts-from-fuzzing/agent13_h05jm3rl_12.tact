/// Test 7: Valid asm function with 'mutates' attribute using arrangement (renamed to avoid conflict)

struct SliceInt { s: Slice; val: Int }

// Define extension mutation function for Slice
asm(-> 1 0) extends mutates fun loadRefTest(self: Slice): Cell { LDREF }

fun test_loadRefTest(): Cell {
    let s = beginCell().asSlice();
    return s.loadRefTest();
}
