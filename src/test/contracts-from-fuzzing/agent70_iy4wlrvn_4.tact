contract TestStrings {
    // Testing a long string to check error messages
    receive() {
        let longString: String = "This string is intentionally made very long to test the compiler's error handling capabilities. It should illustrate how output or error messages are handled when strings exceed the expected length limits. The string is designed to exceed any typical length expectation set forth in the specifications or documentation for the Tact language.";
    }
}