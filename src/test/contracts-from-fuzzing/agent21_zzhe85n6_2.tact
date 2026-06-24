contract Test {
    receive() {
        // Test 1: Basic map set and get
        let m: map<Int, Int> = emptyMap();
        m.set(10, 20);
        let exists: Bool = m.exists(10);
        let maybe: Int? = m.get(10);
        let res: Int = maybe != null ? maybe!! : -1;
        // Expected: res == 20
    }
}
