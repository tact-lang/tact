// Comprehensive testing of contract address functionality in Tact

contract SomeContract {
    // Minimal contract; no state variables required
}

// Test 1: Valid newAddress() usage for basechain
fun test_newAddress_valid() {
    // Valid workchain id 0 for basechain
    let addr0: Address = newAddress(0, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
    dump(addr0);
}

// Test 2: Valid newAddress() usage for masterchain
fun test_newAddress_masterchain() {
    // Valid masterchain id (-1) is allowed; although later functions (like forceBasechain) require basechain
    let addrMaster: Address = newAddress(-1, 0x11223344556677889900aabbccddeeff00112233445566778899aabbccddeeff);
    dump(addrMaster);
}

// Test 3: Test contractAddress() and contractAddressExt() equality
fun test_contractAddress_equality() {
    // Obtain the StateInit of SomeContract
    let s: StateInit = initOf SomeContract();
    let addr_from_contract: Address = contractAddress(s);
    let addr_from_ext: Address = contractAddressExt(0, s.code, s.data);
    dump(addr_from_contract);
    dump(addr_from_ext);
    dump(addr_from_contract == addr_from_ext); // should be true
}

// Test 4: Test asSlice() and toString() for Address
fun test_asSlice_and_toString() {
    let a: Address = newAddress(0, 0xAABBCCDDEEFF00112233445566778899AABBCCDDEEFF00112233445566778899);
    let slice_from_store: Slice = beginCell().storeAddress(a).asSlice();
    let slice_from_func: Slice = a.asSlice();
    dump(slice_from_store == slice_from_func); // should be true
    
    // toString should yield a valid string representation
    let str: String = a.toString();
    dump(str);
}

// Test 5: Test BasechainAddress utilities
fun test_BasechainAddress() {
    // emptyBasechainAddress returns an address with null hash
    let emptyBc: BasechainAddress = emptyBasechainAddress();
    dump(emptyBc.hash == null);

    // newBasechainAddress creates a basechain address with a given non-null hash
    let newBc: BasechainAddress = newBasechainAddress(0xDEADBEEF);
    dump(newBc.hash != null);
}

// Test 6: Test hasSameBasechainAddress extension function
fun test_hasSameBasechainAddress() {
    let s: StateInit = initOf SomeContract();
    // Use the contract's computed basechain address as sender
    let addr: Address = contractAddress(s);
    let same: Bool = s.hasSameBasechainAddress(addr);
    dump(same); // expected to be true
}

// Test 7: forceBasechain() should fail if address is not on basechain
fun test_forceBasechain_fail() {
    // Create an address on the masterchain using newAddress
    let addr: Address = newAddress(-1, 0x11223344556677889900aabbccddeeff00112233445566778899aabbccddeeff);
    // Using forceBasechain on a masterchain address should throw an error with exit code 138
    try {
        dump(forceBasechain(addr));
    } catch (exitCode) {
        // Dump the exit code to confirm it matches exit code 138 as per documentation
        dump(exitCode);
    }
}

// Test 8: Construct an invalid address slice and ensure asAddress() fails
fun test_invalidAddress_fromSlice() {
    let basechainID = 0;
    // Construct a cell with an incorrect prefix (should be 0b100 for valid standard address) by using 0b010 instead
    let cell: Cell = beginCell()
        .storeUint(0b010, 3)  // Incorrect prefix
        .storeInt(basechainID, 8) 
        .storeUint(0, 256) // Valid size for account id, but prefix is wrong => invalid
        .endCell();
    let s: Slice = cell.beginParse();
    try {
        dump(s.asAddress(basechainID));
    } catch (exitCode) {
        // Expecting exit code 136 for invalid standard address
        dump(exitCode);
    }
}

// Test 9: Attempt to use newAddress() with an invalid chain id
fun test_newAddress_invalidChain() {
    // According to documentation, only -1 (masterchain) and 0 (basechain) are valid.
    // Using any other chain id should lead to a compile-time error. 
    // Since compile-time errors cannot be caught at runtime, this test is conceptual and cannot be executed.
    // Uncommenting the following lines should cause a compile-time error if strict checking is enabled.
    // let invalid: Address = newAddress(1, 0x0);
    // dump(invalid);
    dump(0); // Placeholder to denote test not executed at runtime
}

// Entry point: run all tests
fun main() {
    test_newAddress_valid();
    test_newAddress_masterchain();
    test_contractAddress_equality();
    test_asSlice_and_toString();
    test_BasechainAddress();
    test_hasSameBasechainAddress();
    test_forceBasechain_fail();
    test_invalidAddress_fromSlice();
    test_newAddress_invalidChain();
}
