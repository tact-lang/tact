contract Test {
    receive() {}

    get fun test(): Int {
        return 1 / -5; // Expected result: -1 per documentation
    }
}
