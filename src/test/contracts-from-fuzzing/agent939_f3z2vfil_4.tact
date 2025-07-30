struct Inner {
    z: Int;
}

struct Outer {
    innerOpt: Inner?;
}

contract TestContract {
    s: Outer;

    init() {
        self.s = Outer{ innerOpt: Inner{ z: 123 } };
    }
}