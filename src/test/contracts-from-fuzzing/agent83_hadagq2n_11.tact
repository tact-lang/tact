contract TestContract {
    // Test compile-time ascii function with a string literal
    a: Int = ascii("Tact");

    receive() {
        // no runtime logic
    }
}
