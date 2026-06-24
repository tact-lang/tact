struct AllowanceMap {
    unbox: map<Address, Int>;
}

contract NestedMaps {
    get fun test(): Int {
        let allowances: map<Address, AllowanceMap> = emptyMap();
        let allowance = AllowanceMap{ unbox: emptyMap() };
        allowance.unbox.set(myAddress(), 42);
        allowances.set(myAddress(), allowance);
        return allowances.get(myAddress())!!.unbox.get(myAddress())!!;
    }
}
