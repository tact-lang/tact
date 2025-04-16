contract MapExistsTest {
    receive() {
        // Create a map and test .exists() method, using correct map syntax with angle brackets
        let m: map<Int, Int> = emptyMap();
        m.set(2, 200);
        // Test: key 2 exists, so it should print 1
        if (m.exists(2)) {
            dump(1);
        } else {
            dump(0);
        }
        // Test: key 3 does not exist, so it should print 0
        if (m.exists(3)) {
            dump(1);
        } else {
            dump(0);
        }
    }
}
