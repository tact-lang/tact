contract MapDeletionInForeachTest {
    receive() {
        // Test deleting map entries during iteration using foreach
        let m: map<Int, Int> = emptyMap();
        m.set(1, 100);
        m.set(2, 200);
        m.set(3, 300);
        foreach (k, v in m) {
            m.del(k);
        }
        dump(m.isEmpty()); // Expected output: true
    }
}
