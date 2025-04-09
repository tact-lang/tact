contract SomeContract {}

fun testContractAddress(): Address {
    let s: StateInit = initOf SomeContract();
    return contractAddress(s);
}
