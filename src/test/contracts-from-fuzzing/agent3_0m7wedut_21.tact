contract TestMapMutationDuringIteration {
    // Persistent state variable: map from Int to Int
    m: map<Int, Int> = emptyMap();

    init() {
        // Insert keys with initial values
        self.m.set(1, 10);
        self.m.set(2, 20);

        // Attempt to mutate the map during iteration
        foreach (k, v in self.m) {
            // Increase each value by 5
            self.m.set(k, v + 5);
        }
    }

    // Getter function to retrieve the mutated value
    get fun getVal(k: Int): Int? {
        return self.m.get(k);
    }
}
