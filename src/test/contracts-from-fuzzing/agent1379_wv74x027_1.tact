struct LargeNested {
    a: Int;
    b: String?;
    c: Bool;
    d: Int?;
    e: String;
    f: Bool?;
    g: InnerNested;
}

struct InnerNested {
    one: Int;
    two: String?;
    three: Bool;
}

contract ComplexFields {
    field: LargeNested;

    init() {
        self.field = LargeNested{
            a: 1,
            b: null,
            c: true,
            d: null,
            e: "hello",
            f: false,
            g: InnerNested{
                one: 2,
                two: null,
                three: true,
            },
        };
    }
}
