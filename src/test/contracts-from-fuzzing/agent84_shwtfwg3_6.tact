struct InnerMost {
    x: Int = 10;
}

struct Inner {
    z: InnerMost?;
}

struct Outer {
    y: Inner;
}

contract TestContract {
    s: Outer = Outer{ y: Inner{ z: null } };

    init() {
        self.s = Outer{ y: Inner{ z: null } };
    }
}