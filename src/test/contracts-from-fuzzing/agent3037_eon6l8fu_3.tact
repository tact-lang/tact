struct InnerMost {
    a: Int;
}

struct Middle1 {
    x: InnerMost;
    y: Int;
}

struct Middle2 {
    z: Bool?;
    w: String;
}

struct Outer {
    m1: Middle1;
    m2: Middle2;
}

contract DeepMix {
    data: Outer;
    init() {
        self.data = Outer{
            m1: Middle1{
                x: InnerMost{a: 1},
                y: 2,
            },
            m2: Middle2{
                z: null,
                w: "hi",
            },
        };
    }
}