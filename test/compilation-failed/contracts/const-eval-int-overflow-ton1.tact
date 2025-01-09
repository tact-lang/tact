contract ConstEvalNegativeTest {
    get fun test_ton(): Int {
        // too many digits after the decimal point
        return ton("1.0123456789");
    }
}
