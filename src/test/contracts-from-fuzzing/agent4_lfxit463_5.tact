struct InnerMost {
    v: Int;
}

struct Middle {
    a: InnerMost;
    b: InnerMost;
}

struct Outer {
    first: Middle;
    second: Middle;
    flag: Bool;
}

contract DeepStorage {
    content: Outer;

    init() {
        self.content = Outer{
            first: Middle{
                a: InnerMost{v: 1},
                b: InnerMost{v: 2},
            },
            second: Middle{
                a: InnerMost{v: 3},
                b: InnerMost{v: 4},
            },
            flag: true,
        };
    }
}