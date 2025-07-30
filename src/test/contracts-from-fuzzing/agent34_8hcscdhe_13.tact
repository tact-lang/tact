contract Test {
    receive() {
        // Test map.asCell() for empty and non-empty maps
        let m: map<Int, Int> = emptyMap();
        // When map is empty, asCell() should return null
        dump(m.asCell() == null);

        // After inserting a value, asCell() should not return null
        m.set(2, 20);
        dump(m.asCell() != null);
    }
}
