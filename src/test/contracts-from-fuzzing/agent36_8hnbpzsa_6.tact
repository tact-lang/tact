contract Test {
    m: map<Int, Int>;

    receive() {
        self.m = emptyMap();
        self.m.set(2, 200);
        // Test if key 2 exists (should be true)
        if (self.m.exists(2)) {
            dump(1);
        } else {
            dump(0);
        }
        // Test if key 3 exists (should be false)
        if (self.m.exists(3)) {
            dump(1);
        } else {
            dump(0);
        }
    }
}
