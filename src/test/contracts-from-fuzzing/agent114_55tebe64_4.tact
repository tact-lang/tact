struct MixedOptional {
    a: Bool;
    b: Int?;
    c: Bool;
    d: Int?;
}

contract MixedOptionalTest {
    nested: MixedOptional;

    init() {
        self.nested = MixedOptional{
            a: true,
            b: 42,
            c: false,
            d: null,
        };
    }
}