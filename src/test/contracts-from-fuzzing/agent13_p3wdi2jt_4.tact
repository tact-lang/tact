contract TestMapValid() {
    fun run() {
        // Valid map: keys are Int and values are Int
        let m: map<Int, Int> = emptyMap();
        m.set(10, 100);
        dump(m.get(10)!!); // Expect 100
        m.del(10);
        dump(m.isEmpty()); // Expect true
    }
    receive() {
        self.run();
        cashback(sender());
    }
}
