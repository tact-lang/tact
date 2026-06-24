// Combination of optionals, defaults and serializations
struct Combo {
    a: Int?;
    b: Int as uint32;
    c: String?;
    d: Bool;
    e: Bool?;
}

contract ComboStuff {
    stuff: Combo;

    init() {
        self.stuff = Combo{
            a: null,
            b: 1234,
            c: null,
            d: true,
            e: null
        };
    }
}
