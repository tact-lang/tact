contract TestMapAsCell {
    receive() {
        // Start with an empty map
        let m: map<Int, Int> = emptyMap();
        // asCell() on an empty map should yield null
        let c1: Cell? = m.asCell();
        if (c1 == null) {
            dump(1); // expected to dump 1 for empty map
        } else {
            dump(0);
        }
        
        // Now, set a value in the map
        m.set(10, 100);
        // asCell() should now produce a non-null cell representation of the map
        let c2: Cell? = m.asCell();
        if (c2 == null) {
            dump(0);
        } else {
            dump(2); // expected to dump 2 for non-empty map
        }
    }
}
