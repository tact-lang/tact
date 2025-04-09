contract Test {
    receive() {
        // Initialize map with two entries
        let m: map<Int, Int> = emptyMap();
        m.set(7, 70);
        m.set(42, 42);
        
        // Replace existing key
        let r1: Bool = m.replace(7, 68);
        dump(r1); // expected output: true

        // Attempt replacement on non-existent key
        let r2: Bool = m.replace(8, 68);
        dump(r2); // expected output: false

        // Replace with null to delete the entry
        let r3: Bool = m.replace(7, null);
        dump(r3); // expected output: true
    }
}
