contract TestAsSlice {
    // This function checks that storing an address into a cell then calling asSlice() gives the same result as directly converting the address
    fun testAsSlice(a: Address) : Bool {
        let s1 = beginCell().storeAddress(a).asSlice();
        let s2 = a.asSlice();
        return s1 == s2;
    }
    // minimal receive function
    receive() {}
}
