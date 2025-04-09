struct InnerMost {
    v: Int;
}

struct Mid {
    m: InnerMost;
}

struct Top {
    t: Mid;
}

contract ThreeLayers {
    f: Top;

    init() {
        self.f = Top{ t: Mid{ m: InnerMost{ v: 100 } } };
    }
}