contract TestReplace {
    m: map<Int, Int> = emptyMap();

    init() {
        self.m.set(7, 70);
        self.m.set(42, 42);

        // Replace existing key: should return true
        let r1: Bool = self.m.replace(7, 68);
        // Try to replace non-existing key: should return false
        let r2: Bool = self.m.replace(8, 68);
        
        // Replace with null for deletion: key exists, so should return true and delete the entry
        let r3: Bool = self.m.replace(42, null);

        // Dump the boolean results (for testing purposes)
        dump(r1);
        dump(r2);
        dump(r3);
    }

    receive() {
        // Try to access the values
        let x: Int = self.m.get(7)!!; // should be 68
        dump(x);

        // Check for deleted key 42
        if (self.m.exists(42)) {
            dump(999); // should not be dumped
        } else {
            dump(0);
        }
    }
}
