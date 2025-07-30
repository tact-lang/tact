contract Test {
    receive() {
        // Testing map set and get operations with Int keys and Int values
        let m: map<Int, Int> = emptyMap();
        m.set(1, 10);
        let x: Int = m.get(1)!!;
        dump(x); // Expected output: 10
    }
}
