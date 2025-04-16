contract Test {
    receive() {
        // Test basic map operations: emptyMap, set, exists, and get
        let m: map<Int, Int> = emptyMap();
        m.set(1, 100);
        if (m.exists(1)) {
            let value: Int? = m.get(1);
        }
    }
}
