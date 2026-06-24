contract TestValidMap {
    fun test() : Int {
        let m: map<Int, Int> = emptyMap();
        m.set(1, 100);
        return m.get(1)!!;
    }
}
