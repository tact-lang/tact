contract SomeContract {}

fun testContractHash(): Int {
    let s: StateInit = initOf SomeContract();
    return contractHash(s.code, s.data);
}
