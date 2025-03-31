contract TestMap {
    get fun run() : Int {
        let m: map<Int, Int> = emptyMap();
        m.set(10, 20);
        return m.get(10)!!;
    }
}
