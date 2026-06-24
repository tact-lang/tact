contract Dummy {}

fun testContractAddress() {
    let s: StateInit = initOf Dummy();
    let addr1: Address = contractAddress(s);
    let addr2: Address = contractAddressExt(0, s.code, s.data);
    require(addr1 == addr2, "Addresses do not match");
}
