struct Combo {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Int?;
    f: Bool?;
    g: String?;
    h: Address?;
}

contract TestCombo {
    combo: Combo;

    init() {
        self.combo = Combo{
            a: 3,
            b: false,
            c: "hi",
            d: myAddress(),
            e: null,
            f: true,
            g: null,
            h: null
        };
    }
}