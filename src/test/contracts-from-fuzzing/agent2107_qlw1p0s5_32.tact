struct NestedMany {
    a: Int;
    b: Bool?;
    c: String;
    d: Int?;
    e: String?;
}

contract UseNestedMany {
    f: NestedMany;

    init() {
        self.f = NestedMany{
            a: 1,
            b: null,
            c: "x",
            d: null,
            e: null
        };
    }
}