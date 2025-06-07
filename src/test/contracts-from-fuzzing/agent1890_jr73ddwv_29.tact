struct InnerMost {
    x: Int? = null;
    y: Bool? = null;
}

struct MidLayer {
    a: InnerMost;
    b: InnerMost;
}

struct TopLayer {
    m: MidLayer;
}

contract ManyNestedNulls {
    nested: TopLayer;

    init() {
        self.nested = TopLayer{
            m: MidLayer{
                a: InnerMost{},
                b: InnerMost{}
            }
        };
    }
}