struct MixedOptional {
    a: Int;
    b: Bool?;
    c: String;
    d: Int?;
}

contract NestedMixedOpt {
    data: MixedOptional;

    init() {
        self.data = MixedOptional{
            a: 10,
            b: true,
            c: "hi",
            d: null
        };
    }
}