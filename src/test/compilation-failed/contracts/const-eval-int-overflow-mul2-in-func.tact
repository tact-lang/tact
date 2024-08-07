fun funcTest(): Int {
    // -(2 ** 256)
    let result = -115792089237316195423570985008687907853269984665640564039457584007913129639936;
    do {
        result *= 2;
    } until (false);
    return result;
}

contract ConstEvalNegativeTest {
    get fun something(): Int {
        return funcTest();
    }
}
