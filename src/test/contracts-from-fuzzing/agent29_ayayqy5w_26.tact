contract Test {
    receive() {
        // Test string literal with substring that looks like interpolation syntax
        // Documentation does not specify any interpolation mechanism, so "${name}" should be treated as literal text or rejected.
        // We expect the compiler to treat it as literal characters if allowed, otherwise cause a syntax error.
        let s: String = "Hello, ${name}!";
    }
}
