contract TestMapIterationOrder {
    // Persistent state map from Int to Int
    m: map<Int, Int> = emptyMap();
    // Persistent state variable to record the last (i.e. greatest) key encountered during iteration
    last: Int = 0;

    init() {
        // Insert keys in unsorted order; the map should iterate over keys in sorted order (smallest to largest)
        self.m.set(10, 100);
        self.m.set(3, 30);
        self.m.set(7, 70);
    }

    // Function to update 'last' with the key value during iteration
    fun updateOrder() {
        // Initialize last to a sentinel value lower than any expected key
        self.last = -1000;
        foreach (k, v in self.m) {
            self.last = k;
        }
    }

    // Getter function to retrieve the last key after updateOrder has been executed
    get fun getLast(): Int {
        return self.last;
    }
}
