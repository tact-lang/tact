struct SliceInt { s: Slice; val: Int }

asm(s len -> 1 0) fun asmLoadInt(len: Int, s: Slice): SliceInt { LDIX }

fun callAsmLoadInt() : Int {
    let b = beginCell().storeInt(42, 7);
    let s = b.asSlice();
    let si: SliceInt = asmLoadInt(7, s);
    return si.val;
}
