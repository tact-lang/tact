contract Test {
    // Map with key type Int and value type Int
    m: map<Int, Int> = emptyMap();

    receive() {
        // Set initial values
        self.m.set(7, 70);
        self.m.set(42, 42);

        // Replace existing key 7 with 68, should return true
        let r1: Bool = self.m.replace(7, 68);
        dump(r1); // expected output: 1 (true)

        // Attempt to replace non-existing key 8, should return false
        let r2: Bool = self.m.replace(8, 68);
        dump(r2); // expected output: 0 (false)

        // Replace existing key 42 with null, should delete the entry and return true
        let r3: Bool = self.m.replace(42, null);
        dump(r3); // expected output: 1 (true)

        // Check that key 42 no longer exists
        let exists42: Bool = self.m.exists(42);
        dump(exists42); // expected output: 0 (false)
    }
}
