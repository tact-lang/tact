struct Combo {
    a: Int;
    b: Bool?;
    c: String;
    d: Int?;
    e: Bool;
    f: String?;
}

contract Mixed {
    s: Combo;
    init() {
        self.s = Combo{
            a: 3,
            b: null,
            c: "foo",
            d: 4,
            e: false,
            f: null
        };
    }
}
