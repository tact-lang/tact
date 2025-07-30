contract TestDeepEquals {
    receive() {
        // Test deepEquals: comparing two maps with identical entries
        let m: map<Int, Int> = emptyMap();
        let n: map<Int, Int> = emptyMap();
        m.set(1, 2);
        n.set(1, 2);
        let eq: Bool = m.deepEquals(n); // expected to be true
        // Also, shallow equality (==) should be true if the underlying serialization is identical
        let shallow: Bool = (m == n);
    }
}
