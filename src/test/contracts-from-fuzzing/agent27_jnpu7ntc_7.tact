contract TestDeepEquals {
    receive() {
        // Test deepEquals() method for map<Int, Int>
        let m1: map<Int, Int> = emptyMap();
        let m2: map<Int, Int> = emptyMap();
        m1.set(1, 100);
        m2.set(1, 100);
        // Both maps have one identical entry
        dump(m1.deepEquals(m2)); // expecting dump(true)

        // Modify second map: add extra entry
        m2.set(2, 200);
        dump(m1.deepEquals(m2)); // expecting dump(false)
    }
}
