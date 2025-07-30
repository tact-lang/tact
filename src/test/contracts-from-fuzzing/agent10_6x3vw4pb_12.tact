contract TestAddressKeyMap {
    get fun test() : Int {
        let m: map<Address, Int> = emptyMap();
        m.set(myAddress(), 123);
        return m.get(myAddress())!!;
    }
}
