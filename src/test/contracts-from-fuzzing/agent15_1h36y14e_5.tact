contract Test {
    receive() {}

    get fun test(): Int {
        // Test modulo operator: according to documentation, -1 % 5 equals 4
        return -1 % 5;
    }
}
