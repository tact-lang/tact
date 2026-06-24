contract TestMapsValid {
    fun run() {
        // Valid usage of maps
        let m: map<Int, Int> = emptyMap();
        m.set(1, 42);
        // Using get with non-null assertion since key 1 exists
        dump(m.get(1)!!);
    }
    
    receive() {
        self.run();
        cashback(sender());
    }
}
