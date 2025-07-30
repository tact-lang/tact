contract TestMapValid2 {
    fun test() {
        let m: map<Int, Int> = emptyMap();
        m.set(1, 100);
        let x = m.get(1)!!; // should retrieve 100
        dump(x);
    }
    receive() {}
}
