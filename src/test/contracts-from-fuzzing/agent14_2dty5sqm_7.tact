struct AllowanceMap {
    unbox: map<Address, Int> = emptyMap();
}

contract NestedMapsTest {
    m: map<Address, AllowanceMap> = emptyMap();

    init() {
        let allowance: AllowanceMap = AllowanceMap{ unbox: emptyMap() };
        allowance.unbox.set(myAddress(), 42);
        self.m.set(myAddress(), allowance);
    }

    // Getter to retrieve the value 42 from the nested map
    get fun test(): Int {
        return self.m.get(myAddress())!!.unbox.get(myAddress())!!;
    }
}
