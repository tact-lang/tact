contract MapOrderTest {
    m: map<Int, Int> = emptyMap();

    receive() {
        // Insert keys out of order
        self.m.set(10, 100);
        self.m.set(3, 30);
        self.m.set(15, 150);

        // Iterate over the map and dump keys to verify they are output in increasing order
        foreach (k, v in self.m) {
            dump(k); // Expected order: 3, then 10, then 15
        }
    }
}
