contract Test {
    receive() {
        // Test: Comparing two string literals for equality
        let a: String = "abc";
        let b: String = "abc";
        dump(a == b); // Expect output: true
    }
}
