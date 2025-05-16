contract TestAsCell {
    m: map<Int, Int> = emptyMap();

    // init tests the behavior of asCell() on an empty map
    init() {
        // On an empty map, asCell() should return null
        if (self.m.asCell() == null) {
            dump(1); // Expected to dump 1
        } else {
            dump(0);
        }
        // Now set a value
        self.m.set(10, 500);
    }

    // receive tests the behavior of asCell() after adding an entry
    receive() {
        if (self.m.asCell() == null) {
            dump(0);
        } else {
            dump(2); // Expected to dump 2
        }
    }
}
