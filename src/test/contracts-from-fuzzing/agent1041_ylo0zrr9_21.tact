struct OptionalsMix {
    a: Int?;
    b: Bool;
    c: String?;
    d: Bool?;
    e: String;
}

contract MixOptionalStruct {
    data: OptionalsMix;

    init() {
        self.data = OptionalsMix{
            a: null,
            b: true,
            c: null,
            d: null,
            e: "hi"
        };
    }
}
