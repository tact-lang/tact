contract TestAsCell {
    receive() {
        // Test asCell(): if map is empty, asCell() returns null
        let m: map<Int, Int> = emptyMap();
        dump(m.asCell()); // expecting null

        // After inserting an entry, asCell() should yield a non-null Cell
        m.set(1, 10);
        dump(m.asCell());
    }
}
