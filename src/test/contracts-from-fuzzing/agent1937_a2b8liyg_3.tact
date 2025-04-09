struct DeepInner {
    d1: Int;
    d2: Bool?;
}

struct Middle {
    m1: Int;
    m2: DeepInner;
}

struct Outer {
    o1: Int;
    o2: Middle;
}

contract DeepNestedOptional {
    state: Outer;

    init() {
        self.state = Outer{
            o1: 10,
            o2: Middle{
                m1: 20,
                m2: DeepInner{
                    d1: 30,
                    d2: null,
                }
            }
        };
    }
}
