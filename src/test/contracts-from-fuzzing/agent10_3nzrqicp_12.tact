contract TestMapIteration {
    m: map<Int, Bool> = emptyMap();

    init() {
        // Insert entries in unsorted order; iteration is expected to traverse in key-sorted order
        self.m.set(2, true);
        self.m.set(1, false);
        self.m.set(3, true);
    }

    receive() {
        // Dump keys, expecting order: 1, 2, 3
        foreach (key, val in self.m) {
            dump(key);
        }
    }
}
