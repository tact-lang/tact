contract Test {
    receive() {
        // Test 2: Test map.get on existing and non-existing keys
        let mp: map<Int, Int> = emptyMap();
        mp.set(10, 99);
        let value: Int? = mp.get(10);   // should be 99
        let missing: Int? = mp.get(20);   // should be null
    }
}
