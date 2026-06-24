struct Inner {
    a: Int;
}

struct Outer {
    b: Inner;
}

contract UnusedOptionals {
    optInner: Outer?;

    init() {
        self.optInner = null;
    }
}
