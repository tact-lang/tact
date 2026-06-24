struct InnerMost {
    f1: Bool;
}

struct Inner {
    s: InnerMost;
}

struct Outer {
    m: Inner;
}

contract OptDeepNest {
    data: Outer?;

    init() {
        self.data = null;
    }
}