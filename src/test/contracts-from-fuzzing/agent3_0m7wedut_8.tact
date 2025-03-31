struct AllowanceMap {
    unbox: map<Address, Int>;
}

contract TestNestedMaps {
    // Outer map: key Address, value AllowanceMap
    m: map<Address, AllowanceMap> = emptyMap();

    init() {
        // Create inner map using myAddress()
        let inner: map<Address, Int> = emptyMap();
        inner.set(myAddress(), 42);

        // Construct AllowanceMap with the inner map
        let allowance: AllowanceMap = AllowanceMap{ unbox: inner };

        // Set the outer map entry using myAddress()
        self.m.set(myAddress(), allowance);
    }

    // Getter to retrieve value from nested map
    get fun getAllow(): Int? {
        return self.m.get(myAddress())!!.unbox.get(myAddress());
    }
}
