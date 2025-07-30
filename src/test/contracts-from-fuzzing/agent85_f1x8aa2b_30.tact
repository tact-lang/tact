struct TripleNest {
    a: Int;
}

struct DoubleNest {
    t: TripleNest;
}

struct SingleNest {
    d: DoubleNest;
}

contract NestedThree {
    s: SingleNest;

    init() {
        self.s = SingleNest{ d: DoubleNest{ t: TripleNest{ a: 7 } } };
    }

    receive() {}
}