contract Test {
    receive() {
        // Testing set() method for a map<Int, Int>
        let m: map<Int, Int> = emptyMap();
        m.set(1, 10);
    }
}
