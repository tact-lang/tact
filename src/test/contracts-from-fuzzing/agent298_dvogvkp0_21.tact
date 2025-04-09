struct InnerA {
    x: Int?;
    y: Bool?;
}

struct MiddleA {
    inner: InnerA?;
}

struct OuterA {
    middle: MiddleA?;
}

struct TopA {
    outer: OuterA?;
}

contract NullableChain {
    data: TopA;
    init() {
        self.data = TopA{ outer: null };
    }
}