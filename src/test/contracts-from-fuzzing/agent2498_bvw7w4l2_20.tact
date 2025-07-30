struct Combo {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
}

contract TestContract {
    combo: Combo;

    init() {
        self.combo = Combo{
            a: 1,
            b: null,
            c: true,
            d: null,
            e: "string",
            f: null,
        };
    }
}