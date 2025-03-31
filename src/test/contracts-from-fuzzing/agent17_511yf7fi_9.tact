contract TestMapAsCell {
    receive() {
        let m: map<Int, Int> = emptyMap();
        m.set(1, 2);
        m.set(2, 4);
        let cell: Cell? = m.asCell();
    }
}
