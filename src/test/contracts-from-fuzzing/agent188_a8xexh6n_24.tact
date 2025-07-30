struct Combo {
    a: Int;
    b: Bool?;
    c: String;
    d: Int as int64;
    e: Bool;
    f: String?;
}

contract BigCombo {
    zz: Combo;

    init() {
        self.zz = Combo {
            a: 7,
            b: null,
            c: "xyz",
            d: 1234,
            e: true,
            f: null
        };
    }
}
