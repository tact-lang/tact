struct Inner {
    a: Int;
}

struct Middle {
    i: Inner;
}

struct Outer {
    m: Middle;
}

contract OptionalOuter {
    data: Outer?;

    init() {
        self.data = null;
    }
}
