struct BigNested {
    a: Int;
    b: Bool;
    c: String;
    d: InnerDeep;
}

struct InnerDeep {
    e: Int;
    f: Bool;
    g: String;
    h: Int?;
}

contract BigNestTest {
    x: BigNested;
    init() {
        self.x = BigNested{
            a: 1,
            b: true,
            c: "hello",
            d: InnerDeep{
                e: 2,
                f: false,
                g: "bye",
                h: null
            }
        };
    }
}