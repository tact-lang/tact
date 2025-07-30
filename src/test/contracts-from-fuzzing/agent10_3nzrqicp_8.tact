contract TestDel {
    m: map<Int, Int> = emptyMap();

    init() {
        // Set two keys
        self.m.set(7, 123);
        self.m.set(8, 456);

        // Delete key 7: should succeed (true)
        let d1: Bool = self.m.del(7);
        dump(d1);

        // Attempt to delete key 7 again: should fail (false)
        let d2: Bool = self.m.del(7);
        dump(d2);

        // Delete key 8 using .set() with null
        self.m.set(8, null);
    }

    receive() {
        // Verify keys are deleted
        if (self.m.exists(7)) {
            dump(999); // Should not occur
        } else {
            dump(0);  // Expected dump: 0
        }
        if (self.m.exists(8)) {
            dump(999); // Should not occur
        } else {
            dump(0);  // Expected dump: 0
        }
    }
}
