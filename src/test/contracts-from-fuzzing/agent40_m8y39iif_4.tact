contract Test {
    receive() {
        // Testing .exists() method
        let m: map<Int, Int> = emptyMap();
        m.set(10, 20);
        if (m.exists(10)) {
            dump(1); // expected to dump 1
        } else {
            dump(0);
        }
    }
}
