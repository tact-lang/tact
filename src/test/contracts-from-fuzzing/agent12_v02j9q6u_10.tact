contract TestIsEmpty {
    m: map<Int, Int> = emptyMap();

    receive() {
        // Initially the map is empty
        dump(self.m.isEmpty()); // Expected: true

        // Add a key-value pair
        self.m.set(10, 999);
        dump(self.m.isEmpty()); // Expected: false

        // Clear the map by reassigning emptyMap()
        self.m = emptyMap();
        dump(self.m.isEmpty()); // Expected: true
    }
}
