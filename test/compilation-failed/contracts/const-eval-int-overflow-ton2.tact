contract ConstEvalNegativeTest {
    get fun test_ton(): Int {
        // the number of tons does not fit TVM int
        return ton("115792089237316195423570985008687907853269984665640564039457584007913.129639936");
    }
}
