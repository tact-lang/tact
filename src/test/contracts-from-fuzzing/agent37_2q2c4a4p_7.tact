contract TestMapDeepEquals {
    receive() {
        // Create two maps with same key-value pairs inserted in different orders
        let m1: map<Int, Int> = emptyMap();
        let m2: map<Int, Int> = emptyMap();
        m1.set(1, 100);
        m1.set(2, 200);
        m2.set(2, 200);
        m2.set(1, 100);
        // deepEquals should return true even if underlying serialization differs
        let deq: Bool = m1.deepEquals(m2);
        dump(deq); // expected: true
        // Shallow equality operator may return false if serialization hashes differ
        let se: Bool = (m1 == m2);
        dump(se); // expected: possibly false
    }
}
