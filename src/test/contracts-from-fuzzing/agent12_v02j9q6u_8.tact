contract TestDel {
    m: map<Int, Int> = emptyMap();

    receive() {
        // Set two key-value pairs
        self.m.set(7, 123);
        self.m.set(42, 321);

        // Delete the entry with key 7
        let deletionSuccess1: Bool = self.m.del(7);
        dump(deletionSuccess1); // Expected: true

        // Try deleting key 7 again (non-existent now)
        let deletionSuccess2: Bool = self.m.del(7);
        dump(deletionSuccess2); // Expected: false

        // Delete key 42 using set with null
        self.m.set(42, null);
        let check42: Int? = self.m.get(42);
        dump(check42); // Expected: null
    }
}
