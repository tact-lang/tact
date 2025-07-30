contract TestMapDeepEquals {
    dict1: map<Int, Int> = emptyMap();
    dict2: map<Int, Int> = emptyMap();

    receive() {
        // Set identical key-value pairs in both maps
        self.dict1.set(1, 10);
        self.dict1.set(2, 20);
        self.dict2.set(1, 10);
        self.dict2.set(2, 20);

        // Check deep equality: should be true
        dump(self.dict1.deepEquals(self.dict2)); // Expected: true

        // Change one key in second map
        self.dict2.set(2, 200);
        dump(self.dict1.deepEquals(self.dict2)); // Expected: false
    }
}
