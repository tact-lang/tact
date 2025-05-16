struct ManyOptionals {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Int?;
    f: Int?;
    g: Bool?;
    h: Bool?;
    i: String?;
    j: String?;
}

contract ManyOptionalFields {
    st: ManyOptionals;

    init() {
        self.st = ManyOptionals{
            a: 1,
            b: null,
            c: 3,
            d: null,
            e: 5,
            f: null,
            g: true,
            h: null,
            i: "hi",
            j: null
        };
    }
}
