contract Test {
    receive() {
        // Test compile-time ascii function on a string literal
        let a: Int = ascii("a");
        dump(a);
    }
}
