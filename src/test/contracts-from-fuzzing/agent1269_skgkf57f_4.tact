struct InnerMost {
    flag: Bool;
    count: Int?;
}

struct Middle {
    v1: Int;
    v2: Int?;
    inn: InnerMost;
}

struct Outer {
    m: Middle;
    tag: Int;
    opt: Bool?;
}

contract ComplexContract {
    persistent: Outer;

    init() {
        self.persistent = Outer{
            m: Middle{
                v1: 12,
                v2: null,
                inn: InnerMost{
                    flag: true,
                    count: 42,
                },
            },
            tag: 7,
            opt: null,
        };
    }
}
