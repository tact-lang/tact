struct OptionalDeep {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Int?;
    f: Int?;
    g: Int?;
    h: Int?;
    i: Int?;
    j: Int?;
}

contract OptDeepStorage {
    data: OptionalDeep;

    init() {
        self.data = OptionalDeep{
            a: null, b: null, c: 3, d: 4, e: null, f: 6, g: null, h: 8, i: null, j: 10
        };
    }
}