contract AddrTest {
    receive() {
        // Get the address of this contract
        let addr: Address = myAddress();
        // Convert the address into a slice using the extension function
        let s1: Slice = addr.asSlice();
        // Build a cell containing the address
        let cell: Cell = beginCell().storeAddress(addr).endCell();
        // Convert the cell to a slice
        let s2: Slice = cell.asSlice();
        // Compare both slices and require that they are equal
        require(s1 == s2, "Address slice mismatch");
        // Return any excess funds
        cashback(sender());
    }
}

// Dummy function to trigger compilation
fun runTest() {
    // Nothing to do here; the contract is deployed and its receive will be triggered on message
    return;
}
