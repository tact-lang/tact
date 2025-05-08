contract Test {
    receive() {
        // Testing map.asCell on empty and non-empty maps

        // Case 1: Empty map; asCell() should return null
        let m: map<Int, Int> = emptyMap();
        let cellEmpty = m.asCell();
        dump(cellEmpty); // Expected to dump null

        // Case 2: Non-empty map; asCell() should return a Cell (non-null)
        m.set(1, 42);
        let cellNonEmpty = m.asCell();
        dump(cellNonEmpty); // Expected to dump a non-null Cell representation
    }
}
