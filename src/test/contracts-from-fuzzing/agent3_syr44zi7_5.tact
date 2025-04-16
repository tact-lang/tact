contract TestExists {
    myMap: map<Int, Int>;

    receive() {
        self.myMap = emptyMap();
        // Insert a key-value pair.
        self.myMap.set(5, 50);

        // Test .exists: key 5 should exist, key 10 should not exist.
        let exists5: Bool = self.myMap.exists(5);
        dump(exists5); // Expected output: true

        let exists10: Bool = self.myMap.exists(10);
        dump(exists10); // Expected output: false
    }
}
