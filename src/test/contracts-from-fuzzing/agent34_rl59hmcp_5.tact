fun testCellSlice() {
    let cell1: Cell = beginCell().storeUint(42, 6).endCell();
    let slice1: Slice = cell1.asSlice();
    let num: Int = slice1.loadUint(6);
    dump(num); // expected: 42
}

contract TestCellSliceContract {
    receive() { testCellSlice(); }
}
