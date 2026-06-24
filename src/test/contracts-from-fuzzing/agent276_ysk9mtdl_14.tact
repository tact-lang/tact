struct OuterMost {
    a: Int;
    inner: InnerMost;
}

struct InnerMost {
    flag: Bool;
    text: String;
    deepInner: Deeper;
}

struct Deeper {
    value: Int;
}

contract WideDeep {
    test: OuterMost;

    init() {
        self.test = OuterMost{
            a: 123,
            inner: InnerMost{
                flag: true,
                text: "hi",
                deepInner: Deeper{value: 999}
            }
        };
    }
}
