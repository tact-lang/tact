contract ConstEvalNegativeTest {
    get fun test_pow(): Int {
        // integer overflow
        return pow(-2, 256);
    }
}
