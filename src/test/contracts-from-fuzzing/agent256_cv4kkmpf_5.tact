struct InnerMost {
    value: Int;
}

struct Middle {
    nested: InnerMost;
}

struct Outer {
    m: Middle;
}

contract MultiNest {
    store: Outer;

    init() {
        self.store = Outer{
            m: Middle{
                nested: InnerMost{
                    value: 123
                }
            }
        };
    }
}