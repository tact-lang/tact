contract TestIsEmpty {
    m: map<Int, Int> = emptyMap();

    receive() {
        // Case 1: Newly created map should be empty
        if (self.m.isEmpty()) {
            dump(1); // Expected: 1
        } else {
            dump(0);
        }

        // Case 2: After setting a value, map should not be empty
        self.m.set(5, 55);
        if (self.m.isEmpty()) {
            dump(0);
        } else {
            dump(1); // Expected: 1
        }

        // Case 3: Resetting the map to empty
        self.m = emptyMap();
        if (self.m.isEmpty()) {
            dump(1); // Expected: 1
        } else {
            dump(0);
        }
    }
}
