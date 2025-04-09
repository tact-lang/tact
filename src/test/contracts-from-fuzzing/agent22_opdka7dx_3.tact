contract Test {
    m: map<Int, Int>;

    receive() {
        self.m = emptyMap();
        self.m.set(1, 42);
        if (self.m.exists(1)) {
            dump(1);
        } else {
            dump(0);
        }
    }
}
