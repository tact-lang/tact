contract TestMapAsCell {
    dict: map<Int, Int> = emptyMap();

    receive() {
        // When the map is empty, asCell() should return null
        let cell_empty: Cell? = self.dict.asCell();
        dump(cell_empty);

        // After inserting an entry, asCell() should return a non-null Cell
        self.dict.set(1, 42);
        let cell_non_empty: Cell? = self.dict.asCell();
        dump(cell_non_empty);
    }
}
