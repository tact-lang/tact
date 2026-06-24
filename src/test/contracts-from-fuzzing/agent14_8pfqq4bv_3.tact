contract TestLet {
    receive() {
        // Test let statement with explicit type and inferred type
        let a: Int = 10;
        dump(a);

        let b = 20;
        dump(b);
    }
}
