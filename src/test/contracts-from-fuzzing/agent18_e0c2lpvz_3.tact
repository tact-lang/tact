/// Fuzz-testing for contract addresses and related functionalities in Tact

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
// Here, we compute a StateInit for Dummy and then verify that its computed basechain address
// matches the one produced by contractAddress(s). According to docs, they should be equal.
fun testHasSameBasechainAddress(): Bool {
    let s: StateInit = initOf Dummy();
    let addr: Address = contractAddress(s);
    return s.hasSameBasechainAddress(addr);
}
