struct InnerMost {
    a: Int;
    b: Bool;
}

struct Middle {
    inner: InnerMost;
    c: String;
}

struct Outer {
    middle: Middle;
    d: Int?;
}

contract TestDeepCombo {
    data: Outer;

    init() {
        self.data = Outer{
            middle: Middle{
                inner: InnerMost{
                    a: 1,
                    b: true
                },
                c: "test"
            },
            d: null
        };
    }
}
