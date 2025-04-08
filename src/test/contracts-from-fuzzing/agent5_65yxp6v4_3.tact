struct Inner {
    z: Int;
}

struct Outer {
    nested: Inner;
}

contract DeepNested {
    val: Outer;
    init() {
        self.val = Outer{ nested: Inner{ z: 42 } };
    }
}