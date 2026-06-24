struct OptionalDeep {
    foo: Int?;
    bar: OptionalDeeper?;
}

struct OptionalDeeper {
    flag: Bool;
    count: Int;
}

contract TestOptionalDeep {
    opt: OptionalDeep;

    init() {
        self.opt = OptionalDeep{
            foo: null,
            bar: OptionalDeeper{flag: true, count: 55}
        };
    }
}