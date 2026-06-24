fun testSlice(): Int {
    // Create a cell that stores an 8-bit unsigned integer and then parse its slice
    let cell = beginCell().storeUint(42, 8).endCell();
    let slice = cell.beginParse();
    // Load an 8-bit unsigned integer from the slice
    let value: Int = slice.loadUint(8);
    return value; // Expect 42
}

fun main(): Int {
    return testSlice();
}
