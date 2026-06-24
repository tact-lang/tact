contract Test {
    receive() {
        // Test 5: Valid usage of map.replaceGet on existing and non-existing keys
        let mp: map<Int, Int> = emptyMap();
        mp.set(7, 70);
        mp.set(42, 42);
        let oldVal1: Int? = mp.replaceGet(7, 68); // Expected: 70, and key 7 now maps to 68
        let oldVal2: Int? = mp.replaceGet(8, 68); // Expected: null, key 8 doesn't exist
    }
}
