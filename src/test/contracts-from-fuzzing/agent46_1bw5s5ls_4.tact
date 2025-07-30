contract TestMap {
    fun test() {
        let m: map<Int, Int> = emptyMap();
        m.set(5, 100);
        dump(m.get(5)!!); // Expected output: 100
    }
    receive() { self.test(); }
}
