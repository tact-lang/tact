contract TestTernaryAmbiguity {
    // Test the ambiguous ternary operator expression without extra parentheses
    // Expected behavior: should parse as: return a > b ? a : (b > c ? b : c);
    fun ternaryAmbiguous(a: Int, b: Int, c: Int): Int {
        return a > b ? a : b > c ? b : c;
    }
}
