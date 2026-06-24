contract TestMap1 {
    // Basic test of map with Int keys and Int values
    fun test() : Int {
        let m: map<Int, Int> = emptyMap();
        m.set(1, 10);
        return m.get(1)!!;
    }

    // A getter to verify state not modified, state changes in getters are allowed but not persistent.
    get fun getTest() : Int {
        let m: map<Int, Int> = emptyMap();
        m.set(2, 20);
        return m.get(2)!!;
    }
}
