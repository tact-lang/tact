contract SomeContract {}

fun testContractAddressExt(): Address {
    let s: StateInit = initOf SomeContract();
    return contractAddressExt(0, s.code, s.data);
}
