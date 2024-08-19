fun functionTest(): Int {
    // -(2 ** 256)
    let i = -115792089237316195423570985008687907853269984665640564039457584007913129639936;
    repeat (i - 1) {  // Causes an overflow error
        // do nothing
    }
    return i;
}

contract ConstEvalNegativeTest {
    get fun something(): Int {
        return functionTest();
    }
}
