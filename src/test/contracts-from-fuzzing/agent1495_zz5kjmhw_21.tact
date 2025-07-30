struct NestedComplex {
    s1: String;
    s2: String?;
    b1: Bool;
    b2: Bool?;
    i1: Int;
    i2: Int?;
    addr: Address;
    addrOpt: Address?;
}

contract NestedComplexTest {
    f: NestedComplex;

    init() {
        self.f = NestedComplex{
            s1: "aaa",
            s2: null,
            b1: true,
            b2: null,
            i1: 42,
            i2: null,
            addr: myAddress(),
            addrOpt: null
        };
    }
}
