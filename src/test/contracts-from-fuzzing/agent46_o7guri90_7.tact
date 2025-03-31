contract TestMapDelete {
    m: map<Int, Int>;

    receive() {
        self.m = emptyMap();
        self.m.set(7, 123);
        self.m.set(42, 321);
        
        // Delete existing key 7
        let deleted1: Bool = self.m.del(7);
        dump(deleted1); // Expected: true

        // Try deleting same key again
        let deleted2: Bool = self.m.del(7);
        dump(deleted2); // Expected: false

        // Deleting key by setting null through .set() method
        self.m.set(42, null);
        let check: Int? = self.m.get(42);
        dump(check); // Expected: null
    }
}
