contract MapForeachUnderscoreTest {
    receive() {
        // Test foreach loop by discarding the key and dumping each value
        let m: map<Int, Int> = emptyMap();
        m.set(1, 100);
        m.set(2, 200);
        m.set(3, 300);
        foreach (_, v in m) {
            dump(v); // Expected outputs: 100, 200, 300 (in key order)
        }
    }
}
