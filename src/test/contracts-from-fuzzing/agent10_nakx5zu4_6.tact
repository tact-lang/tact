contract TestParseStdAddress {
    // This contract tests parsing a standard address from a slice
    fun test() : Bool {
        // Create a valid basechain address
        let addr: Address = newAddress(0, 42);
        // Store the address in a cell and convert to slice
        let s: Slice = beginCell().storeAddress(addr).asSlice();
        // Parse the standard address from the slice
        let stdAddr = parseStdAddress(s);
        return stdAddr.workchain == 0 && stdAddr.address == 42;
    }
}
