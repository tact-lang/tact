contract Test {
    receive() {
        // Test 3: Valid usage of map.replace on existing and non-existing keys
        let mp: map<Int, Int> = emptyMap();
        mp.set(7, 70);
        let replaced1: Bool = mp.replace(7, 68); // should be true and update value
        let replaced2: Bool = mp.replace(8, 68); // should be false as key 8 does not exist
    }
}
