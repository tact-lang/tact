contract TestMap() {
    fun run() {
        // Create and test map operations
        let m1: map<Int, Int> = emptyMap();
        m1.set(0, 10);
        let m2: map<Int, Int> = emptyMap();
        m2.set(0, 10);
        dump(m1 == m2);         // expected: true
        dump(m1.get(0)!!);       // expected: 10
        let del_ok: Bool = m1.del(0); // expected: true
        dump(del_ok);
        dump(m1.get(0));         // expected: null, since the entry was deleted
    }
    receive() {
        self.run();
    }
}
