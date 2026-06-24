contract Test {
    receive() {
        // Testing dump with a Builder (beginCell returns a builder)
        dump(beginCell());
    }
}
