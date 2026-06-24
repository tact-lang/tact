contract MapAsCellTest {
    m: map<Int, Int> = emptyMap();

    receive() {
        // Initially, converting an empty map should yield null
        let cell_empty: Cell? = self.m.asCell();
        dump(cell_empty == null);
        
        // Insert a key-value pair, then convert to a Cell
        self.m.set(1, 100);
        let cell_nonempty: Cell? = self.m.asCell();
        dump(cell_nonempty != null);
    }
}
