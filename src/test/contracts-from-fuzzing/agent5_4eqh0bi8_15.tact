contract MapForeachDiscardTest {
    m: map<Int, Int> = emptyMap();

    receive() {
        // Insert several key-value pairs
        self.m.set(1, 10);
        self.m.set(2, 20);
        self.m.set(3, 30);

        // Iterate over the map, discarding the keys and only dumping values
        foreach (_, value in self.m) {
            dump(value);
        }
    }
}
