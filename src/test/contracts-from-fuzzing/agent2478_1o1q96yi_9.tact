struct NestedMany {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract WithNestedMany {
    s: NestedMany;

    init() {
        self.s = NestedMany{
            a: 42,
            b: true,
            c: "hi",
            d: null,
            e: null,
            f: null
        };
    }
}