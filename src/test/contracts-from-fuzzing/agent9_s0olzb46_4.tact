contract TestMaps() {
    fun test() {
        let m: map<Int, Int> = emptyMap();
        m.set(1, 10);
        dump(m.get(1)!!);       // should dump 10
        dump(m.del(1));         // should dump true
        dump(m.del(1));         // should dump false (idempotency check)
        dump(m.isEmpty());      // should dump true
    }
    receive() { self.test(); }
}
