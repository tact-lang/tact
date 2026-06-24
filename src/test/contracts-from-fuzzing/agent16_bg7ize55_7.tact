contract TestCells {
    // Test: dump with various cell-related types and maps
    receive() {
        // Dumping Cell, Builder, and Slice
        dump(emptyCell());  // Should dump a Cell type
        dump(beginCell());  // Should dump a Builder type
        dump(emptySlice()); // Should dump a Slice type

        // Dumping a map
        let m: map<Int, Int> = emptyMap();
        m.set(4, 4);
        dump(m);
    }
}
