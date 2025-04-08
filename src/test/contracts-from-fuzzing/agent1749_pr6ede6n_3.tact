struct DeepInner {
    c: Int?;
}

struct MidLevel {
    b: Int;
    inner: DeepInner;
}

struct TopMost {
    a: Int;
    mid: MidLevel;
}

contract DeepNested {
    payload: TopMost;
    init() {
        self.payload = TopMost{
            a: 1,
            mid: MidLevel{ b: 2, inner: DeepInner{ c: null } }
        };
    }
}