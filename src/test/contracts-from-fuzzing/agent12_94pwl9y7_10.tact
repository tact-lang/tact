contract MapAsCellTest {
    // Test asCell method on maps

    // When the map is empty, asCell() should return null
    get fun testEmptyAsCell(): Int {
        let m: map<Int, Int> = emptyMap();
        if (m.asCell() == null) {
            return 1;
        } else {
            return 0;
        }
    }

    // When the map has values, asCell() should return a non-null Cell
    get fun testNonEmptyAsCell(): Int {
        let m: map<Int, Int> = emptyMap();
        m.set(7, 70);
        if (m.asCell() != null) {
            return 1;
        } else {
            return 0;
        }
    }
}
