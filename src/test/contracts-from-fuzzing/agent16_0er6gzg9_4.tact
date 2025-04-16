contract Test {
    receive() {
        // Testing map.exists on a key that does not exist using correct syntax with angle brackets
        let m: map<Int, Int> = emptyMap();
        m.set(2, 200);
        let existsResult: Bool = m.exists(1); // key 1 was never set
        dump(existsResult); // Expected to dump false
    }
}
