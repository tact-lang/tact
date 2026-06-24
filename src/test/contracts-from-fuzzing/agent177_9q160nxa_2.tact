struct DeepInner {
    di1: Int;
    di2: String?;
}

struct Middle {
    m1: Bool;
    m2: DeepInner;
}

struct OuterDeep {
    o1: Middle;
    o2: Int?;
}

contract DeepNestTest {
    store: OuterDeep;
    init() {
        self.store = OuterDeep{
            o1: Middle{ m1: true, m2: DeepInner{ di1: 7, di2: "deep" } },
            o2: null
        };
    }
}