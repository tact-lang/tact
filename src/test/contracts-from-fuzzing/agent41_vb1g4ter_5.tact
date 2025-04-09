contract SomeContract {
    receive() {}
}

fun testContractAddressExtInvalid() : Address {
    let s: StateInit = initOf SomeContract();
    return contractAddressExt(1, s.code, s.data);
}

fun main() {
    let addr = testContractAddressExtInvalid();
}
