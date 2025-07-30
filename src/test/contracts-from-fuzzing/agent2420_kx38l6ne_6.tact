struct InnerMost {
    x: Int;
    y: Int;
}

struct Mid {
    a: InnerMost;
    b: Int;
}

struct Wrapper {
    m1: Mid;
    m2: Mid;
    flag: Bool;
}

contract DeepNested {
    w: Wrapper;

    init() {
        self.w = Wrapper{
            m1: Mid{
                a: InnerMost{ x:1, y:2 },
                b: 9,
            },
            m2: Mid{
                a: InnerMost{ x:3, y:4 },
                b: 7,
            },
            flag: true,
        };
    }
}