contract TestForeach {
    myMap: map<Int, Int>;

    receive() {
        self.myMap = emptyMap();
        // Inserting multiple key-value pairs
        self.myMap.set(1, 10);
        self.myMap.set(2, 20);
        self.myMap.set(3, 30);

        // Iterating over the map entries, dumping keys and values
        foreach (key, value in self.myMap) {
            dump(key);   // Expected output: keys in ascending order (1, 2, 3)
            dump(value); // Expected output: corresponding values (10, 20, 30)
        }

        // Iterating and only capturing keys using underscore for value
        foreach (k, _ in self.myMap) {
            dump(k); // Expected: 1, 2, 3
        }
    }
}
