contract TestAsCell {
    m: map<Int, Int> = emptyMap();

    receive() {
        // Initially, map is empty so asCell() should return null
        if (self.m.asCell() == null) {
            dump(0); // expect 0
        } else {
            dump(1);
        }
        
        // Set a value so that map becomes non-empty
        self.m.set(1, 10);
        let c: Cell? = self.m.asCell();

        // If asCell() returns a non-null cell for a non-empty map
        if (c == null) {
            dump(2);
        } else {
            dump(3); // expect 3
        }
    }
}
