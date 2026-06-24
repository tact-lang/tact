struct Combo {
    a: Int;
    b: String;
    c: Bool;
    d: Int?;
    e: String?;
    f: Bool?;
}

contract ComboFields {
    combo: Combo;

    init() {
        self.combo = Combo{
            a: 1,
            b: "two",
            c: true,
            d: null,
            e: null,
            f: false
        };
    }
}