// Test 4b: Valid parameter and arrangement test with proper parameter not using reserved name.

struct SliceInt { s: Slice; val: Int }

// Use parameter name 's' instead of 'self' since 'self' is reserved for extenders
asm(-> 1 0) fun asmLoadCoins(s: Slice): SliceInt { LDVARUINT16 }

fun main() {
    let dummy: Slice = beginCell().asSlice();
    let result: SliceInt = asmLoadCoins(dummy);
}
