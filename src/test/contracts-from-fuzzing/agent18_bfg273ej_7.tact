contract TestIsEmpty {
    receive() {
        // Testing .isEmpty() on map<Int, Int>
        let m: map<Int, Int> = emptyMap();
        // Initially the map is empty
        if (m.isEmpty()) {
            dump(1); // Expected to dump 1
        } else {
            dump(0);
        }
        
        // After inserting a key, it should not be empty
        m.set(100, 999);
        if (m.isEmpty()) {
            dump(0);
        } else {
            dump(2); // Expected to dump 2
        }
    }
}
