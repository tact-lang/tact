contract Test {
    receive() {
        // Test shallow equality on maps (comparing hashes, so expected to be true since both are empty)
        let m1: map<Int, Int> = emptyMap();
        let m2: map<Int, Int> = emptyMap();
        dump(m1 == m2); // expected output: true
    }
}
