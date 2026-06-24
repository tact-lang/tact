struct SliceInt { s: Slice; val: Int }

// Changing the order of return values and switching the order of arguments
asm(s len -> 1 0) fun asmLoadInt(len: Int, s: Slice): SliceInt { LDIX }

fun main() {
    let cell = beginCell().storeUint(42, 7);
    let slice = cell.asSlice();
    let result: SliceInt = asmLoadInt(7, slice);
}
