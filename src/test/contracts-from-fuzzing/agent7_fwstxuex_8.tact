contract TestAsCell {
    // Test for .asCell() on an empty and non-empty map
    m: map<Int, Int> = emptyMap();

    receive() {
        // When map is empty, asCell() should return null
        let cellEmpty: Cell? = self.m.asCell();
        if (cellEmpty == null) {
            dump(1); // expected output: 1
        } else {
            dump(0);
        }

        // Set a value, now map is non-empty
        self.m.set(3, 300);
        let cellNonEmpty: Cell? = self.m.asCell();
        if (cellNonEmpty == null) {
            dump(0);
        } else {
            dump(1); // expected output: 1
        }
    }
}
