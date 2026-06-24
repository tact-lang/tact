contract Dummy {
    init() {}
}

// Test 1: Valid usage of newAddress and toString
fun testNewAddressValid(): String {
    // Create a valid address on the basechain (chain id 0) with a typical 256-bit hash
    let addr: Address = newAddress(0, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
    return addr.toString();
}

// Test 2: (Compile-time) Invalid chain ID usage
// The following function is commented out because newAddress must only be used with chain id 0 or -1.
// Uncommenting the function should trigger a compile-time error as documented in .

// fun testNewAddressInvalid(): Address {
//     // Chain id 1 is invalid (only 0 for basechain or -1 for masterchain are allowed when detected at compile time)
//     let addr: Address = newAddress(1, 123);
//     return addr;
// }

// Test 3: Verify contractAddress and contractAddressExt produce the same result
fun testContractAddressEquality(): Bool {
    // Obtain StateInit from a dummy contract
    let s: StateInit = initOf Dummy();
    let addr1: Address = contractAddress(s);
    let addr2: Address = contractAddressExt(0, s.code, s.data);
    return addr1 == addr2;
}

// Test 4: Validate Address to Slice conversion
fun testAsSlice(): Bool {
    let addr: Address = newAddress(0, 0x789);
    let s1: Slice = beginCell().storeAddress(addr).asSlice();
    let s2: Slice = addr.asSlice();
    return s1 == s2;
}

// Test 5: Validate creation and properties of basechain addresses
fun testBasechainAddresses(): Bool {
    let empty: BasechainAddress = emptyBasechainAddress();
    let nonEmpty: BasechainAddress = newBasechainAddress(0xabc);
    return (empty.hash == null) && (nonEmpty.hash != null);
}

// Test 6: Validate forceBasechain accepts a basechain address
// Note: If forceBasechain is called with a non-basechain address, it should throw an error at runtime (exit code 138 as documented in ),
// but here we only ensure the function compiles correctly using a valid basechain address.
fun testForceBasechain(): Bool {
    let valid: Address = newAddress(0, 0x123);
    forceBasechain(valid);
    return true;
}

// Test 7: Validate hasSameBasechainAddress extension function
// This function compares the basechain address encoded in a contract's StateInit with a given address.
fun testHasSameBasechainAddress(): Bool {
    let s: StateInit = initOf Dummy();
    return s.hasSameBasechainAddress(newAddress(0, 0xdef));
}

// To invoke all tests in a batch (caller can add a main() if desired):
// Uncomment the following main function to perform tests during execution.

// fun main() {
//     assert(testNewAddressValid() != "");
//     assert(testContractAddressEquality());
//     assert(testAsSlice());
//     assert(testBasechainAddresses());
//     assert(testForceBasechain());
//     assert(testHasSameBasechainAddress());
// }
