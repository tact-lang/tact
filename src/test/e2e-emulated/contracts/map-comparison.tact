contract MapComparisonTestContract {
    receive() {}
    
    get fun compareIntInt(m1: map<Int, Int>, m2: map<Int, Int>): Bool {
        return m1.deepEquals(m2);
    }

    get fun compareIntCell(m1: map<Int, Cell>, m2: map<Int, Cell>): Bool {
        return m1.deepEquals(m2);
    }
    
    get fun compareIntAddress(m1: map<Int, Address>, m2: map<Int, Address>): Bool {
        return m1.deepEquals(m2);
    }

    get fun compareAddressInt(m1: map<Address, Int>, m2: map<Address, Int>): Bool {
        return m1.deepEquals(m2);
    }

    get fun compareAddressCell(m1: map<Address, Cell>, m2: map<Address, Cell>): Bool {
        return m1.deepEquals(m2);
    }

    get fun compareAddressAddress(m1: map<Address, Address>, m2: map<Address, Address>): Bool {
        return m1.deepEquals(m2);
    }
}