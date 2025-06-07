struct LargeNested {
    a: Int;
    b: String?;
    c: InnerLarge;
}

struct InnerLarge {
    d: String;
    e: Int?;
    f: Bool;
    g: Bool?;
    h: String?;
}

contract TestContract {
    state: LargeNested;

    init() {
        self.state = LargeNested{
            a: 100,
            b: null,
            c: InnerLarge{
                d: "hello",
                e: null,
                f: true,
                g: null,
                h: null
            }
        };
    }
}