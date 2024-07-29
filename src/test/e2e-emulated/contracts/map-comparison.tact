message CompareIntInt {
    m1: map<Int, Int>;
    m2: map<Int, Int>;
}

message CompareIntCell {
    m1: map<Int, Cell>;
    m2: map<Int, Cell>;
}

message CompareIntAddress {
    m1: map<Int, Address>;
    m2: map<Int, Address>;
}

message CompareAddressInt {
    m1: map<Address, Int>;
    m2: map<Address, Int>;
}

message CompareAddressCell {
    m1: map<Address, Cell>;
    m2: map<Address, Cell>;
}

message CompareAddressAddress {
    m1: map<Address, Address>;
    m2: map<Address, Address>;
}

contract MapComparisonTestContract {
    receive(msg: CompareIntInt) {
        require(msg.m1.deepEquals(msg.m2), "Maps are not equal");
    }

    receive(msg: CompareIntCell) {
        require(msg.m1.deepEquals(msg.m2), "Maps are not equal");
    }

    receive(msg: CompareIntAddress) {
        require(msg.m1.deepEquals(msg.m2), "Maps are not equal");
    }

    receive(msg: CompareAddressInt) {
        require(msg.m1.deepEquals(msg.m2), "Maps are not equal");
    }

    receive(msg: CompareAddressCell) {
        require(msg.m1.deepEquals(msg.m2), "Maps are not equal");
    }

    receive(msg: CompareAddressAddress) {
        require(msg.m1.deepEquals(msg.m2), "Maps are not equal");
    }
}