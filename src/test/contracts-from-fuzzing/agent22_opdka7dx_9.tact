contract TestAsCell {
    m: map<Int, Int>;
    n: map<Int, Int>;

    receive() {
        // Test asCell on an empty map, should return null
        self.m = emptyMap();
        let cellEmpty: Cell? = self.m.asCell();

        // Test asCell on a non-empty map, should return a non-null Cell
        self.n = emptyMap();
        self.n.set(1, 11);
        let cellNonEmpty: Cell? = self.n.asCell();

        if (cellEmpty == null && cellNonEmpty != null) {
            dump(1);
        } else {
            dump(0);
        }
    }
}
