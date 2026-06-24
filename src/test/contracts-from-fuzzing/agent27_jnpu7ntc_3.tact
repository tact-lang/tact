contract Test {
    receive() {
        // Test map.get() with existing and non-existing keys for map<Int, Int>
        let m: map<Int, Int> = emptyMap();
        m.set(5, 55);
        let existing: Int? = m.get(5); // should be 55
        let nonExisting: Int? = m.get(6); // should be null
        dump(existing);
        dump(nonExisting);
    }
}
