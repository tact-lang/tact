struct InnerMost {
    f1: Bool;
}

struct Inner {
    f2: InnerMost;
}

struct Outer {
    f3: Inner;
}

contract Complex {
    obj: Outer;

    init() {
        self.obj = Outer{ f3: Inner{ f2: InnerMost{ f1: true } } };
    }
}