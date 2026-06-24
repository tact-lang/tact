///////////////////////////////////////////////////////////////////
// Extended Fuzz Testing Cycle Continued: Testing cells and slices comparison
// This snippet tests the equality of two cells and two slices by comparing their SHA-256 hashes
///////////////////////////////////////////////////////////////////

fun testCellEquality() {
    let c1: Cell = beginCell().storeUint(42, 8).endCell();
    let c2: Cell = beginCell().storeUint(42, 8).endCell();
    let equal: Bool = c1.hash() == c2.hash();
    dump(equal ? 1 : 0); // expected output: 1 (true)
}

fun testSliceEquality() {
    let c1: Cell = beginCell().storeUint(42, 8).endCell();
    let s1: Slice = c1.asSlice();
    let c2: Cell = beginCell().storeUint(42, 8).endCell();
    let s2: Slice = c2.asSlice();
    let equal: Bool = s1.hash() == s2.hash();
    dump(equal ? 1 : 0); // expected output: 1 (true)
}

fun main() {
    testCellEquality();
    testSliceEquality();
}
