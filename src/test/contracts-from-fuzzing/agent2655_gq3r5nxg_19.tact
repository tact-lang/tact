struct ComplexS {
    a: Int;
    b: Int?;
    c: String;
    d: Bool?;
    e: Address;
    f: String?;
}

contract NestedComplex {
    f: ComplexS?;

    init() {
        self.f = null;
    }
}