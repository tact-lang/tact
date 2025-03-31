contract TestAsCell {
    state: map<Int, Int>;

    receive() {
        // Initialize map to empty
        self.state = emptyMap();

        // asCell() should return null for empty map
        let cellEmpty = self.state.asCell();
        dump(cellEmpty); // expected: null

        // Insert a value
        self.state.set(1, 10);

        // asCell() should now return a non-null cell representation
        let cellNonEmpty = self.state.asCell();
        dump(cellNonEmpty); // expected: non-null cell
    }
}
