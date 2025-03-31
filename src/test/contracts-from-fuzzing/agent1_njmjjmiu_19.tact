contract MapModificationInForeachTest {
    receive() {
        // Test modifying a map during a foreach iteration.
        // This snippet checks whether updating an element inside a foreach loop works.
        let m: map<Int, Int> = emptyMap();
        m.set(1, 10);
        m.set(2, 20);
        foreach (k, v in m) {
            // Modify each value by incrementing
            m.set(k, v + 1);
        }
        dump(m.get(1)!!); // Expected output: 11
        dump(m.get(2)!!); // Expected output: 21
    }
}
