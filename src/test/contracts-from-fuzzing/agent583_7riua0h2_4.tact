struct ManyOpts {
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

contract ManyOptionalsContract {
    many: ManyOpts;

    init() {
        self.many = ManyOpts{
            a: null,
            b: true,
            c: "",
            d: 1,
            e: null,
            f: null,
            g: 2,
            h: false,
            i: null,
        };
    }
}