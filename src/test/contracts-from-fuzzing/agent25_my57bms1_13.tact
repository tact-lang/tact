contract TestMapPersistent {
    // Persistent state variable: a map from Int to Bool
    fizz: map<Int, Bool>;

    // Init function to explicitly assign empty map (although persistent maps are empty by default)
    init() {
        self.fizz = emptyMap();
    }

    receive() {
        // Set key 1 to value true
        self.fizz.set(1, true);
        // Retrieve the value for key 1
        let b: Bool? = self.fizz.get(1);
        dump(b); // Expected output: Some(true)
    }
}
