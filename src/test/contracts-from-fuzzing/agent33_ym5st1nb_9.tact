contract Test {
    // Test for compile-time function ton with a negative value string.
    // The documentation does not explicitly specify behavior for negative Toncoin values
    // Usage example provided only shows non-negative numbers.
    // Here, negative value is provided to test if it compiles or raises an error.
    const negativeTon: Int = ton("-1");

    receive() {}
}
