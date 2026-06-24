fun testStoreLoadAddress() : Bool {
    let original: Address = address("UQDpXLZKrkHsOuE_C1aS69C697wE568vTnqSeRfBXZfvmVOo");
    // Build a cell and store the address in it
    let cell: Cell = beginCell().storeAddress(original).endCell();
    let slice: Slice = cell.asSlice();
    // Load the address using the slice method
    let loaded: Address = slice.loadAddress();
    return original.toString() == loaded.toString();
}
