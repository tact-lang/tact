contract TestValid1 {
    get fun test() : Int {
        let m: map<Int, Int> = emptyMap();
        m.set(42, 100);
        return m.get(42)!!;
    }
}
