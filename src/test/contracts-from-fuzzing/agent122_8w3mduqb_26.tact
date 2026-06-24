struct PackedOpt {
    foo: Int?;
    bar: Bool?;
    baz: Address?;
    qux: String?;
}

contract MixedOptionals {
    data: PackedOpt = PackedOpt{
        foo: null,
        bar: null,
        baz: null,
        qux: null,
    };
    init() {
        self.data = PackedOpt{
            foo: 1,
            bar: true,
            baz: null,
            qux: "hi",
        };
    }
}
