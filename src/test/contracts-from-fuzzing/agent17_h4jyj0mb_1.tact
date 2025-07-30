contract TestValidMap {
    // This contract tests valid usage of maps with allowed key and value types.
    get fun test() : Int {
        let m: map<Int, Int> = emptyMap();
        m.set(42, 4242);
        if (!m.exists(42)) {
            return -1;
        }
        return m.get(42)!!;
    }
}
