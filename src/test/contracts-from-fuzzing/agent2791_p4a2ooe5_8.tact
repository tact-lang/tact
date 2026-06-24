struct InnerMost {
    x: Int;
    y: String;
}

struct Middle {
    a: Bool;
    inner: InnerMost;
}

struct Outer {
    optMid: Middle?;
    text: String;
}

contract TestContract {
    bigNest: Outer;

    init() {
        self.bigNest = Outer{
            optMid: Middle{
                a: false,
                inner: InnerMost{
                    x: 123,
                    y: "deep inside",
                },
            },
            text: "outer",
        };
    }
}
