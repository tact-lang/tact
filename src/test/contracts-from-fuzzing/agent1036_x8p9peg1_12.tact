struct Combo {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract VaryingFields {
    combo: Combo;
    init() {
        self.combo = Combo{
            a: 5,
            b: true,
            c: "hi",
            d: 10,
            e: false,
            f: "opt"
        };
    }
}