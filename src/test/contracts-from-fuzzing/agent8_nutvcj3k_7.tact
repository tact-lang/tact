contract Test {
    receive() {
        // Test augmented assignment for Int addition
        let a: Int = 5;
        a += 3;
        dump(a); // expected: 8
    }
}
