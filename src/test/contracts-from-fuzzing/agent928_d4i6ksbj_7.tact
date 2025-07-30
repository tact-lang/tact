struct InnerMost {
    x: Int;
}

struct Middle {
    im: InnerMost;
    b: Bool;
}

struct OuterMost {
    m: Middle;
    s: String;
}

contract Deep3Nested {
    data: OuterMost;

    init() {
        self.data = OuterMost{
            m: Middle{im: InnerMost{x:99}, b: false},
            s: "deep",
        };
    }
}