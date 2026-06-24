contract TestForeach {
    m: map<Int, Int> = emptyMap();

    receive() {
        // Populate the map
        self.m.set(1, 10);
        self.m.set(2, 20);
        self.m.set(3, 30);
        
        // Iterate over map entries normally
        let sum: Int = 0;
        foreach (key, value in self.m) {
            sum += value;
        }
        dump(sum); // Expect 60
        
        // Iterate discarding keys
        let sum2: Int = 0;
        foreach (_, value in self.m) {
            sum2 += value;
        }
        dump(sum2); // Expect 60
        
        // Iterate discarding values
        let counter: Int = 0;
        foreach (key, _ in self.m) {
            counter += 1;
        }
        dump(counter); // Expect 3
    }
}
