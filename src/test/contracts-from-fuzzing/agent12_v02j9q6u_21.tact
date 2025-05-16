contract TestForeachDiscard {
    m: map<Int, Int> = emptyMap();

    receive() {
        // Setting entries
        self.m.set(1, 10);
        self.m.set(2, 20);

        // Discarding keys, iterating over values
        foreach (_, v in self.m) {
            dump(v); // Expected outputs: 10, then 20 (in key ascending order)
        }
    }
}
