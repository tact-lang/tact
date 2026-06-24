contract Test {
    m: map<Int, Int> = emptyMap();

    receive() {
        // Set a key-value pair
        self.m.set(100, 456);

        // Retrieve existing key
        let got1: Int? = self.m.get(100);
        // Retrieve non-existent key, should yield null
        let got2: Int? = self.m.get(200);

        // Dump the values for runtime inspection
        dump(got1); // Expected: Some(456)
        dump(got2); // Expected: null
    }
}
