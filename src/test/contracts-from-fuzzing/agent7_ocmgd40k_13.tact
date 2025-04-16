contract MapOrderTest {
    // Declare a map of Int keys to Int values
    m: map<Int, Int> = emptyMap();

    receive() {
        // Insert keys in non-sorted order
        self.m.set(10, 100);
        self.m.set(2, 200);
        self.m.set(7, 300);

        // Iterate over the map and sum all keys
        let total = 0;
        foreach (k, v in self.m) {
            total = total + k;
        }
        // According to the documentation, the iteration is in ascending order of keys,
        // so the keys are expected to be iterated as: 2, 7, 10, total = 19
        dump(total);
    }
}
