contract TestMap {
    fun run() {
        let m: map<Int, Int> = emptyMap();
        m.set(0, 100);
        dump(m.get(0)!!); // expected output: 100
    }
    receive() {
        self.run();
    }
}
