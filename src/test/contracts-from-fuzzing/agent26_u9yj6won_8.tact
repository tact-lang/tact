contract Dummy {}

fun testContractHash() : Int {
    let s: StateInit = initOf Dummy();
    return contractHash(s.code, s.data);
}
