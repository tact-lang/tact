contract Dummy {}

fun testContractAddressDiffChain(): Bool {
    let s: StateInit = initOf Dummy();
    // Using contractAddress assumes workchain 0
    let addr1: Address = contractAddress(s);
    // Force a different chain id (-1 instead of 0) using contractAddressExt
    let addr2: Address = contractAddressExt(-1, s.code, s.data);
    return addr1 == addr2;  // Expected to be false
}
