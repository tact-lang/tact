struct ManyOptionals {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Bool?;
    e: String?;
    f: Bool?;
    g: String?;
    h: Int?;
    i: Bool?;
}

contract TestManyOptionals {
    vars: ManyOptionals;

    init() {
        self.vars = ManyOptionals{
            a: 1,
            b: null,
            c: 3,
            d: false,
            e: "text",
            f: null,
            g: "more",
            h: null,
            i: true,
        };
    }
}
