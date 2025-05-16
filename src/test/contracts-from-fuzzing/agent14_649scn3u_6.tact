struct BigNested {
    a: Int;
    b: String;
    c: Bool;
    d: Int?;
    e: Bool?;
    f: String;
    g: InnerNested;
}

struct InnerNested {
    x: Int;
    y: Bool?;
    z: String;
}

contract DeepAndWide {
    s: BigNested;

    init() {
        self.s = BigNested{
            a: 7,
            b: "foo",
            c: true,
            d: null,
            e: false,
            f: "bar",
            g: InnerNested{
                x: 10,
                y: null,
                z: "baz",
            },
        };
    }
}