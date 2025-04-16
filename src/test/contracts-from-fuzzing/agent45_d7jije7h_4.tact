contract Test {
    receive() {
        // Testing .exists() method on map<Int, Int>
        let m: map<Int, Int> = emptyMap();
        m.set(10, 55);
        // Check for an existing key (should be true) and a non-existing key (should be false)
        if (m.exists(10)) {
            dump(1); // Expect to dump 1
        } else {
            dump(0);
        }
        if (m.exists(5)) {
            dump(1);
        } else {
            dump(0); // Expect to dump 0
        }
    }
}
