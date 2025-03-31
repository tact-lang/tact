/// Comprehensive fuzz-testing of contract addresses and related functionalities

// Test valid creation of a new smart contract address on workchain 0 (basechain)
fun testValidNewAddress(): Address {
    return newAddress(0, 42);
}

// Test valid creation of a new smart contract address on masterchain (-1)
fun testValidMasterchainAddress(): Address {
    return newAddress(-1, 42);
}

// The following function tests an invalid chain id. It is expected to fail at compile-time.
// Uncommenting the function should produce a compile error:
/*
fun testInvalidChain(): Address {
    return newAddress(1, 42);
}
*/

// Minimal contract for contractAddress testing
contract Dummy {
    // Dummy receive function
    receive() {}
}

// Test computation of a contract's address using its StateInit structure
fun testContractAddress(): Address {
    let s: StateInit = initOf Dummy();
    return contractAddress(s);
}

// Test contractAddressExt: should produce the same address as contractAddress when chain is 0
fun testContractAddressExt(): Bool {
    let s: StateInit = initOf Dummy();
    let addr1: Address = contractAddress(s);
    let addr2: Address = contractAddressExt(0, s.code, s.data);
    return addr1 == addr2;
}

// Test BasechainAddress functions: emptyBasechainAddress and newBasechainAddress
fun testBasechain(): Bool {
    let empty: BasechainAddress = emptyBasechainAddress();
    let newB: BasechainAddress = newBasechainAddress(42);
    return empty.hash == null && newB.hash != null;
}

// Test Address.toString functionality - converts an address to its string representation
fun testAddressToString(): String {
    let addr: Address = newAddress(0, 42);
    return addr.toString();
}

// Test Address.asSlice behavior: storing and retrieving an address via cell/slice conversion
fun testAddressAsSlice(): Bool {
    let addr: Address = newAddress(0, 42);
    let a: Slice = beginCell().storeAddress(addr).asSlice();
    let b: Slice = addr.asSlice();
    return a == b;
}

// Test the extension function hasSameBasechainAddress on StateInit
// This should return true if the provided address corresponds to the contract's basechain address
fun testHasSameBasechainAddress(): Bool {
    let s: StateInit = initOf Dummy();
    let addr: Address = contractAddress(s);
    return s.hasSameBasechainAddress(addr);
}

// Test hasSameBasechainAddress with a mismatching address
// Here, we compute a basechain address and a masterchain address from the same StateInit
// Since hasSameBasechainAddress works only for basechain addresses, passing a masterchain address should yield false
fun testMismatchHasSameBasechainAddress(): Bool {
    let s: StateInit = initOf Dummy();
    let addrBase: Address = contractAddress(s);
    let addrMaster: Address = contractAddressExt(-1, s.code, s.data);
    return s.hasSameBasechainAddress(addrMaster) == false;
}

// Test conversion from string literal to Address using the address() function
// Documentation shows that addresses can be constructed from string literals
fun testAddressFromString(): String {
    let community: Address = address("UQDpXLZKrkHsOuE_C1aS69C697wE568vTnqSeRfBXZfvmVOo");
    return community.toString();
}

// Aggregate test function calling all tests (except the compile-time error test)
fun runAllTests(): Bool {
    // We don't compare the actual string values of addresses/toString across tests, just that functions execute without error.
    let b1: Bool = testContractAddressExt();
    let b2: Bool = testBasechain();
    let b3: Bool = testAddressAsSlice();
    let b4: Bool = testHasSameBasechainAddress();
    let b5: Bool = testMismatchHasSameBasechainAddress();
    // Call functions that return values but ignore them:
    let _ = testValidNewAddress();
    let _ = testValidMasterchainAddress();
    let _ = testContractAddress();
    let _ = testAddressToString();
    let _ = testAddressFromString();
    return b1 && b2 && b3 && b4 && b5;
}
