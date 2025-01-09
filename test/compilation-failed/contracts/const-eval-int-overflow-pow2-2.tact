contract ConstEvalNegativeTest {
    get fun test_pow(): Int {
        // integer overflow
        return pow2(256);
    }
}
