struct DeepInner {
    x: Int;
    y: Bool?;
}

struct Mid {
    d1: DeepInner;
    d2: DeepInner;
    opt: DeepInner?;
}

contract Test3 {
    m: Mid;

    init() {
        self.m = Mid{
            d1: DeepInner{ x: 10, y: true },
            d2: DeepInner{ x: 20, y: null },
            opt: null
        };
    }
}
