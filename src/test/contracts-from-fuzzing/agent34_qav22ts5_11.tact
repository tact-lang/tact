contract Test {
    receive (_: String) {
        dump(42);
    }
}
