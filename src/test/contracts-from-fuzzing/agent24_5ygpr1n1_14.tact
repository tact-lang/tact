contract Test {
    receive() {
        let m: map<Int, Int> = emptyMap();
        m.set(1, 111);
        m.set(2, 222);

        // Valid: discard key in foreach
        foreach (_ , v in m) {
            dump(v); // Expected to dump 111, 222; not accessible via _
        }

        // Valid: discard value in foreach
        foreach (k, _ in m) {
            dump(k); // Expected to dump 1, 2
        }
    }
}
