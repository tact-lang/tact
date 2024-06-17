contract ConstEvalNegativeTest {
    get fun something(): Int {
        // 2 * -(2 ** 256)
        return 2 * -115792089237316195423570985008687907853269984665640564039457584007913129639936;
    }
}
