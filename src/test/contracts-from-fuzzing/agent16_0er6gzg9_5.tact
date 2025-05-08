contract Test {
    receive() {
        // Test map.isEmpty on an empty map
        let m: map<Int, Int> = emptyMap();
        dump(m.isEmpty()); // Expected to dump true
    }
}
