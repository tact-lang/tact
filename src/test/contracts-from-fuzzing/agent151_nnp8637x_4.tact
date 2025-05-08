struct DeepInner {
    x: Int?;
    y: String?;
}

struct Middle {
    d: DeepInner?;
    z: Bool;
}

struct Outer {
    m: Middle?;
    q: Int;
}

contract Test {
    s: Outer;

    init() {
        self.s = Outer{
            m: Middle{
                d: DeepInner{ x: null, y: null },
                z: true,
            },
            q: 100,
        };
    }
}