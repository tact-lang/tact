contract TestMaps() {
    fun test() {
        let m: map<Int, Int> = emptyMap();
        m.set(10, 100);
        dump(m.get(10)!!); // Should dump 100

        m.replaceGet(10, 200);
        dump(m.get(10)!!); // Should dump 200

        m.del(10);
        dump(m.exists(10)); // Should dump false

        let m2: map<Address, Bool> = emptyMap();
        dump(m2.isEmpty()); // Should dump true
    }
    receive() { self.test(); }
}
