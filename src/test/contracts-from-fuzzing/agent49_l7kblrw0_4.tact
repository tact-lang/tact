contract TestMap() {
    fun run() {
        // Create a map from Int to Int
        let m: map<Int, Int> = emptyMap();
        m.set(10, 42);
        // Retrieve and dump the stored value; expected: 42
        dump(m.get(10)!!);
        // Delete the key
        m.del(10);
        // Check deletion: if key not present, dump 0
        if (m.get(10) == null) { dump(0); }
    }

    receive() {
        self.run();
    }
}
