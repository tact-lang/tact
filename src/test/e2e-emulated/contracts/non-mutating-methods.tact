struct SomeStruct { i: Int; b: Bool }

extends fun equal(self: SomeStruct?, other: SomeStruct?): Bool {
    if (self == null && other == null) { return true }
    if (self == null || other == null) { return false }
    return self!!.i == other!!.i && self!!.b == other!!.b;
}

extends fun equal(self: SomeStruct, other: SomeStruct): Bool {
    return self.i == other.i && self.b == other.b;
}

contract Tester {
    receive() { }

    get fun test1(): Bool {
        let s1 = SomeStruct {i: 42, b: true};
        let s2 = SomeStruct {i: 42, b: false};
        let s3: SomeStruct? = null;
        return s1.equal(s1) && !s1.equal(s2) && !s3.equal(s2);
    }
}
