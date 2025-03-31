fun testAsAddressUnsafeFail() : Address {
    // Create a cell that does NOT store an address. This should be an edge case.
    let cell: Cell = beginCell().storeUint(42, 10).endCell();
    let slice: Slice = cell.asSlice();
    // Attempt to interpret this slice as an Address.
    return slice.asAddressUnsafe();
}
