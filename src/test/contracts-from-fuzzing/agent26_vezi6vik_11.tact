struct AllowanceMap {
    // A map using Address as key and Int as value
    unbox: map<Address, Int> = emptyMap();
}

contract NestedMapsTest {
    // Outer map: keys of type Address mapping to AllowanceMap structs
    allowances: map<Address, AllowanceMap> = emptyMap();

    init() {
        // Create an inner map, then insert an entry using myAddress() as key
        let inner: AllowanceMap = AllowanceMap{ unbox: emptyMap() };
        inner.unbox.set(myAddress(), 42);
        self.allowances.set(myAddress(), inner);
    }

    // Getter function to retrieve the value from the nested map
    get fun getInnerValue(addr: Address) : Int {
        return self.allowances.get(addr)!!.unbox.get(addr)!!;
    }
}
