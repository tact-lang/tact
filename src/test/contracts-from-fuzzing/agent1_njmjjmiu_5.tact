contract MapIsEmptyTest {
    receive() {
        // Test for .isEmpty() on an empty map
        let m: map<Int, Int> = emptyMap();
        if (m.isEmpty()) {
            dump(1); // expected: dump 1
        } else {
            dump(0);
        }
        
        // Add an element and then the map should not be empty
        m.set(10, 100);
        if (m.isEmpty()) {
            dump(0);
        } else {
            dump(1); // expected: dump 1
        }
    }
}
