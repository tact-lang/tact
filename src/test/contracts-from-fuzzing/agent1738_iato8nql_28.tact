struct OptionalHeavy {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Int?;
    h: Bool?;
    i: String?;
}

contract TestContract {
    heavy: OptionalHeavy;
    init() {
        self.heavy = OptionalHeavy{
            a: 1,
            b: null,
            c: "hi",
            d: null,
            e: true,
            f: null,
            g: 7,
            h: false,
            i: "x",
        };
    }
}