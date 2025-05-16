contract TestReplace {
    receive() {
        // Test: replace() on map<Int, Int>
        let m: map<Int, Int> = emptyMap();
        m.set(7, 70);
        m.set(42, 42);

        let rep1: Bool = m.replace(7, 68); // key 7 exists, should return true and update value
        dump(rep1); // expecting dump(true)

        let rep2: Bool = m.replace(8, 68); // key 8 does not exist, should return false
        dump(rep2); // expecting dump(false)
    }
}
