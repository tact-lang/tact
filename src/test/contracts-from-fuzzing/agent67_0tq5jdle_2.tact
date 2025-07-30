contract Test {
    receive() {
        // Testing let statement and assignment
        let x: Int = 42;
        x = x + 8;
        dump(x);
    }
}
