contract Test {
    receive() {
        // Test 3: ReplaceGet on map
        let m: map<Int, Int> = emptyMap();
        m.set(7, 70);
        m.set(42, 42);

        // Replace existing key should return the old value
        let oldVal1: Int? = m.replaceGet(7, 68); // expected to return 70

        // Replacing a non-existent key should return null
        let oldVal2: Int? = m.replaceGet(8, 68); // expected to return null

        // Replacing with null should delete the entry and return old value
        let oldVal3: Int? = m.replaceGet(42, null); // expected to return 42 and delete key 42

        // Check that key 42 is indeed deleted
        let exists42: Bool = m.exists(42); // expected to be false
    }
}
