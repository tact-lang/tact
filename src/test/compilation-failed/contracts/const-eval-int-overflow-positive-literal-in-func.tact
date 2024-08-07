fun funcTest(): Int {
    while (true) {
        // 2 ** 256
        let i = 115792089237316195423570985008687907853269984665640564039457584007913129639936;
    }
    return 0;
}

contract ConstEvalNegativeTest {
    get fun something(): Int {
        return funcTest();
    }
}
