struct InnerMost {
    x: Int?;
}

struct Middle {
    im: InnerMost;
}

struct Outer {
    mid: Middle?;
}

contract OptNest {
    f: Outer;
    init() {
        self.f = Outer{ mid: null };
    }
}