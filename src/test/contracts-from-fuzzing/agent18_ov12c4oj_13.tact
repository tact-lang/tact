// Test 9: Using arrangement with both argument and return reordering
// This snippet tests combined arrangement: reorders arguments and return values.
struct SliceInt { s: Slice; val: Int }

// The arrangement reorders first argument to second position (len parameter pushes first) and returns reversed stack output.
asm(s len -> 1 0) fun asmLoadInt(len: Int, s: Slice): SliceInt { LDIX }

fun main() {
    let dummy: Slice = beginCell().asSlice();
    let res: SliceInt = asmLoadInt(10, dummy);
    // Test to verify compile-time behavior, not executed in actual runtime here
}
