contract TestMapEquality() {
    fun run() {
        let m1: map<Int, Int> = emptyMap();
        let m2: map<Int, Int> = emptyMap();
        // According to documentation, two empty maps should be equal
        dump(m1 == m2); // Expected: true
        dump(!(m1 != m2)); // Expected: true (i.e. not unequal)
    }
    receive() {
        self.run();
    }
}
