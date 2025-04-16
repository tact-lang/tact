contract TestMap() {
    fun test() {
        let m: map<Int, Int> = emptyMap();
        m.set(1, 10);
        dump(m.get(1)!!);
        m.del(1);
        dump(m.isEmpty());
        // Also test casting to Cell - maps can be cast back to Cell
        dump(m.asCell());
    }
    receive() {
        self.test();
        cashback(sender());
    }
}
