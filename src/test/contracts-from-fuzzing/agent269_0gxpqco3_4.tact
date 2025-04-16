struct InnerMost {
    flag: Bool = true;
}

struct Middle {
    nested: InnerMost = InnerMost{};
    s: String = "inner";
}

struct Outer {
    m: Middle = Middle{};
    n: Int = 88;
}

contract OptionalDeep {
    optOuter: Outer? = null;

    init() {
        self.optOuter = Outer{
            m: Middle{
                nested: InnerMost{ flag: false },
                s: "deep"
            },
            n: 123
        };
    }
}