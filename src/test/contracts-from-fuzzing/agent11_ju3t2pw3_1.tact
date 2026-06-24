contract Test {
    // Test 1: Basic function-level return
    receive () {}

    get fun compute(): Int {
        if (1 == 1) {
            return 42;
        }
        return 0;
    }
}
