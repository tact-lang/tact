contract TestMapUsage() {
    fun test() {
        let m: map<Int, Int> = emptyMap();
        m.set(1, 100);
        let val = m.get(1)!!;
        dump(val);
    }

    receive() {
        self.test();
    }
}
