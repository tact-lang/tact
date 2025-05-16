contract Test {
    receive() {
        // Test simple if-else statement
        if (2 + 2 == 4) {
            dump(1);
        } else {
            dump(2);
        }
    }
}
