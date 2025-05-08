struct BigOptional {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Bool?;
    e: Bool?;
    f: String?;
}

contract OptCombo {
    state: BigOptional;

    init() {
        self.state = BigOptional{
            a: null,
            b: 2,
            c: null,
            d: true,
            e: null,
            f: "hi",
        };
    }
}