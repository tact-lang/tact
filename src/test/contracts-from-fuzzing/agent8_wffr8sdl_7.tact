contract TestAsCell {
    // Test asCell on an empty map: should return null
    get fun testEmpty() : Bool {
        let m: map<Int, Int> = emptyMap();
        if (m.asCell() == null) {
            return true;
        } else {
            return false;
        }
    }

    // Test asCell on a non-empty map: should return a non-null Cell
    get fun testNonEmpty() : Int {
        let m: map<Int, Int> = emptyMap();
        m.set(42, 24);
        if (m.asCell() == null) {
            return -1; // error case
        }
        return m.get(42)!!;
    }
}
