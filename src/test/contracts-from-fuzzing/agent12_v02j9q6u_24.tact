contract TestMapBoundaries {
    m: map<Int, Int> = emptyMap();

    receive() {
        // Test with key 0, negative key, and a large positive key
        self.m.set(0, 42);
        self.m.set(-100, 84);
        self.m.set(2147483647, 100);

        dump(self.m.get(0));          // Expected: 42
        dump(self.m.get(-100));       // Expected: 84
        dump(self.m.get(2147483647)); // Expected: 100
    }
}
