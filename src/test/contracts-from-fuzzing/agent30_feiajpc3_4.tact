contract SomeContract {
    // Minimal contract with no state variables
}

fun test_newAddress_valid() {
    // Using valid workchain id (0) and sample hash
    let addr: Address = newAddress(0, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
    dump(addr);
}

fun test_newAddress_validMasterchain() {
    // Using valid masterchain id (-1) and sample hash
    let addrMaster: Address = newAddress(-1, 0x11223344556677889900aabbccddeeff00112233445566778899aabbccddeeff);
    dump(addrMaster);
}

fun test_contractAddress_equality() {
    // Obtain the StateInit of SomeContract
    let s: StateInit = initOf SomeContract();
    let addr_from_contract: Address = contractAddress(s);
    let addr_from_ext: Address = contractAddressExt(0, s.code, s.data);
    dump(addr_from_contract);
    dump(addr_from_ext);
    dump(addr_from_contract == addr_from_ext);
}

fun test_asSlice_and_toString() {
    // Create an address and compare its slice form
    let a: Address = newAddress(0, 0xAABBCCDDEEFF00112233445566778899AABBCCDDEEFF00112233445566778899);
    let s1: Slice = beginCell().storeAddress(a).asSlice();
    let s2: Slice = a.asSlice();
    dump(s1 == s2);
    
    // Test converting address to string
    let str: String = a.toString();
    dump(str);
}

fun test_BasechainAddress() {
    // Test empty basechain address
    let emptyBc: BasechainAddress = emptyBasechainAddress();
    dump(emptyBc.hash == null);

    // Test newBasechainAddress with non-null hash
    let newBc: BasechainAddress = newBasechainAddress(0xDEADBEEF);
    dump(newBc.hash != null);
}

fun test_hasSameBasechainAddress() {
    // Retrieve the StateInit for SomeContract
    let s: StateInit = initOf SomeContract();
    // Simulate sender as the contract's basechain address
    let addr: Address = contractAddress(s);
    let same: Bool = s.hasSameBasechainAddress(addr);
    dump(same);
}

fun main() {
    test_newAddress_valid();
    test_newAddress_validMasterchain();
    test_contractAddress_equality();
    test_asSlice_and_toString();
    test_BasechainAddress();
    test_hasSameBasechainAddress();
}
