contract MapAsCellEmptyTest {
    receive() {
        // Test .asCell() on an empty map: since the map has no entries, .asCell() should return null
        let m: map<Int, Int> = emptyMap();
        dump(m.asCell()); // Expected output: null
    }
}
