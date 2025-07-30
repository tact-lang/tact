// Test Case 1: Test Maps
contract TestMap() {
    fun run() {
        let m: map<Int, Int> = emptyMap();
        m.set(0, 42);
        let v: Int = m.get(0)!!; // should yield 42
        dump(v);
    }
    receive() {
        self.run();
    }
}
