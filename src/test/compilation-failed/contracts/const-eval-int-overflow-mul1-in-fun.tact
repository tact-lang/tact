fun functionTest(): Int {
    // (2 ** 256 - 1)
    let result = 115792089237316195423570985008687907853269984665640564039457584007913129639935;
    repeat(5) {
        result *= 2;
    }
    return result;
}

contract ConstEvalNegativeTest {
    get fun something(): Int {
        return functionTest();
    }
}
