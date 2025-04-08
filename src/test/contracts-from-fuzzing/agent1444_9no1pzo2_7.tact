struct Combo {
    a: Int;
    b: Bool?;
    c: String;
    d: Int?;
    e: String?;
    f: Bool;
    g: Address?;
}

contract TestMix {
    stuff: Combo;

    init() {
        self.stuff = Combo{
            a: 1,
            b: null,
            c: "test",
            d: null,
            e: null,
            f: false,
            g: null,
        };
    }
}
