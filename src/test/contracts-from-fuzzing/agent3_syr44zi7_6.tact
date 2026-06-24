contract TestReplace {
    myMap: map<Int, Int>;

    receive() {
        self.myMap = emptyMap();
        // Initialize the map with two key-value pairs
        self.myMap.set(7, 70);
        self.myMap.set(42, 42);

        // Test .replace: replace value at key 7 with 68 (should succeed) 
        let replaced1: Bool = self.myMap.replace(7, 68);
        dump(replaced1); // Expected: true

        // Verify that key 7 now has value 68
        let val7: Int? = self.myMap.get(7);
        dump(val7); // Expected: 68

        // Test .replace on a non-existent key (8) - should return false
        let replaced2: Bool = self.myMap.replace(8, 68);
        dump(replaced2); // Expected: false

        // Test .replace with null as replacement to delete an entry
        let replaced3: Bool = self.myMap.replace(42, null);
        dump(replaced3); // Expected: true

        // Verify that key 42 is now deleted
        let val42: Int? = self.myMap.get(42);
        dump(val42); // Expected: null
    }
}
