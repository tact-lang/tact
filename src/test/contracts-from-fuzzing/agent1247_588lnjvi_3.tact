struct MixedOptional {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
}

contract OptionalStructTest {
    storage: MixedOptional;

    init() {
        self.storage = MixedOptional{
            a: 7,
            b: null,
            c: true,
            d: false
        };
    }
}