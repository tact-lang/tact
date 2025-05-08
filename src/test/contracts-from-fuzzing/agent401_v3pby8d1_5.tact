struct LargeOpt {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Bool?;
    e: Bool?;
    f: String?;
    g: String?;
    h: Int?;
    i: Bool?;
    j: String?;
}

contract Test {
    data: LargeOpt;

    init() {
        self.data = LargeOpt{
            a: 1,
            b: null,
            c: 3,
            d: true,
            e: null,
            f: "f",
            g: null,
            h: null,
            i: false,
            j: "j"
        };
    }
}
