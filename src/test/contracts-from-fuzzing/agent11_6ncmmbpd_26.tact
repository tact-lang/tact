contract Test {
    receive() {
        // Test nested if-else chain
        if (2 + 2 == 5) {
            dump(10);
        } else if (3 > 2) {
            dump(20);
        } else {
            dump(30);
        }
    }
}
