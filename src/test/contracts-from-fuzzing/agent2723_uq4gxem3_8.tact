struct InnerMost {
    val: Int;
}

struct Inner {
    x: InnerMost;
}

struct Outer {
    y: Inner;
}

contract VeryDeep {
    z: Outer;
    init() {
        self.z = Outer{ y: Inner{ x: InnerMost{ val: 123 } } };
    }
}