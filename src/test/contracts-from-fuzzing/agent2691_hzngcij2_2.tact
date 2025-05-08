struct DeepNested {
    n1: Int;
    n2: Bool;
    n3: Int?;
}

struct MidNested {
    m1: Int;
    m2: DeepNested;
}

struct OuterNested {
    o1: Int;
    o2: MidNested;
}

contract DeepNestedContract {
    complex: OuterNested;

    init() {
        self.complex = OuterNested{
            o1: 7,
            o2: MidNested{
                m1: 3,
                m2: DeepNested{
                    n1: 1,
                    n2: false,
                    n3: null
                }
            }
        };
    }
}
