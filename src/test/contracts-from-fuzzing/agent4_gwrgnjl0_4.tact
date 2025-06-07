contract TestAddressKey {
    // Test valid use of Address as key in a map
    get fun test(): Int {
         let m: map<Address, Int> = emptyMap();
         m.set(myAddress(), 999);
         return m.get(myAddress())!!;
    }
}
