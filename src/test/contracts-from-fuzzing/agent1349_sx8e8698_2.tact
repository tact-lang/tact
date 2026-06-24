struct DeepInner {
    a: Bool;
    b: Int;
}

struct Middle {
    inner1: DeepInner;
    inner2: Bool?;
}

struct Outer {
    m1: Middle;
    m2: Int?;
}

contract DeeplyNestedTest {
    data: Outer;

    init() {
        self.data = Outer{
            m1: Middle{
                inner1: DeepInner{ a: true, b: 15 },
                inner2: null
            },
            m2: null
        };
    }
}