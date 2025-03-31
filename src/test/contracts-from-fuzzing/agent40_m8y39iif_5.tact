contract Test {
    receive() {
        // Testing .isEmpty() method on an empty map
        let m: map<Int, Int> = emptyMap();
        if (m.isEmpty()) {
            dump(1); // Should dump 1 as the map is empty
        } else {
            dump(0);
        }
    }
}
