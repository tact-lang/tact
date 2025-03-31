contract Dummy {
    init() {}
}

// Test valid masterchain address using newAddress with chain id -1
fun test_valid_masterchainAddress(): Address {
    return newAddress(-1, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
}

// Test hasSameBasechainAddress when comparing contract's basechain address with a masterchain address
// Expected to return false because hasSameBasechainAddress works only for basechain addresses
fun test_hasSameBasechainAddress_master(): Bool {
    let s: StateInit = initOf Dummy();
    let masterAddr: Address = test_valid_masterchainAddress();
    return s.hasSameBasechainAddress(masterAddr);
}
