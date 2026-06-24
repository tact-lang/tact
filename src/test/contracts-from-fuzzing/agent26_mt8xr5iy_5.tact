contract Test {
    receive() {
        // Test .replace() on maps
        let m: map<Int, Int> = emptyMap();
        m.set(7, 70);
        // Replacing existing key should return true
        let rep1: Bool = m.replace(7, 68);
        // Replacing non-existent key returns false
        let rep2: Bool = m.replace(8, 68);
        // Replacing with null deletes the key (if exists) and returns true
        let rep3: Bool = m.replace(7, null);
    }
}
