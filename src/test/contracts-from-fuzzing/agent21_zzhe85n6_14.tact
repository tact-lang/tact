contract TestAsCell {
    receive() {
        // Test asCell(): converting map to underlying Cell

        // Case 1: Empty map should return null via asCell()
        let m: map<Int, Int> = emptyMap();
        let cellEmpty: Cell? = m.asCell();
        // cellEmpty is expected to be null

        // Case 2: Non-empty map: asCell() should return a Cell
        m.set(1, 100);
        m.set(2, 200);
        let cellNonEmpty: Cell? = m.asCell();
        // cellNonEmpty is expected to be not null
    }
}
