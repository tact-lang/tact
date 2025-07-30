fun test_slice_underflow(): Int {
    // Create a cell with 4 bits stored, then try to load 8 bits from its slice.
    let cell: Cell = beginCell().storeUint(10, 4).endCell();
    let s: Slice = cell.beginParse();
    try {
         return s.loadUint(8);
    } catch (exitCode) {
         return exitCode; // expected: exit code 9 (Cell underflow) due to insufficient bits
    }
}

fun test_precedence_operator(): Bool {
    // Test whether multiplication has higher precedence than addition: 1 + 2 * 3 should equal 7
    let result: Int = 1 + 2 * 3;
    return result == 7;
}

fun main() {
    dump(test_slice_underflow());
    dump(test_precedence_operator());
}
