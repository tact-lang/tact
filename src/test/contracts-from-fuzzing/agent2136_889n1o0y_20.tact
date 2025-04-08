struct Inner {
    z: Int;
}

struct Outer {
    y: Inner;
}

contract TestContract {
    s: Outer;

    init() {
        self.s = Outer{ y: Inner{ z: 5 } };
    }
}