struct DeepNested {
    d1: Int;
    d2: Bool?;
}

struct MidNested {
    m1: Int;
    m2: DeepNested;
}

struct Outer {
    o1: MidNested;
}

contract TestContract {
    nested: Outer;

    init() {
        self.nested = Outer{
            o1: MidNested{
                m1: 1,
                m2: DeepNested{ d1: 2, d2: true }
            }
        };
    }
}