struct Inner {
    x: Int;
}

struct Outer {
    i: Inner;
}

contract InitInlineNested {
    v: Outer;

    init() {
        self.v = Outer{ i: Inner{x:42} };
    }
}