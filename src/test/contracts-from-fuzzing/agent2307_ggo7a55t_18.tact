struct InnerMost {
    val: String?;
}

struct Mid {
    x: Int;
    inner: InnerMost;
}

struct Outer {
    m: Mid?;
}

contract OptionalDeep {
    f: Outer;

    init() {
        self.f = Outer{
            m: Mid{
                x: 123,
                inner: InnerMost{val: "xyz"}
            }
        };
    }
}
