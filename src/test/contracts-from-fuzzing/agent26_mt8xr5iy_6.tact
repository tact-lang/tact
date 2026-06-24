contract Test {
    receive() {
        // Test .replaceGet() on maps
        let m: map<Int, Int> = emptyMap();
        m.set(7, 70);
        m.set(42, 42);
        // Replace existing key: should return previous value
        let old1: Int? = m.replaceGet(7, 68); // expected to be 70
        // Attempt replacement on non-existent key: should return null
        let old2: Int? = m.replaceGet(8, 68); // expected to be null
        // Replace with null value deletes the key: should return previous value
        let old3: Int? = m.replaceGet(42, null); // expected to be 42
    }
}
