contract Test {
    receive() {
        // Test empty string literal
        let s_empty: String = "";
        let s_nonempty: String = "non-empty";
        // Test string equality. Although operator "==" may work if string equality is supported.
        let eq: Bool = s_empty == "";
    }
}
