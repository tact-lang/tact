struct DeepNested {
    d1: Bool;
    d2: String?;
}

struct MidNested {
    m1: Int;
    m2: DeepNested;
    m3: String?;
}

struct Outer {
    o1: Int;
    o2: MidNested;
}

contract NestedContract {
    data: Outer;

    init() {
        self.data = Outer{
            o1: 5,
            o2: MidNested{
                m1: 6,
                m2: DeepNested{ d1: true, d2: null },
                m3: null
            }
        };
    }
}