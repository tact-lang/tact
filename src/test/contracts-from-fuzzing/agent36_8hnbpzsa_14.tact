contract TestAsCell {
    m: map<Int, Int>;

    receive() {
        self.m = emptyMap();
        self.m.set(1, 10);
        let c: Cell? = self.m.asCell();
        if (c == null) {
            dump(0); // expected 0 if asCell returns null when non-empty? Actually, since m has an entry, asCell() should return a non-null cell.
        } else {
            dump(1); // expected 1
        }
    }
}
