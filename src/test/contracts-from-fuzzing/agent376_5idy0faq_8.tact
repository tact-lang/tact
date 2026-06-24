struct Inner {
    foo: Int?;
    bar: Bool?;
    baz: String?;
    cellOpt: Cell?;
    addrOpt: Address?;
}

contract ComplexOptionalStruct {
    state: Inner;

    init() {
        self.state = Inner{
            foo: null,
            bar: null,
            baz: null,
            cellOpt: null,
            addrOpt: null,
        };
    }
}