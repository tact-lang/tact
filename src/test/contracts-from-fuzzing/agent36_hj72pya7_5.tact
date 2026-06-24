contract SomeContract {}

fun testAddressEquality(): Bool {
    let s: StateInit = initOf SomeContract();
    let a1: Address = contractAddress(s);
    let a2: Address = contractAddressExt(0, s.code, s.data);
    return a1 == a2;
}
