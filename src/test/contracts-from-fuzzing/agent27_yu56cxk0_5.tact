contract TestMapBoolValue {
    // Test map with allowed key type (Int) and allowed value type (Bool)
    get fun f() : Int {
        let m: map<Int, Bool> = emptyMap();
        m.set(10, true);
        let flag: Bool = m.get(10)!!;
        // Return 1 if flag is true, otherwise 0
        return flag ? 1 : 0;
    }
}
