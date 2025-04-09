contract TestMap() {
    fun test() {
        // Create a map of Int -> Int
        let m: map<Int, Int> = emptyMap();

        // Set key 1 to 100
        m.set(1, 100);
        dump(m.get(1)!!); // Expected output: 100

        // Replace the key value
        let old = m.replaceGet(1, 50); // old value should be 100
        dump(old); // Expected output: 100
        dump(m.get(1)!!); // Expected output: 50

        // Delete key and check existence
        m.del(1);
        dump(m.exists(1)); // Expected output: false
    }
    receive() { self.test(); }
}
