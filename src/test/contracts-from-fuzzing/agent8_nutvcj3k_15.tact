contract Test {
    receive() {
        // Testing optional variable assignment
        let a: Int? = null;
        a = 42;
        dump(a); // Expected output: 42
    }
}
