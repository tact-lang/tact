contract TestNegativeTon() {
    // This contract tests the compile-time evaluation of ton with a negative input.
    // We expect the compiler to reject negative ton values.
    get fun test(): Int {
         return ton("-1");
    }
}
