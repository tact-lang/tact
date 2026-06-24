contract MapIterationOrderTest {
    receive() {
        // Create a map with keys inserted out of order
        let m: map<Int, Int> = emptyMap();
        m.set(42, 420);
        m.set(7, 70);
        m.set(19, 190);
        
        // Expected iteration order: keys in ascending order: 7, 19, 42
        // Dump the keys to verify the order
        foreach (k, v in m) {
            dump(k);
        }
    }
}
