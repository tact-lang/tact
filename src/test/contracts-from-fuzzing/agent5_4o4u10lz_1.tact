contract TestValidMap {
    get fun test(): Int {
        let m: map<Int, Int> = emptyMap();
        m.set(1, 100);
        if (m.exists(1)) {
            return m.get(1)!!;
        }
        return 0;
    }
}
