struct BigOptional {
    a: Int?;
    b: Int?;
    c: Bool?;
    d: String?;
    e: Bool?;
    f: String?;
    g: Int?;
    h: String?;
    i: Bool?;
    j: Int?;
}

contract Test {
    state: BigOptional;

    init() {
        self.state = BigOptional{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null,
            g: null,
            h: null,
            i: null,
            j: null,
        };
    }
}
