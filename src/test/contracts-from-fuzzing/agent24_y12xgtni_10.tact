contract Test {
    // Test compile-time function ton with a negative value
    // Expected: Compilation error because negative toncoin values are not allowed
    n: Int = ton("-1");

    // Dummy receive function
    receive () {}
}
