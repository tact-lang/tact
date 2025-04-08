struct InnerMost {
    a: Int;
    b: Bool?;
}

struct Middle {
    m: InnerMost;
    c: String;
}

struct Outer {
    d: Middle;
    e: Int?;
}

contract DeepOptionals {
    st: Outer;

    init() {
        self.st = Outer{
            d: Middle{
                m: InnerMost{ a: 5, b: null },
                c: "hello",
            },
            e: null,
        };
    }
}