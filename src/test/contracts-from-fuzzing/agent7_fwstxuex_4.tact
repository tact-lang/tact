contract Test {
    // Map with key type Int and value type Int
    m: map<Int, Int> = emptyMap();

    receive() {
        // Set a value for key 4
        self.m.set(4, 40);
        // Check existence for key 4 (should exist) and key 5 (should not exist)
        if (self.m.exists(4)) {
            dump(1);
        } else {
            dump(0);
        }
        if (self.m.exists(5)) {
            dump(1);
        } else {
            dump(0);
        }
    }
}
