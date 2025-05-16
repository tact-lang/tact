struct InnerMost {
    a: Int;
    b: Bool?;
}

struct Inner {
    x: String;
    y: InnerMost;
}

struct Middle {
    m: Int;
    n: Inner;
}

struct Outer {
    p: Middle;
    q: Int?;
}

contract NestedLayers {
    data: Outer;

    init() {
        self.data = Outer{
            p: Middle{
                m: 42,
                n: Inner{
                    x: "deep",
                    y: InnerMost{ a: 7, b: true }
                }
            },
            q: null
        };
    }
}