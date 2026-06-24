struct MixedOpt {
    a: Int?;
    b: Bool;
    c: String?;
    d: Int;
    e: Bool?;
}

contract MixedOptionals {
    data: MixedOpt;

    init() {
        self.data = MixedOpt{
            a: null,
            b: true,
            c: null,
            d: 123,
            e: null
        };
    }
}