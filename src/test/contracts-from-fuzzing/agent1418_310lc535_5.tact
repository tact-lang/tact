struct MixedOptional {
    a: Int?;
    b: Bool;
    c: String?;
    d: Address?;
    e: Bool?;
    f: Int;
}

contract MixedOptionalContract {
    data: MixedOptional;

    init() {
        self.data = MixedOptional{
            a: null,
            b: true,
            c: null,
            d: null,
            e: null,
            f: 123,
        };
    }
}