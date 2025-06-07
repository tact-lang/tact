contract TestMapAsCell {
    receive() {
        // Test the .asCell() conversion for maps
        // Initially, an empty map should return null when converted to Cell
        let m: map<Int, Int> = emptyMap();
        let c: Cell? = m.asCell();
        // Dump 1 if c is null (as expected), otherwise dump 0
        if (c == null) {
            dump(1);
        } else {
            dump(0);
        }
        
        // After setting a value, asCell() should return a non-null cell
        m.set(1, 10);
        let c2: Cell? = m.asCell();
        if (c2 != null) {
            dump(2);
        } else {
            dump(0);
        }
    }
}
