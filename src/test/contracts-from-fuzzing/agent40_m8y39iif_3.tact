contract Test {
    m: map<Int, Int>;

    receive() {
        self.m = emptyMap();
        self.m.set(42, 100);
    }
}
