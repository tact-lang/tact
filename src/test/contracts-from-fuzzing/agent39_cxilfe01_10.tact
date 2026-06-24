contract TestDeepEquals {
    m1: map<Int, Int> = emptyMap();
    m2: map<Int, Int> = emptyMap();

    receive() {
        // Insert keys in one order in m1
        self.m1.set(1, 10);
        self.m1.set(2, 20);

        // Insert keys in reverse order in m2
        self.m2.set(2, 20);
        self.m2.set(1, 10);

        // deepEquals should return true as both maps have identical key-value pairs
        dump(self.m1.deepEquals(self.m2)); // Expected output: true

        // The equality operator '==' is shallow and may differ if serialization differs
        dump(self.m1 == self.m2); // Expected: could be false if underlying serialization differs

        // Additional check: iterate over keys
        let eq: Bool = true;
        foreach (k, v in self.m1) {
            eq = eq && (v == self.m2.get(k)!!);
        }
        dump(eq); // Expected output: true
    }
}
