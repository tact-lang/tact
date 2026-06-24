contract TestExists {
    receive() {
        // Test the .exists() method on a map<Int, Int>
        let m: map<Int, Int> = emptyMap();
        m.set(4, 200);
        // Check for an existing key
        let exists4: Bool = m.exists(4);
        // Check for a non-existing key
        let exists5: Bool = m.exists(5);
        dump(exists4); // Expected output: true
        dump(exists5); // Expected output: false
    }
}
