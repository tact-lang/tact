contract TestForeachDiscard {
    m: map<Int, Int> = emptyMap();

    receive() {
        // Populate the persistent map
        self.m.set(1, 100);
        self.m.set(2, 200);
        self.m.set(3, 300);
        
        // Iterate over the map, discarding keys, summing only values
        let sum: Int = 0;
        foreach (_, v in self.m) {
            sum += v;
        }
        
        // Expected output: 600 (100 + 200 + 300)
        dump(sum);
    }
}
