struct ComplexOpt {
    a: Int?;
    b: Bool?;
    c: Address?;
}

contract StructOptPersistent {
    obj: ComplexOpt;

    init() {
        self.obj = ComplexOpt{ a: null, b: null, c: null };
    }
}