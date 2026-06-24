struct Combo {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
}

contract Test {
    field: Combo;

    init() {
        self.field = Combo{
            a: 5,
            b: null,
            c: true,
            d: false,
            e: "x",
            f: "y",
        };
    }
}