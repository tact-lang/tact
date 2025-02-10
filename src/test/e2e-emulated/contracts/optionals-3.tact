struct SomeStruct { i: Int; b: Bool }

extends fun equal(self: SomeStruct?, other: SomeStruct?): Bool {
    if (self == null && other == null) { return true }
    if (self == null || other == null) { return false }
    return self!!.i == other!!.i && self!!.b == other!!.b;
}

extends fun equal(self: SomeStruct, other: SomeStruct): Bool {
    return self.i == other.i && self.b == other.b;
}

contract Opt5 {
    receive() { }

    get fun test1(): Bool {
        let s1 = SomeStruct {i: 42, b: true};
        let s2 = SomeStruct {i: 42, b: false};
        return s1.equal(s1)
    }

    get fun test2(): Bool {
        let s1 = SomeStruct {i: 42, b: true};
        let s2 = SomeStruct {i: 42, b: false};
        let s3: SomeStruct? = null;
        return s1.equal(s1) && !s3.equal(s2);
    }

    get fun test3(): Bool {
        let s1: SomeStruct? = null;
        let s2: SomeStruct? = null;
        return !s1.equal(s2);
    }
}
