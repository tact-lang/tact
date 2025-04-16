contract TestReplaceGet {
    myMap: map<Int, Int>;

    receive() {
        self.myMap = emptyMap();
        // Initialize the map with two key-value pairs
        self.myMap.set(7, 70);
        self.myMap.set(42, 42);

        // Test .replaceGet: replacing key 7 should return the old value
        let old1: Int? = self.myMap.replaceGet(7, 68);
        dump(old1); // Expected output: 70

        // Test .replaceGet on a non-existent key (8): should return null
        let old2: Int? = self.myMap.replaceGet(8, 68);
        dump(old2); // Expected output: null

        // Test .replaceGet with null: this should delete the entry for key 7 and return its old value
        let old3: Int? = self.myMap.replaceGet(7, null);
        dump(old3); // Expected output: 68

        // Verify that key 7 has been deleted
        let val7: Int? = self.myMap.get(7);
        dump(val7); // Expected output: null
    }
}
