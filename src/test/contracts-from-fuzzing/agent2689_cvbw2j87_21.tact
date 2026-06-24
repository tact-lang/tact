struct OptionalsMix {
    a: Int?;
    b: String?;
    c: Bool;
    d: Bool?;
    e: Int;
}

contract OptionalsMixStorage {
    s: OptionalsMix;

    init() {
        self.s = OptionalsMix{
            a: null,
            b: null,
            c: true,
            d: null,
            e: 42,
        };
    }
}