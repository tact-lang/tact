struct Inner {
    u: Int?;
    v: Int;
}

struct Outer {
    x: Int;
    y: Inner;
}

contract DeepMix {
    data: Outer;
    init() {
        self.data = Outer{ x: 1, y: Inner{ u: null, v: 42 } };
    }
}