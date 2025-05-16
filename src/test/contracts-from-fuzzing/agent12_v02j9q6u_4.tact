contract Test {
    m: map<Int, Int> = emptyMap();

    receive() {
        // Valid usage: set a key-value pair using map.set
        self.m.set(1, 123);
    }
}
