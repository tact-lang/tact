contract TestMap() {
    fun test() {
        let m: map<Int, Int> = emptyMap();
        m.set(0, 123);
        dump(m.get(0)!!);
    }
}
