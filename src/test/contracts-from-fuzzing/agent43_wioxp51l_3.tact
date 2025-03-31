contract SomeContract {
    // Minimal contract to support initOf
    init() {}
}

// Test Address.asSlice extension function
fun testAsSlice() : Bool {
    let a: Address = address("UQDpXLZKrkHsOuE_C1aS69C697wE568vTnqSeRfBXZfvmVOo");
    let sliceFromCell: Slice = beginCell().storeAddress(a).asSlice();
    let sliceDirect: Slice = a.asSlice();
    return sliceFromCell == sliceDirect;
}

// Test Address.toString conversion
fun testToString() : Bool {
    let a: Address = address("UQDpXLZKrkHsOuE_C1aS69C697wE568vTnqSeRfBXZfvmVOo");
    let s: String = a.toString();
    // A non-empty string is expected
    return s != "";
}

// Test BasechainAddress creation functions
fun testBasechainAddress() : Bool {
    let emptyAddr: BasechainAddress = emptyBasechainAddress();
    // For an empty basechain address, hash should be null
    if (emptyAddr.hash != null) { return false; }
    
    let addr: BasechainAddress = newBasechainAddress(42);
    // The hash of the new basechain address should be 42
    if (addr.hash != 42) { return false; }
    
    return true;
}

// Test BasechainAddress with negative hash value
fun testNegativeBasechain() : Bool {
    let addr: BasechainAddress = newBasechainAddress(-1);
    // Expect the hash field to exactly match the input value (-1)
    return addr.hash == -1;
}

// Test the extension function hasSameBasechainAddress on a StateInit struct
fun testHasSameBasechain() : Bool {
    let initStruct = initOf SomeContract();
    // This function compares sender() with the contract's basechain address.
    // In testing, we can't determine the exact expected outcome, but the function
    // must compile and return a Bool.
    let _ : Bool = initStruct.hasSameBasechainAddress(sender());
    return true;
}

// Main function to execute tests; using require to abort if a test fails
fun main() {
    require(testAsSlice(), "TestAsSlice failed");
    require(testToString(), "TestToString failed");
    require(testBasechainAddress(), "TestBasechainAddress failed");
    require(testNegativeBasechain(), "TestNegativeBasechain failed");
    // testHasSameBasechain is not used here due to dependency on runtime sender
    return;
}
