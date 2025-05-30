contract Test {
    m: map<Int, Int> = emptyMap();

    receive() {
        // Setup: assign values to keys 7 and 42
        self.m.set(7, 70);
        self.m.set(42, 42);

        // Replace existing key (7) with new value 68; should return true
        let r1: Bool = self.m.replace(7, 68);
        dump(r1); // Expected output: true

        // Attempt to replace a non-existent key (8); should return false
        let r2: Bool = self.m.replace(8, 68);
        dump(r2); // Expected output: false

        // Verify key 7 now holds 68
        let v1: Int? = self.m.get(7);
        dump(v1!!); // Expected output: 68

        // Replace existing key (42) with null to delete it; should return true
        let r3: Bool = self.m.replace(42, null);
        dump(r3); // Expected output: true

        // Verify key 42 is deleted (get returns null)
        let v2: Int? = self.m.get(42);
        if(v2 == null) { dump(0); } else { dump(1); } // Expected output: 0
    }
}
