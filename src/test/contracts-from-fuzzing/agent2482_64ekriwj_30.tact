struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: Int?;
    d: Bool?;
    e: String?;
    f: String?;
    g: Int?;
    h: Bool?;
    i: Int?;
    j: Bool?;
}

contract Test {
    data: ManyOptionals;
    init() {
        self.data = ManyOptionals{
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