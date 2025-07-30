contract TestMap {
    fun run() {
        // Valid map usage: map of Int keys to Int values
        let m: map<Int, Int> = emptyMap();
        m.set(42, 100);
        // Retrieve and dump the value at key 42
        dump(m.get(42)!!); // Expected output: 100
    }
    receive() {}
}
