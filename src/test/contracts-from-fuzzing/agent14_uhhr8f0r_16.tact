struct OptionalComplex {
    foo: Int?;
    bar: String?;
    baz: Bool?;
    addr: Address?;
}

contract Test {
    s: OptionalComplex;

    init() {
        self.s = OptionalComplex {
            foo: null,
            bar: null,
            baz: null,
            addr: null
        };
    }
}