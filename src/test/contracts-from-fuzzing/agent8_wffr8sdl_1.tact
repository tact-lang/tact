contract TestValidIntInt {
    // Testing a valid map with Int keys and Int values
    get fun test() : Int {
        let m: map<Int, Int> = emptyMap();
        m.set(10, 20);
        if (m.get(10) == null) {
            return 0;
        } else {
            return m.get(10)!!;
        }
    }
}