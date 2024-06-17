contract ConstEvalNegativeTest {
    get fun something(): Int {
        // - (2 ** 256 + 1)
        // actually Tact does not have proper negative integer literals
        // there is a special case for a unary negation of positive literals hardcoded
        // into the const evaluator
        return -115792089237316195423570985008687907853269984665640564039457584007913129639937;
    }
}
