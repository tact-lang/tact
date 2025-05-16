struct DeepInner {
    x: Int;
    y: Bool?;
}

struct Middle {
    inner1: DeepInner;
    inner2: DeepInner;
}

struct Outer {
    m1: Middle;
    m2: Middle;
}

contract NestedStructTest {
    storage: Outer;

    init() {
        self.storage = Outer{
            m1: Middle{ inner1: DeepInner{ x: 1, y: true }, inner2: DeepInner{ x: 2, y: null } },
            m2: Middle{ inner1: DeepInner{ x: 3, y: false }, inner2: DeepInner{ x: 4, y: null } }
        };
    }
}