struct Inner {
    x: Int;
}

struct Outer {
    y: Inner;
}

contract Test {
    z: Outer;

    init() {
        self.z = Outer{ y: Inner{ x: 1 } };
    }
}