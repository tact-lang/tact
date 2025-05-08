contract Dummy {}

fun testEquality(): Int {
    let s = initOf Dummy();
    let a1 = contractAddress(s);
    let a2 = contractAddressExt(0, s.code, s.data);
    // Compare the slice representations
    return (a1.asSlice() == a2.asSlice()) ? 1 : 0;
}

fun main(): Int {
    return testEquality();
}
