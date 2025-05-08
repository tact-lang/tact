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
    j: String?;
}

contract OptionalsEverywhere {
    data: ManyOptionals;

    init() {
        self.data = ManyOptionals{
            a: null, b: null, c: null, d: null, e: null,
            f: null, g: null, h: null, i: null, j: null
        };
    }
}