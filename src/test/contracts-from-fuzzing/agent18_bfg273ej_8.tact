contract TestDeepEquals {
    receive() {
        // Testing .deepEquals() method on map<Int, Int>
        let m: map<Int, Int> = emptyMap();
        let n: map<Int, Int> = emptyMap();

        // Both maps are empty: deep equals should be true
        if (m.deepEquals(n)) {
            dump(1); // Expect 1
        } else {
            dump(0);
        }

        // Insert same key-value pair into both maps
        m.set(10, 100);
        n.set(10, 100);
        if (m.deepEquals(n)) {
            dump(2); // Expect 2
        } else {
            dump(0);
        }

        // Change one map's value
        n.set(10, 200);
        if (m.deepEquals(n)) {
            dump(0);
        } else {
            dump(3); // Expect 3 because deep equality should fail
        }
    }
}
