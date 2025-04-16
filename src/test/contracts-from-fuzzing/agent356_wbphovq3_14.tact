struct InnerMost {
    i: Int;
    s: String;
}

struct Middle {
    flag: Bool;
    inner: InnerMost;
}

contract ComplexTest {
    field: Middle;

    init() {
        self.field = Middle{
            flag: true,
            inner: InnerMost{
                i: 9,
                s: "deep"
            }
        };
    }
}