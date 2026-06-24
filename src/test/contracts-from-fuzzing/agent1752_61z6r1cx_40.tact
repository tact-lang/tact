struct Inner {
    x: Int;
    y: Bool;
}

struct Outer {
    inner: Inner;
    z: Int;
}

contract OptOuter {
    outer: Outer?;

    init() {
        self.outer = null;
    }
}