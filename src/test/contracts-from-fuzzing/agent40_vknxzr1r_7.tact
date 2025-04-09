contract Dummy {}

fun testContractAddressExt(): Bool {
    let s: StateInit = initOf Dummy();
    let addr1: Address = contractAddress(s);
    let addr2: Address = contractAddressExt(0, s.code, s.data);
    return addr1 == addr2; // Should yield true
}

fun main() {
    testContractAddressExt();
    return;
}
