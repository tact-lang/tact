contract Test {
    receive() {
        // Testing let-statement with type inference
        let a = 123;
        dump(a);
    }
}
