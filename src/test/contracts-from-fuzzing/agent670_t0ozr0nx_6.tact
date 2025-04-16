struct DeepNested {
    inner1: Int;
    inner2: Int;
}

struct MidNested {
    deep1: DeepNested;
    deep2: DeepNested;
}

struct Outer {
    m1: MidNested;
    m2: MidNested;
}

contract TestContract {
    state: Outer;

    init() {
        self.state = Outer{
            m1: MidNested{
                deep1: DeepNested{inner1: 1, inner2: 2},
                deep2: DeepNested{inner1: 3, inner2: 4},
            },
            m2: MidNested{
                deep1: DeepNested{inner1: 5, inner2: 6},
                deep2: DeepNested{inner1: 7, inner2: 8},
            },
        };
    }
}