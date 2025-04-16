struct HasBoolIntOptional {
    a: Bool;
    b: Int;
    c: Bool?;
    d: Int?;
}

contract OptionalMix {
    data: HasBoolIntOptional;

    init() {
        self.data = HasBoolIntOptional{
            a: true,
            b: 42,
            c: null,
            d: null,
        };
    }
}
