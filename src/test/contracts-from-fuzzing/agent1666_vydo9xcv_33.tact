struct Inner {
    x: Int;
}

struct Outer {
    inner: Inner;
}

contract OptOuter {
    outerField: Outer?;

    init() {
        self.outerField = null;
    }
}