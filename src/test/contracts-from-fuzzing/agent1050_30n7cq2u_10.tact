struct InnerOpt {
    foo: Int?;
    bar: Bool?;
}

contract StructWithOptDefaults {
    s: InnerOpt;

    init() {
        self.s = InnerOpt{
            foo: null,
            bar: null
        };
    }
}