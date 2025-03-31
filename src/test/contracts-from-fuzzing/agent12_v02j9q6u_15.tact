contract TestMapAsCell {
    m: map<Int, Int> = emptyMap();

    receive() {
        // When map is empty, asCell() should yield null
        dump(self.m.asCell()); // Expected: null

        // Add a key-value pair
        self.m.set(5, 555);
        let c: Cell? = self.m.asCell();
        if (c != null) {
            dump("Cell is non-null");
        } else {
            dump("Cell is null");
        }
    }
}
