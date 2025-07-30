fun testAddressConversion() {
    let a: Address = myAddress();
    // Store into a cell and convert back to a slice
    let cellSlice: Slice = beginCell().storeAddress(a).asSlice();
    // Direct conversion using the extension method.
    let directSlice: Slice = a.asSlice();
    // Check for equivalence
    cellSlice == directSlice;

    // Retrieve the string representation of the address
    let s: String = a.toString();
    s;
}
