struct StringHeavy {
    a: String;
    b: String;
    c: String;
    d: String?;
    e: String?;
}

contract Test {
    data: StringHeavy;

    init() {
        self.data = StringHeavy{
            a: "alpha",
            b: "beta",
            c: "gamma",
            d: null,
            e: null,
        };
    }
}