struct Inner {
    val: Int;
}

struct Middle {
    inner: Inner;
}

struct Outer {
    middle: Middle;
}

contract DeepNested {
    s: Outer;

    init() {
        self.s = Outer{middle: Middle{inner: Inner{val: 42}}};
    }
}