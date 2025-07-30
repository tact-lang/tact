contract SomeContract {
    // Minimal contract definition
    init() {}
}

fun testContractAddresses() {
    let s: StateInit = initOf SomeContract();
    let addr1: Address = contractAddress(s);
    let addr2: Address = contractAddressExt(0, s.code, s.data);
    addr1 == addr2;
}
