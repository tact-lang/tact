contract ConstEvalNegativeTest {
    get fun test_pow(): Int {
        // negative exponent
        return pow2(-42);
    }
}
