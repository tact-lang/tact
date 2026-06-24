struct InnerMost { x: Int; }

struct Inner {
    im: InnerMost?;
}

struct Mid {
    inner: Inner?;
}

struct Outer {
    mid: Mid?;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{ mid: null };
    }
}