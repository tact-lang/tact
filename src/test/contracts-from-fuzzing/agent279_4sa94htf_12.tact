struct Deep {
    z: Int;
}

struct Mid {
    d1: Deep;
    d2: Deep;
}

struct Top {
    m: Mid;
    ok: Bool;
}

contract OptionInBetween {
    inner: Top?;

    init() {
        self.inner = null;
    }
}