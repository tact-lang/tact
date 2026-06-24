contract TestMapIterationUpdate {
    // State variable map and a counter to track iterations
    m: map<Int, Int>;
    counter: Int;

    init() {
        self.m = emptyMap();
        self.m.set(1, 10);
        self.m.set(2, 20);
        self.m.set(3, 30);
        self.counter = 0;
    }

    // Non-get function to update the counter by iterating over the map
    fun updateCounter() {
        foreach (k, v in self.m) {
            self.counter = self.counter + 1;
        }
    }

    // A getter that triggers the update and returns the counter
    get fun test(): Int {
        self.updateCounter();
        return self.counter; // Expected: 3 if the loop iterates over all entries once
    }
}
