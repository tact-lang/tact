contract Test {
    receive() {
        // Test 4: Valid usage of map.del: delete existing and non-existing keys
        let mp: map<Int, Int> = emptyMap();
        mp.set(42, 321);
        let del1: Bool = mp.del(42); // expected: true
        let del2: Bool = mp.del(42); // expected: false
    }
}
