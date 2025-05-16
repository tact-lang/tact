struct InnerMost {
    f1: Int?;
    f2: Bool?;
}

struct Middle {
    a: Int;
    b: InnerMost;
    c: Bool?;
}

struct Outer {
    m: Middle;
    d: Int?;
}

contract NestedOptionals {
    storage: Outer;

    init() {
        self.storage = Outer{
            m: Middle{
                a: 1,
                b: InnerMost{
                    f1: null,
                    f2: true,
                },
                c: false,
            },
            d: null,
        };
    }
}