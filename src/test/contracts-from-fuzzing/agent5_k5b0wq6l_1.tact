contract Test {
    receive() {
        dump(42);
        // Expect dump to print debug information for integer 42
    }
}
