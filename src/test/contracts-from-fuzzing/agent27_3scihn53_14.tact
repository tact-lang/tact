// Additional fuzz-testing iterations for contract addresses and related functionalities in Tact

// Test L: Attempt to create an Address from an empty string literal and convert it to string
fun testEmptyStringAddress() : String {
    let a: Address = address("");
    return a.toString();
}

// Test M: Attempt to create an Address from a malformed string literal
fun testMalformedAddress() : String {
    let a: Address = address("abcXYZ");
    return a.toString();
}

// Test N: Stress test storing multiple addresses in a cell and then loading them
fun testMultipleAddresses() : Bool {
    let addr1: Address = address("UQDpXLZKrkHsOuE_C1aS69C697wE568vTnqSeRfBXZfvmVOo");
    let addr2: Address = address("UQDpXLZKrkHsOuE_C1aS69C697wE568vTnqSeRfBXZfvmVOp");
    let cell: Cell = beginCell()
                        .storeAddress(addr1)
                        .storeAddress(addr2)
                        .endCell();
    let slice: Slice = cell.asSlice();
    let loaded1: Address = slice.loadAddress();
    let loaded2: Address = slice.loadAddress();
    return (addr1.toString() == loaded1.toString()) && (addr2.toString() == loaded2.toString());
}

// Test O: Attempt to misuse asAddressUnsafe on a slice that doesn't contain enough bits
// This test is designed to hit an edge-case and should trigger a runtime error (exit code) when executed
fun testAsAddressUnsafeUnderflow() : Address {
    // Create a cell with few bits, insufficient for an address
    let cell: Cell = beginCell().storeUint(1, 3).endCell();
    let slice: Slice = cell.asSlice();
    return slice.asAddressUnsafe();
}

// Test P: Chain conversions: Address -> Slice -> Cell -> Slice -> asAddressUnsafe, and verify roundtrip consistency
fun testChainConversion() : Bool {
    let original: Address = address("UQDpXLZKrkHsOuE_C1aS69C697wE568vTnqSeRfBXZfvmVOo");
    // Store original address in a cell
    let cell: Cell = beginCell().storeAddress(original).endCell();
    // Convert cell to slice
    let slice1: Slice = cell.asSlice();
    // Load the address
    let loaded: Address = slice1.loadAddress();
    // Store loaded address again
    let cell2: Cell = beginCell().storeAddress(loaded).endCell();
    let slice2: Slice = cell2.asSlice();
    let recon: Address = slice2.loadAddress();
    return original.toString() == recon.toString();
}
