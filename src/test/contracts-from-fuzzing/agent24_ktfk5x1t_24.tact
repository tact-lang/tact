contract MapIteration {
    // Persistent map state variable
    m: map<Int, Int>;

    init() {
        // Initializing the map with a few entries
        self.m = emptyMap();
        self.m.set(1, 10);
        self.m.set(2, 20);
        self.m.set(3, 30);
    }
    
    receive() {
        let total: Int = 0;
        // Iterate over the map stored in contract state using a foreach loop
        foreach (k, v in self.m) {
            total = total + k + v;
        }
        // Use the computed sum in an expression so it's not unused
        let _ = total * 1;
        return;
    }
}
