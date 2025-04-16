struct EqualityResult {
    shallow: Bool;
    deep: Bool;
}

struct AllowanceMap {
    unbox: map<Address, Int> = emptyMap();
}

contract TestNestedMapEquality {
    outer1: map<Address, AllowanceMap> = emptyMap();
    outer2: map<Address, AllowanceMap> = emptyMap();

    init() {
        let addr = myAddress();

        // Initialize first nested map: insert inner map with one entry
        let am1: AllowanceMap = AllowanceMap{ unbox: emptyMap() };
        am1.unbox.set(addr, 42);
        self.outer1.set(addr, am1);

        // Initialize second nested map: create a different instance with same content
        let am2: AllowanceMap = AllowanceMap{ unbox: emptyMap() };
        am2.unbox.set(addr, 42);
        self.outer2.set(addr, am2);
    }

    // Getter returning both shallow and deep equality results between the two outer maps
    get fun testEquality(): EqualityResult {
        return EqualityResult{
            shallow: self.outer1 == self.outer2,
            deep: self.outer1.deepEquals(self.outer2)
        };
    }
}
