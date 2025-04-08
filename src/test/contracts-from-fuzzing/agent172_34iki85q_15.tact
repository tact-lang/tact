struct Combo {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
}

contract MixedOptionalOrder {
    combo: Combo;

    init() {
        self.combo = Combo{
            a: 10,
            b: null,
            c: true,
            d: null,
            e: "non-optional",
            f: null,
        };
    }
}