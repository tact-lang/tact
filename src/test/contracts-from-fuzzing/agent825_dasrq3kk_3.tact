struct BigNested {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: Int;
    f: Bool;
    g: Int?;
    h: Bool?;
}

contract Test {
    field: BigNested;

    init() {
        self.field = BigNested{
            a: 1,
            b: true,
            c: null,
            d: false,
            e: 2,
            f: false,
            g: 3,
            h: null,
        };
    }
}