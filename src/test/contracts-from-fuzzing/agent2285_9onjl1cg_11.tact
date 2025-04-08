struct LargeOptional {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Int?;
    h: Bool?;
    i: String?;
    j: Int?;
}

contract Test11 {
    data: LargeOptional;

    init() {
        self.data = LargeOptional{
            a: null, b: null, c: null, d: null, e: null,
            f: null, g: null, h: null, i: null, j: null,
        };
    }
}