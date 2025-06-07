contract Test {
    receive() {
        // Test a string literal using let instead of var
        let s: String = "Hello, Tact!";
        dump(s);
    }
}
