contract TestMapAsCell {
    get fun test(): Int {
        // Test 1: when map is empty, asCell() should return null
        let m1: map<Int, Int> = emptyMap();
        let result1: Int = (m1.asCell() == null) ? 1 : 0;

        // Test 2: when map is non-empty, asCell() should not be null
        let m2: map<Int, Int> = emptyMap();
        m2.set(5, 500);
        let result2: Int = (m2.asCell() != null) ? 2 : 0;

        return result1 + result2; // expected value: 1 + 2 = 3
    }
}
