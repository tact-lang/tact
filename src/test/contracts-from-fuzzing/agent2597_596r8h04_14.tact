struct ManyOptionals {
    a: Int?;
    b: String?;
    c: String?;
    d: Bool?;
    e: Bool?;
    f: Int?;
    g: Bool?;
    h: Int?;
    i: String?;
    j: Bool?;
}

contract OptFlood {
    data: ManyOptionals;

    init() {
        self.data = ManyOptionals{
            a: null, b: null, c: null, d: null, e: null, f: null, g: null, h: null, i: null, j: null,
        };
    }
}