struct MixedOptional {
    a: Int?;
    b: Bool;
    c: String?;
    d: Bool?;
    e: Int;
}

contract MixedOptionals {
    data: MixedOptional;

    init() {
        self.data = MixedOptional{
            a: null,
            b: true,
            c: "str",
            d: null,
            e: 42
        };
    }
}
