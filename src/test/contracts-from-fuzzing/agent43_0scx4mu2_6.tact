contract TestMapValid {
    fun test() {
        let m: map<Int, Int> = emptyMap();
        m.set(1, 100);
        dump(m.get(1)!!); // Expect to dump 100
        return;
    }
    receive() {
        self.test();
    }
}
