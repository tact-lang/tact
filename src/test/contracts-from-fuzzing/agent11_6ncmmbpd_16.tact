contract Test {
    receive() {
        // Test string equality and inequality
        dump("A" == "A"); // expected: true
        dump("A" != "B"); // expected: true
    }
}
