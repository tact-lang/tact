fun funcTest(): Int {
    repeat(5) {
        // - (2 ** 256 + 1)
        let i = -115792089237316195423570985008687907853269984665640564039457584007913129639937;
    }
    return 0;
}

contract ConstEvalNegativeTest {
    get fun something(): Int {
        return funcTest();
    }
}
