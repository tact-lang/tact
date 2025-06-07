contract SomeContract {
    receive() {}
}

fun testContractAddress() : Bool {
    let s: StateInit = initOf SomeContract();
    let addr1: Address = contractAddress(s);
    let addr2: Address = contractAddressExt(0, s.code, s.data);
    return addr1 == addr2;
}

fun main() {
    let eq = testContractAddress();
}
