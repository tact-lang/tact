contract TestExists {
    m: map<Int, Int> = emptyMap();

    init() {
        // Set up map entries
        self.m.set(10, 100);
        self.m.set(20, 200);

        // Test .exists() and .isEmpty()
        dump(self.m.exists(10));    // Expected: true
        dump(self.m.exists(15));    // Expected: false
        dump(self.m.isEmpty());     // Expected: false
    }

    receive() {
        if (self.m.exists(10)) {
            dump(1);
        } else {
            dump(0);
        }
        if (self.m.exists(15)) {
            dump(999);
        } else {
            dump(0);
        }
    }
}
