struct DeepInner {
    x: Int;
    y: Int?;
}

struct Middle {
    m1: DeepInner;
    m2: Bool;
    m3: String?;
}

struct Outer {
    o1: Middle;
    o2: DeepInner;
}

contract StorageTest {
    store: Outer;

    init() {
        self.store = Outer{
            o1: Middle{
                m1: DeepInner{ x: 1, y: 2 },
                m2: true,
                m3: "test",
            },
            o2: DeepInner{ x: 3, y: null },
        };
    }
}