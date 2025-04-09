struct InnerMost {
    z: Int?;
}

struct Mid {
    im: InnerMost?;
}

struct Outer {
    mid: Mid?;
}

contract ChainNullOpt {
    data: Outer?;
    init() {
        self.data = null;
    }
}