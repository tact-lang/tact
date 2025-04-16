contract Dummy { }

fun testContractAddress() {
    let s = initOf Dummy();
    let a1: Address = contractAddress(s);
    let a2: Address = contractAddressExt(0, s.code, s.data);
    require(a1 == a2, "Mismatch");
}

fun main() {
    testContractAddress();
}
