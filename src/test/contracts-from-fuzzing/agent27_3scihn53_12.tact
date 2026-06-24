// Further fuzz-testing of contract addresses and related functionalities in Tact.
// This next round targets subtle edge cases and interactions between Address, BasechainAddress, and Slice conversions.

// Test G: Check that converting an Address to Slice and back using asAddressUnsafe works for a valid cell.
fun testValidAddressRoundtrip2() : Bool {
    let original: Address = address("UQDpXLZKrkHsOuE_C1aS69C697wE568vTnqSeRfBXZfvmVOo");
    let slice: Slice = original.asSlice();
    let converted: Address = slice.asAddressUnsafe();
    // Use toString to compare; the conversion is gas-expensive but adequate for testing.
    return original.toString() == converted.toString();
}

// Test H: Stress test the asAddressUnsafe: Create a cell with random data that barely mimics an address structure,
// and check if asAddressUnsafe produces a consistent (possibly invalid) result without crashing the compiler.
fun testAsAddressUnsafeRandom() : String {
    let cell: Cell = beginCell()
                    .storeUint(0xABCD, 16)    // random 16-bit value
                    .storeUint(0x12345678, 32)  // random 32-bit value
                    .endCell();
    let slice: Slice = cell.asSlice();
    // This intentionally misinterprets the cell as an address.
    let addr: Address = slice.asAddressUnsafe();
    return addr.toString();
}

// Test I: Combine address usage in state and message sending.
// A contract that stores an address in its state, sends a message to that address, and then retrieves it in a getter.
contract AddressUsageContract {
    storedAddr: Address;

    init() {
        // Generate a valid address using a known literal
        self.storedAddr = address("UQDpXLZKrkHsOuE_C1aS69C697wE568vTnqSeRfBXZfvmVOo");
    }

    // A function that would normally send a message to storedAddr.
    // For testing, we simply perform a roundtrip conversion.
    get fun getStoredAddrStr() : String {
        return self.storedAddr.toString();
    }

    // A simulation of a message sending: compute a pseudo new address based on the stored one
    // Here we mimic some transformation using asSlice and asAddressUnsafe
    get fun transformAddr() : String {
        let s: Slice = self.storedAddr.asSlice();
        let newAddr: Address = s.asAddressUnsafe();
        return newAddr.toString();
    }
}

// Test J: Edge case: Attempt to convert an empty cell (with no bits) to an Address via asSlice/asAddressUnsafe.
// Expecting that this might yield some default behavior or error after runtime (if not caught at compile time).
fun testEmptyCellAsAddress() : String {
    let empty: Cell = emptyCell();
    let slice: Slice = empty.asSlice();
    let addr: Address = slice.asAddressUnsafe();
    return addr.toString();
}

// Test K: Validate hasSameBasechainAddress in an edge case where the contract state is built from non-empty cells
// and compare with a known address (this tests the binary comparison logic).
fun testHasSameBasechainEdge() : Bool {
    // Create non-empty cells using simple data
    let code: Cell = beginCell().storeUint(99, 7).endCell();
    let data: Cell = beginCell().storeUint(77, 7).endCell();
    let state: StateInit = StateInit { code, data };
    // Use a valid address literal; for edge case, we simply check that the function returns a Boolean without crashing.
    let addr: Address = address("UQDpXLZKrkHsOuE_C1aS69C697wE568vTnqSeRfBXZfvmVOo");
    return state.hasSameBasechainAddress(addr);
}
